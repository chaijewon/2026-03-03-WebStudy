package com.sist.dao;
import java.util.*; // Collection => List => 데이터를 모아서 저장 => 전송 
import java.sql.*; // 오라클 연동 => Connection/Statement/ResultSet
/*
 *   1. 드라이버 등록 : 한번만 수행 => 생성자에서 처리 
 *   2. 오라클 연결  --------------------
 *   3. SQL을 전송                     |
 *   4. 결과값 읽기                     |  ===> 반복수행 => 반복제거 (메소드)
 *   5. List에 값을 채운다              |
 *   6. 닫기       ---------------------
 *   
 *   => SQL문장만 다르다 => SQL제작하는 연습이 필수 
 *                      -------------------- MyBatis / JPA (SQL)
 */
public class BoardDAO {
   // 클래스 전체에서 필요한 객체 / 변수 / 상수 선언 위치 
   private Connection conn; // 오라클 연결 
   private PreparedStatement ps; // 송수신 
   private final String URL="jdbc:oracle:thin:@localhost:1521:XE";
   // 드라이버 등록 
   public BoardDAO()
   {
	   try
	   {
		   Class.forName("oracle.jdbc.driver.OracleDriver");
		   // 리플렉션 : 클래스이름로 제어 
		   // => 메모리 할당 / 멤버변수 설정 / 생성자 / 메소드 호출 
		   // => MyBatis / Spring 
		   // => 설정 파일 : XML , 구분 : Annotation 
	   }catch(Exception ex) 
	   {
		   ex.printStackTrace();
	   }
   }
   // 연결 => 반복 
   /*
    *   1. 사용하는 변수 => 보안 (private)
    *   2. 클래스 / 생성자 / 메소드 => 다른 클래스 연결 => public 
    */
   public void getConnection()
   {
	   try
	   {
		   conn=DriverManager.getConnection(URL,"hr","happy");
		   // => 오라클로 전송 => conn hr/happy
		   // sqlplus를 열어준다 
		   /*
		    *       DriverManager 
		    *            |
		    *    -------------------------
		    *    |       |       |       |
		    *   oracle mysql   mariadb  mssql => 금융권 , 공기업 , 학교 
		    *                                    ------------------
		    *                                    DB2 
		    *   => 연습용 : sqlite(소형) => 핸드폰 / 브라우저에도 내장 
		    */
	   }catch(Exception ex) {}
   }
   // 해제 => 반복
   
