package com.sist.dao;
// 검색 => LIKE 
/*
 *   => SELECT + 페이지 
 *   JSP의 핵심 => 데이터베이스 연동 
 *   --------------------------
 *   **1. 드라이버 등록 => 한번 수행 (생성자) Class.forName(Driver)
 *   **2. 오라클 연결  => Connection conn=
 *                       DriverManager.getConnection(URL,user,pwd)
 *   3. ***SQL문장 생성 => String sql=""; => 오라클 문법 
 *   **4. SQL문장 전송 => PreparedStatement ps=conn.preparedStatement(sql)
 *   **5. 결과값 받기  => ResultSet rs=ps.executeQuery()
 *   **6. List / VO에 값을 담는다 ***while(rs.next())
 *                           {
 *                               FoodVO vo=new FoodVO();
 *                               vo.setName(...)
 *                               
 *                               list.add(vo)
 *                           }
 *   **7. 닫기 : rs.close() 
 *            ps.close() 
 *            conn.close()
 *            
 *   프로젝트 
 *   ------
 *        | 벤치마킹 => 모방 / 없는 기능 => 새로운 사이트
 *     요구사항분석 : 어떤 데이터 필요 / 어느 화면 필요 
 *                --------------  -----------
 *                | 데이터베이스 설계  | 화면 UI 
 *                  ------------- 중복 , 데이터가 한번 여러개 , 결정자가 여러개..
 *                     |             | => 데이터베이스를 쉽게 제어 
 *                     ---------------
 *                        | 구현 => Front / Back
 *     => 분석된 내용이 수행 / 어느 부분이 빠졌는지 => 테스트 
 *     => 배포 : CI/CD 
 */
import java.util.*; // ArrayList , List
import java.sql.*; // Connection / PreparedStatement / ResultSet
public class FoodDAO {
     // 공통으로 사용되는 클래스나 변수 모아서 저장 
	 private Connection conn; // 오라클 연결 객체 
	 private PreparedStatement ps; // 오라클과 송수신 
	 // SQL 전송 / 결과값 받기 
	 private final String URL="jdbc:oracle:thin:@localhost:1521:XE";
	 // 오라클 연결 port (1521) => 실제 저장된 폴더 (table이 저장) => XE
	 // 폴더 : 데이터베이스 (저장 공간) , 테이블 : 파일 
	 // 테이블 => 컬럼 : 멤버변수 , ROW => 객체  
	 //1. 드라이버 등록 
	 public FoodDAO()
	 {
		 try
		 {
			 Class.forName("oracle.jdbc.driver.OracleDriver");
			 // com.mysql.cj.Driver
		 }catch(Exception ex)
		 {
			 ex.printStackTrace();
		 }
	 }
	 //2. 공통 사용 => 연결 / 해제 => 반복 수행 => 메소드화 
	 // MyBatis / Spring => 디자인 패턴 / 알고리즘 => 코딩테스트 
	 //2-1. 연결 
	 //단점 : 1.URL / 2.Username / 3.Password가 노출 => 보안 (ConnectionPool)
	 public void getConnection()
	 {
		 try
		 {
			 conn=DriverManager.getConnection(URL,"hr","happy");
		 }catch(Exception ex) {}
	 }
	 //2-2. 해제
	 public void disConnection()
	 {
		 try
		 {
			 if(ps!=null) ps.close();
			 if(conn!=null) conn.close();
		 }catch(Exception ex) {}
	 }
	 //-------------------------- 공통 기반 
	 //3. 기능 
	 //3-1. 한식 / 양식 / 중식 / 일식 / 분식 
	 /*
	  *   에러 발생 
	  *     --> 소스를 보는 것이 아니다
	  *     --> output 창 => 에러 확인 ex.printStackTrace();
	  *   1. Driver 에러 
	  *   2. SQL문장 
	  *   ------------------> 디버깅 방법 
	  */
	 public List<FoodVO> foodListData(int page,String type)
	 {
		 List<FoodVO> list=new ArrayList<FoodVO>();
		 try
		 {
			 //1. 연결 
			 getConnection();
			 //2. SQL문장 => 오라클 
			 String sql="SELECT no,poster,name "
					   +"FROM food "
					   +"WHERE type LIKE '%'||?||'%' "
					   +"ORDER BY no ASC "
					   +"OFFSET ? ROWS FETCH NEXT 12 ROWS ONLY";
			 //3. 미리 오라클로 SQL문장 전송 
			 ps=conn.prepareStatement(sql);
			 //4. 실행전에 ?에 값을 채운다 
			 ps.setString(1,type); // ps.setString => '한식'
			 ps.setInt(2, (page*12)-12); // OFFSET은 시작하는 번호 => 0번부터
			 //5. 실행 요청 => 결과값을 가지고 와라 => 저장하는 메모리 공간 ResultSet
			 ResultSet rs=ps.executeQuery();
			 //6. 메모리에 출력된 첫번째 데이터 위치에 커서이동 => next()
			 while(rs.next())
			 {
				 FoodVO vo=new FoodVO();
				 // 오라클 데이터는 무조건 String으로 받을 수 있다 
				 vo.setNo(rs.getInt(1));
				 vo.setPoster(rs.getString(2));
				 vo.setName(rs.getString(3)); 
				 // 실수 => rs.getDouble() // rs.getDate()
				 list.add(vo);
			 }
		 }catch(Exception ex)
		 {
			 // 에러 복구 / 에러 위치 
			 ex.printStackTrace();
		 }
		 finally
		 {
			 // 닫기 => 에러 / 정상 => 무조건 수행 
			 disConnection();
		 }
		 return list; // 여기에 채운다 
	 }
	 //3-2. 총페이지 
	 public int foodTotalPage(String type)
	 {
		 int total=0;
		 try
		 {
			 //1. 연결 
			 getConnection();
			 // SQL 스킬 => 튜닝 / 람다식 
			 String sql="SELECT CEIL(COUNT(*)/12.0) "
					   +"FROM food "
					   +"WHERE type LIKE '%'||?||'%'";
			 ps=conn.prepareStatement(sql);
			 ps.setString(1, type);
			 ResultSet rs=ps.executeQuery();
			 rs.next();
			 total=rs.getInt(1);
			 rs.close();
			 
		 }catch(Exception ex)
		 {
			 ex.printStackTrace();
		 }
		 finally
		 {
			 disConnection();
		 }
		 return total;
	 }
	 
	 // 검색 
	 public List<FoodVO> foodFindData(String column,String fd)
	 {
		 List<FoodVO> list=new ArrayList<FoodVO>();
		 try
		 {
			 getConnection();
			 String sql="SELECT no,poster,name "
					   +"FROM food "
					   +"WHERE "+column+" LIKE '%'||?||'%'";
			 // => ? => 실제 데이터값 => '' 
			 // column / table => 문자열 결합 
			 ps=conn.prepareStatement(sql);
			 ps.setString(1, fd);
			 ResultSet rs=ps.executeQuery();
			 while(rs.next())
			 {
				 FoodVO vo=new FoodVO();
				 // 오라클 데이터는 무조건 String으로 받을 수 있다 
				 vo.setNo(rs.getInt(1));
				 vo.setPoster(rs.getString(2));
				 vo.setName(rs.getString(3)); 
				 // 실수 => rs.getDouble() // rs.getDate()
				 list.add(vo);
			 }
		 }catch(Exception ex)
		 {
			 ex.printStackTrace();
		 }
		 finally
		 {
			 disConnection();
		 }
		 return list;
	 }
	 
}





