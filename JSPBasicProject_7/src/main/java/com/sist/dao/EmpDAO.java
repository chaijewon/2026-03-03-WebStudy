package com.sist.dao;
import java.util.*;
import java.sql.*;
import javax.sql.*;// DataSource : 데이터베이스 정보를 가지고 있는 클래스
import javax.naming.*; // Context => 이름으로 객체를 생성 
// 이름으로 객체 찾는 경우 => lookup("mydb") => 객체를 찾는다 
// JNDI 
// Pool => 메모리 공간 => java://comp/env => c:\\
/*
 *   <Resource 
          driverClassName="oracle.jdbc.driver.OracleDriver"
          url="jdbc:oracle:thin:@localhost:1521:XE"
          username="hr"
          password="happy"
          maxActive="10"
          maxIdle="10"
          maxWait="-1"
          auth="Container"
          name="jdbc/oracle"
          type="javax.sql.DataSource"
        />
 */
public class EmpDAO {
   private Connection conn;
   private PreparedStatement ps;
   private static EmpDAO dao;
   // => 미리 생성된 Connection 객체의 주소값 얻기 
   // DBCP => 웹에서만 사용이 가능 => 관리를 톰캣이 한다 
   public void getConnection()
   {
	   try
	   {
		   // 탐색기 형식으로 저장 JNDI (java naming directory interface)
		   // 1. 탐색기를 연다 
		   Context init=new InitialContext();
		   // 2. C드라이버 클릭 
		   Context c=(Context)init.lookup("java://comp/env");
		   // => connection 객체가 들어가 있다
		   // 3. 해당 파일을 얻는다 
		   DataSource ds=(DataSource)c.lookup("jdbc/oracle");
		   // 4. Connection 저장 
		   conn=ds.getConnection();
	   }catch(Exception ex) 
	   {
		   ex.printStackTrace();
	   }
   }
   // => Pool안으로 반환 => 재사용 
   public void disConnection()
   {
	   try
	   {
		   if(ps!=null) ps.close();
		   if(conn!=null) conn.close(); // 가짜 => 반환 
	   }catch(Exception ex) {}
   }
   // 싱글턴 
   public static EmpDAO newInstance()
   {
	   if(dao==null)
		   dao=new EmpDAO();
	   return dao;
   }
   // 기능 
   public List<EmpBean> empListData()
   {
	   List<EmpBean> list=new ArrayList<EmpBean>();
	   try
	   {
		   // 주소값 얻기 
		   getConnection();
		   String sql="SELECT empno,ename,job,TO_CHAR(hiredate,'yyyy-MM-dd'),sal "
				     +"FROM emp "
				     +"ORDER BY empno ASC";
		   ps=conn.prepareStatement(sql); //  SQL문장 전송 
		   // 실행후에 결과값 받기 
		   ResultSet rs=ps.executeQuery();
		   while(rs.next())
		   {
			   EmpBean vo=new EmpBean();
			   vo.setEmpno(rs.getInt(1));
			   vo.setEname(rs.getString(2));
			   vo.setJob(rs.getString(3));
			   vo.setDbday(rs.getString(4));
			   vo.setSal(rs.getInt(5));
			   
			   list.add(vo);
		   }
		   rs.close();
	   }catch(Exception ex)
	   {
		   ex.printStackTrace();
	   }
	   finally
	   {
		   disConnection();// 반환 (사용후) => 다른 사람이 사용이 가능 
	   }
	   return list;
   }
   
}