   /*
    *     Connection
    *        |
    *     Statement 
    *        |
    *     ResultSet 
    *    -------------------- 
    *     ResultSet : 데이터 저장하는 메모리 공간 => SQL문장에 따라 다르다
    *        |        => 전역으로 사용하면 안된다 => 지역
    *     Statement 
    *        |
    *     Connection
    */
   public void disConnection()
   {
	   try
	   {
		   if(ps!=null) ps.close(); // 통신 => OutputStream / BufferedReader
		   if(conn!=null) conn.close(); // 연결 => Socket
		   // TCP 프로그램 
	   }catch(Exception ex) {}
   }
   // 해당 기능 설정
   // 목록 / 상세보기 / 추가 / 수정 / 삭제 => CRUD
   // 1. 목록 => 페이징 (한번에 볼수 있는 화면) => 테이블 : 10~20사이 , 이미지 : 12~20
   // => 소량 : 이전 / 다음 , 대량 : 블록별 처리 1 2 3 4 5...
   // => 면접의 단골 (인라뷰 , OFFSET)
   // 게시물 => 게시물 1개 BoardVO / 10개 => BoradVO여러개 저장 => 객체 저장 :
   // 배열 (고정) / List (가변)
   public List<BoardVO> boardListData(int page)
   {
	   // 사용자가 원하는 페이지 전송 => 해당 페이지를 오라클에서 가지고 와서 전송 
	   // => 출력에 필요한 내용 : 리턴형 
	   // => 사용자부터 받는 값 : 매개변수 
	   List<BoardVO> list=new ArrayList<BoardVO>();
	   // java.sql / java.io / java.net => 예외처리가 필요 (CheckException)
	   try
	   {
		   // 정상 수행 문장 
		   // 1. 오라클 연결 
		   getConnection();
		   // 2. SQL문장 : String 
		   String sql="SELECT no,subject,name,TO_CHAR(regdate,'yyyy-mm-dd'),hit "
				     +"FROM jspBoard "
				     +"ORDER BY no DESC "
				     +"OFFSET ? ROWS FETCH NEXT 10 ROWS ONLY"; //12C
		   //          LIMIT ? , 10 
		   /*
		    *     SELECT no,subject,name,TO_CHAR(regdate,'yyyy-mm-dd'),hit,num
		    *     FROM (SELECT no,subject,name,regdate,hit,rownum as num
		    *     FROM (SELECT no,subject,name,regdate,hit
		    *     FROM jspBoard ORDER BY no DESC))
		    *     WHERE num BETWEEN ? AND ? => 인라인 뷰 
		    */
				   
		   // 3. SQL문장 전송 
		   ps=conn.prepareStatement(sql);
		   // 4. ?에 값을 채운다 
		   ps.setInt(1, (page*10)-10);  // 0번 0 10 20...
		   // 정수 setInt() / 실수 setDouble() / 문자 setString() 
		   // 날짜 => 예약일  setDate()
		   // 날짜 , 문자 => 자동으로 ''
		   // 5. 오라클에 명령 => SQL실행한 결과 읽기 
		   ResultSet rs=ps.executeQuery();
		   // 6. List/VO에 값을 채운다 
		   /*
		    *       ------------------------------------
		    *         no   subject  name  regdate   hit
		    *       ------------------------------------
		    *         1      ...    ...   ...       ...  | => next
		    *       ------------------------------------
		    *         2      ...    ...   ...       ...
		    *       ------------------------------------
		    *         3      ...    ...   ...       ...  | => previous
		    *       ------------------------------------
		    *        정수 : getInt()
		    *        실수 : getDouble()
		    *        문자 : getString()
		    *        날짜 : getDate()
		    *        
		    *        getInt(String) getInt(int) 
		    *                       ----------- index 
		    *        --------------
		    *          컬럼명도 가능   => rs.getInt(1) , rs.getInt("no")
		    *       메모리 => 커서 |
		    *       
		    *       ResultSet => 단위가 Record 단위 => 한줄 전체를 읽어 온다 
		    */
		   while(rs.next()) // 출력물 처음부터 => 한줄씩 내려가면서 값을 읽어 온다 
		   {
			   BoardVO vo=new BoardVO();
			   vo.setNo(rs.getInt(1));
			   vo.setSubject(rs.getString(2));
			   vo.setName(rs.getString(3));
			   vo.setDbday(rs.getString(4));
			   vo.setHit(rs.getInt(5));
			   
			   // 10개씩 저장 => VO을 저장하는 클래스 => List / 배열 
			   list.add(vo);
		   }
		   // 7. ResultSet 닫기 
		   rs.close();
	   }catch(Exception ex)
	   {
		   // 에러 복구 => 에러 확인 => 소스 수정 
		   ex.printStackTrace();
	   }
	   finally
	   {
		   disConnection(); // 닫기 (무조건) => IO / Server
	   }
	   return list;
   }
   // 1-1. 총페이지 구하기 => 번호를 순차적으로 
   public int boardRowCount()
   {
	   int count=0;
	   try
	   {
		   getConnection();
		   String sql="SELECT COUNT(*) FROM jspBoard";
		   ps=conn.prepareStatement(sql);
		   ResultSet rs=ps.executeQuery();
		   rs.next();
		   count=rs.getInt(1);
		   rs.close();
	   }catch(Exception ex)
	   {
		   ex.printStackTrace();
	   }
	   finally
	   {
		   disConnection();
	   }
	   return count;
   }
   // 상세보기 => WHERE 
   public BoardVO boardDetailData(int no)
   {
	   BoardVO vo=new BoardVO();
	   try
	   {
		   getConnection();
		   String sql="UPDATE jspBoard SET "
				     +"hit=hit+1 "
				     +"WHERE no=?";
		   ps=conn.prepareStatement(sql);
		   ps.setInt(1, no);
		   ps.executeUpdate();
		   // 조회수 증가 
		   
		   // 게시물 읽기 
		   sql="SELECT no,name,subject,content,hit,"
			  +"TO_CHAR(regdate,'yyyy-mm-dd hh24:mi:ss') "
			  +"FROM jspBoard "
			  +"WHERE no=?";
		   
		   ps=conn.prepareStatement(sql);
		   ps.setInt(1, no);
		   ResultSet rs=ps.executeQuery();
		   // 커서를 데이터 있는 위치로 이동 
		   rs.next();
		   
		   vo.setNo(rs.getInt(1));
		   vo.setName(rs.getString(2));
		   vo.setSubject(rs.getString(3));
		   vo.setContent(rs.getString(4));
		   vo.setHit(rs.getInt(5));
		   vo.setDbday(rs.getString(6));
		   
		   rs.close();
		   // 기능 수행 => SQL문장이 한개가 아닌 경우도 있다 
	   }catch(Exception ex)
	   {
		   ex.printStackTrace();
	   }
	   finally
	   {
		   disConnection();
	   }
	   return vo;
   }
   // 추가 => INSERT ==> 자바는 AutoCommit
   public void boardInsert(BoardVO vo)
   {
	   try
	   {
		   getConnection();
		   String sql="INSERT INTO jspBoard(name,subject,content,pwd) "
				     +"VALUES(?,?,?,?)";
		   ps=conn.prepareStatement(sql);
		   // ?에 값을 채운다 
		   ps.setString(1, vo.getName());
		   ps.setString(2, vo.getSubject());
		   ps.setString(3, vo.getContent());
		   ps.setString(4, vo.getPwd());
		   // 실행후에 Commit 수행
		   ps.executeUpdate();
	   }catch(Exception ex)
	   {
		   ex.printStackTrace();
	   }
	   finally
	   {
		   disConnection();
	   }
   }
   // 수정 => UPDATE
   public BoardVO boardUpdateData(int no)
   {
	   BoardVO vo=new BoardVO();
	   try
	   {
		   getConnection();
		   String sql="SELECT no,name,subject,content "
				     +"FROM jspBoard "
				     +"WHERE no=?";
		   ps=conn.prepareStatement(sql);
		   ps.setInt(1, no);
		   ResultSet rs=ps.executeQuery();
		   rs.next();
		   vo.setNo(rs.getInt(1));
		   vo.setName(rs.getString(2));
		   vo.setSubject(rs.getString(3));
		   vo.setContent(rs.getString(4));
		   rs.close();
	   }catch(Exception ex)
	   {
		   ex.printStackTrace();
	   }
	   finally
	   {
		   disConnection();
	   }
	   return vo;
   }
   // 실제 수정 
   public boolean boardUpdate(BoardVO vo)
   {
	   boolean bCheck=false;
	   try
	   {
		   // 비밀번호 검색 => 맞는 경우에 수정 
		   getConnection();
		   String sql="SELECT pwd FROM jspBoard "
				     +"WHERE no=?";
		   ps=conn.prepareStatement(sql);
		   ps.setInt(1, vo.getNo());
		   ResultSet rs=ps.executeQuery();
		   rs.next();
		   String db_pwd=rs.getString(1);
		   rs.close();
		   
		   if(db_pwd.equals(vo.getPwd()))
		   {
			   bCheck=true;
			   sql="UPDATE jspBoard SET "
				  +"name=?,subject=?,content=? "
				  +"WHERE no=?";
			   ps=conn.prepareStatement(sql);
			   // ?에 값을 채운다 
			   ps.setString(1, vo.getName());
			   ps.setString(2, vo.getSubject());
			   ps.setString(3, vo.getContent());
			   ps.setInt(4, vo.getNo());
			   ps.executeUpdate();
		   }
	   }catch(Exception ex)
	   {
		   ex.printStackTrace();
	   }
	   finally
	   {
		   disConnection();
	   }
	   return bCheck;
   }
   // 삭제 => DELETE
   public boolean boardDelete(int no,String pwd)
   {
	   boolean bCheck=false;
	   try
	   {
		   getConnection();
		   // 1. 비밀번호 검색 
		   String sql="SELECT pwd FROM jspBoard "
				     +"WHERE no=?";
		   ps=conn.prepareStatement(sql);
		   ps.setInt(1, no);
		   ResultSet rs=ps.executeQuery();
		   rs.next();
		   String db_pwd=rs.getString(1);
		   rs.close();
		   
		   if(db_pwd.equals(pwd))
		   {
			   bCheck=true;
			   sql="DELETE FROM jspBoard "
				  +"WHERE no=?";
			   ps=conn.prepareStatement(sql);
			   ps.setInt(1, no);
			   ps.executeUpdate();
		   }
		   // 2. 맞으면 => 삭제 
	   }catch(Exception ex)
	   {
		   ex.printStackTrace();
	   }
	   finally
	   {
		   disConnection();
	   }
	   return bCheck;
   }
   // JOIN / SUBQUERY / VIEW / INDEX / PROCEDURE / TRIGGER 
   public List<EmpVO> empListData(int page)
   {
	   // 사용자가 원하는 페이지 전송 => 해당 페이지를 오라클에서 가지고 와서 전송 
	   // => 출력에 필요한 내용 : 리턴형 
	   // => 사용자부터 받는 값 : 매개변수 
	   List<EmpVO> list=new ArrayList<EmpVO>();
	   // java.sql / java.io / java.net => 예외처리가 필요 (CheckException)
	   try
	   {
		   // 정상 수행 문장 
		   // 1. 오라클 연결 
		   getConnection();
		   // 2. SQL문장 : String 
		   String sql="SELECT empno,ename,job,TO_CHAR(hiredate,'yyyy-mm-dd'),TO_CHAR(sal,'99,999') "
				     +"FROM emp2 "
				     +"ORDER BY empno ASC "
				     +"OFFSET ? ROWS FETCH NEXT 10 ROWS ONLY"; //12C
		   //          LIMIT ? , 10 
		   /*
		    *     SELECT no,subject,name,TO_CHAR(regdate,'yyyy-mm-dd'),hit,num
		    *     FROM (SELECT no,subject,name,regdate,hit,rownum as num
		    *     FROM (SELECT no,subject,name,regdate,hit
		    *     FROM jspBoard ORDER BY no DESC))
		    *     WHERE num BETWEEN ? AND ? => 인라인 뷰 
		    */
				   
		   // 3. SQL문장 전송 
		   ps=conn.prepareStatement(sql);
		   // 4. ?에 값을 채운다 
		   ps.setInt(1, (page*10)-10);  // 0번 0 10 20...
		   // 정수 setInt() / 실수 setDouble() / 문자 setString() 
		   // 날짜 => 예약일  setDate()
		   // 날짜 , 문자 => 자동으로 ''
		   // 5. 오라클에 명령 => SQL실행한 결과 읽기 
		   ResultSet rs=ps.executeQuery();
		   // 6. List/VO에 값을 채운다 
		   /*
		    *       ------------------------------------
		    *         no   subject  name  regdate   hit
		    *       ------------------------------------
		    *         1      ...    ...   ...       ...  | => next
		    *       ------------------------------------
		    *         2      ...    ...   ...       ...
		    *       ------------------------------------
		    *         3      ...    ...   ...       ...  | => previous
		    *       ------------------------------------
		    *        정수 : getInt()
		    *        실수 : getDouble()
		    *        문자 : getString()
		    *        날짜 : getDate()
		    *        
		    *        getInt(String) getInt(int) 
		    *                       ----------- index 
		    *        --------------
		    *          컬럼명도 가능   => rs.getInt(1) , rs.getInt("no")
		    *       메모리 => 커서 |
		    *       
		    *       ResultSet => 단위가 Record 단위 => 한줄 전체를 읽어 온다 
		    */
		   while(rs.next()) // 출력물 처음부터 => 한줄씩 내려가면서 값을 읽어 온다 
		   {
			   EmpVO vo=new EmpVO();
			   vo.setEmpno(rs.getInt(1));
			   vo.setEname(rs.getString(2));
			   vo.setJob(rs.getString(3));
			   vo.setDbday(rs.getString(4));
			   vo.setSal2(rs.getString(5));
			   
			   // 10개씩 저장 => VO을 저장하는 클래스 => List / 배열 
			   list.add(vo);
		   }
		   // 7. ResultSet 닫기 
		   rs.close();
	   }catch(Exception ex)
	   {
		   // 에러 복구 => 에러 확인 => 소스 수정 
		   ex.printStackTrace();
	   }
	   finally
	   {
		   disConnection(); // 닫기 (무조건) => IO / Server
	   }
	   return list;
   }
   public int empTotalPage()
   {
	   int count=0;
	   try
	   {
		   getConnection();
		   String sql="SELECT CEIL(COUNT(*)/10.0) FROM emp2";
		   ps=conn.prepareStatement(sql);
		   ResultSet rs=ps.executeQuery();
		   rs.next();
		   count=rs.getInt(1);
		   rs.close();
	   }catch(Exception ex)
	   {
		   ex.printStackTrace();
	   }
	   finally
	   {
		   disConnection();
	   }
	   return count;
   }
}









