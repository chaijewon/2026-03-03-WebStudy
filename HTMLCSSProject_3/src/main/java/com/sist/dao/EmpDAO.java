package com.sist.dao;
import java.util.*;
import java.sql.*;
/*
 *   브라우저 => HTML 
 *       요청 | |
 *   자바 => 오라클 + 브라우저 연결 
 *      | | 응답
 *   오라클 => 데이터 저장 
 */
public class EmpDAO {
   private Connection conn; // 오라클 연결 
   private PreparedStatement ps; // 오라클 통신 (SQL => 저장 데이터 읽기)
   private final String URL="jdbc:oracle:thin:@localhost:1521:XE";
   
   // 1. 드라이버 등록 
   public EmpDAO()
   {
	   try 
	   {
		   Class.forName("oracle.jdbc.driver.OracleDriver");   
	   }catch(Exception ex) 
	   {
		   System.out.println(ex.getMessage());
	   }
   }
   // 2. 오라클 연결 
   public void getConnection()
   {
	   try
	   {
		   conn=DriverManager.getConnection(URL,"hr","happy");
	   }catch(Exception ex) {}
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
   /*
    *    EMPNO                                     NOT NULL NUMBER
		 ENAME                                     NOT NULL VARCHAR2(50)
		 JOB                                       NOT NULL VARCHAR2(50)
		 HIREDATE                                  NOT NULL DATE
		 SAL                                       NOT NULL NUMBER(10,2)
		 DEPTNO                                    NOT NULL NUMBER
		 ISADMIN
    */
   // 4. 기능 수행 => 목록 
   public List<EmpVO> empListData()
   {
	   List<EmpVO> list=new ArrayList<EmpVO>();
	   try
	   {
		   //1. 연결 
		   getConnection();
		   //2. SQL문장 만들기
		   String sql="SELECT empno,ename,job,TO_CHAR(hiredate,'yyyy-mm-dd'),"
				     +"sal,deptno,isadmin "
				     +"FROM emp2 "
				     +"ORDER BY empno ASC";
		   //3. 오라클로 SQL문장 전송 
		   ps=conn.prepareStatement(sql);
		   //4. 결과값을 받는다 
		   ResultSet rs=ps.executeQuery();
		   //5. 결과값을 List에 채운다 
		   while(rs.next())
		   {
			  // 사원 정보 채우기 
			   EmpVO vo=new EmpVO();
			   vo.setEmpno(rs.getInt(1));
			   vo.setEname(rs.getString(2));
			   vo.setJob(rs.getString(3));
			   vo.setDbday(rs.getString(4));
			   vo.setSal(rs.getInt(5));
			   vo.setDeptno(rs.getInt(6));
			   vo.setIsadmin(rs.getString(7));
			   list.add(vo);
		   }
		   rs.close();
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
   public static void main(String[] args) {
	   EmpDAO dao=new EmpDAO();
	   List<EmpVO> list=dao.empListData();
	   for(EmpVO vo:list)
	   {
		   System.out.println(vo.getEmpno()+" "
				  +vo.getEname()+" "
				  +vo.getJob()+" "
				  +vo.getDbday()+" "
				  +vo.getSal());
	   }
   }
}
