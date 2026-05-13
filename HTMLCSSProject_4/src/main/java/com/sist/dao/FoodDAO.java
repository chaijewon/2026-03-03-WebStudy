package com.sist.dao;
import java.util.*;
import java.sql.*;
/*
 *   1. 드라이버 등록 : 한번 수행 => 생성자 
 *      Class.forName("드라이버명")
 *   2. 반복 
 *      오라클 연결 === 처리 === 오라클 닫기 
 *      ------------------------------ DDOS
 *   3. 오라클 연결 
 *      => conn=DriverManager.getConnection()
 *              --------------------------- sqlplus열기 
 *              conn hr/happy => 오라클로 전송 
 *   4. 오라클 닫기 
 *      => ps.close() / conn.close() 
 *   ----------------------------------- 공통으로 적용 
 *   ** 모든 개발자가 동일하게 코딩 : 표준화 
 *      SQL문장 => 익히는데 주력 
 *   5. 테이블에 따라 기능만 달라 진다 
 *   ** 웹 : ==> 70% 오라클 연동 / 20% 화면 디자인 / 10% 자바스크립트 
 *                                             | websocket 
 *   
 */
public class FoodDAO {
   // 필요한 객체 => 공통으로 사용 
   private Connection conn;
   private PreparedStatement ps;
   private final String URL="jdbc:oracle:thin:@localhost:1521:XE";
   
   // 1. 드라이버 등록 
   public FoodDAO()
   {
	   try
	   {
		   Class.forName("oracle.jdbc.driver.OracleDriver");
	   }catch(Exception ex){
		   ex.printStackTrace();
	   }
   }
   /*
    *    같은 소스가 계속 반복 
    *    => 메소드 
    *    ------------------ 여러개 클래스에서 사용 
    *    => 클래스 
    *    ------------------ 공통 모듈 : AOP(자동 호출) 
    */
   // 2. 오라클 연결 
   public void getConnection()
   {
	   try
	   {
		   conn=DriverManager.getConnection(URL,"hr","happy");
	   }catch(Exception ex){}
   }
   // 3. 오라클 해제 
   public void disConnection()
   {
	   try
	   {
		   if(ps!=null) ps.close();
		   if(conn!=null) conn.close();
	   }catch(Exception ex) {}
   }
   // 4. 기능 
   // 4-1. 목록 => 페이지 => 한파일에 12개 출력 
   /*
    *   FoodVO => 맛집 한개에 정보 
    *   ----------------------- 12개 담아서 브라우저로 전송 => List
    */
   // 사용자가 맛집 12개를 보여라 
   public List<FoodVO> foodListData(int page)
   {
	   // 매개변수는 사용자가 보내준다 
	   List<FoodVO> list=new ArrayList<FoodVO>();
	   try
	   {
		   // 1. 오라클 연결 
		   getConnection();
		   // 2. SQL문장 제작 => 오라클로 보낸다 
		   String sql="SELECT no,poster,name "
				     +"FROM food "
				     +"ORDER BY no ASC "
				     +"OFFSET ? ROWS FETCH NEXT 12 ROWS ONLY";
		             // MySQL => LIMIT ?,12
		   // 3. 오라클 전송 
		   ps=conn.prepareStatement(sql); 
		   // 4. ?가 있는 경우 값을 채운다 
		   ps.setInt(1, (page*12)-12); 
		   /*
		    *   1page => 0
		    *   2page => 12
		    *   3page => 24
		    */
		   // 5. 실행후에 값을 받는다 
		   ResultSet rs=ps.executeQuery();
		   // 6. 결과값을 List에 담는다 
		   // => 출력물 가장위에 커서를 이동한다 next()
		   while(rs.next())
		   {
			   FoodVO vo=new FoodVO();
			   vo.setNo(rs.getInt(1));
			   vo.setPoster(rs.getString(2));
			   vo.setName(rs.getString(3));
			   
			   list.add(vo);
		   }
		   rs.close();
	   }catch(Exception ex)
	   {
		   ex.printStackTrace(); // 에러 출력 
	   }
	   finally
	   {
		   disConnection(); // 닫기 
	   }
	   return list;
   }
   // 4-1-1. 총페이지 
   public int foodTotalPage()
   {
	   int total=0;
	   try
	   {
		   // 1. 연결 
		   getConnection();
		   // 2. SQL 
		   String sql="SELECT CEIL(COUNT(*)/12.0) FROM food";
		   // 3. SQL=>오라클 전송 
		   ps=conn.prepareStatement(sql);
		   // 4. 실행후에 결과값 받기 
		   ResultSet rs=ps.executeQuery();
		   // 커서 이동 => 데이터가 출력된 위치 
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
   // 4-2. 상세보기 
}




