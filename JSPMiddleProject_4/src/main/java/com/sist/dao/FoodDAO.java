package com.sist.dao;
/*
 *   1. FoodVO 
 *   2. FoodDAO 
 *   3. JSP 
 *   ----------- Model / Controller
 *   
 *   1. JSP ====> MV =====> MVC =====> SpringFramework 
 *                                     | 설정파일 복잡 
 *                                     | ----------- 단순화 Spring-Boot
 *   2. JDBC ====> DBCP =====> MyBatis ======> JPA
 *   3. Oracle ====> MySQL =====> MariaDB 
 *                                | AWS에 설치 => DOCKER
 *  ------------------------------------------------------------
 *   4. Git Action ====> Docker =====> Docker-compose 
 *      ========> 쿠바네티스 =======> JinKins 
 *                        | nginex / ngrook(도메인)
 *   5. javascript(바닐라JS) ===== Jquery(3,4) 
 *                                 | Ajax 
 *                               VueJS 
 *                                 | vuex , pinia 
 *                               ReactJS 
 *                                 | tanstack-query 
 *                                   nodejs / typescript 
 *                                 | redux 
 *   6. Spring AI  
 *   
 *    
 */
/*
 *   JDBC : 시간이 오래 걸린다 / 보안이 취약 
 *   DBCP : JDBC단점 보완 
 *   ------------------- 기반 => MyBatis => iBatis (google 인수)
 *                             --------- iBatis (오픈소스 그룹)
 *                             = XML => JSP(MVC)
 *                             = Annotation => Spring 
 *   | 단점 : 웹에서만 사용이 가능 
 */
import java.util.*;
import java.sql.*;
import javax.sql.*; // DataSource => 데이터베이스의 정보를 가지고 있다 
import javax.naming.*; // Context => 저장 메모리 관리 
/*
 *    1. POOL안에 여러개의 Connection을 저장 (POOL => 저장 메모리 공간) 
 *       maxActive / maxIdle 
 *                   | POOL안에 존재하는 Connection 갯수
 *       | 접근자의 최대 Connection
 *    2. 사용자 요청시에 => POOL에서 Conection을 가지고 온다 
 *    3. Connection => 오라클 접근 
 *    4. PreparedStatement => SQL문장 수행 
 *    5. Connection 객체를 => POOL안으로 반환 (재사용) 
 */
public class FoodDAO {
    private Connection conn;
    private PreparedStatement ps;
    private static FoodDAO dao;
    
    // 1. 미리 연결되어 있는 Connection의 주소를 얻어 온다
    public void getConnection()
    {
    	try
    	{
    		// 저장된 메모리를 가지고 온다 
    		Context init=new InitialContext();
    		// JNDI => directory => 탐색기 => 탐색기 열기 
    		Context c=(Context)init.lookup("java://comp/env");
    		// c드라이버 
    		DataSource ds=(DataSource)c.lookup("jdbc/oracle");
    		// 파일 찾기 : jdbc/oracle
    		conn=ds.getConnection(); // 미리 생성된 Connection 주소를 읽어서 대입
    	}catch(Exception ex) 
    	{
    		ex.printStackTrace();
    	}
    }
    // 2. 사용후에 반환 
    public void disConnection()
    {
    	try
    	{
    		if(ps!=null) ps.close();
    		if(conn!=null) conn.close();
    		// tomcat에서 지원하는 라이브러리 사용 => tomcat-dbcp.jar
    		// conn.close() => POOL안의 반환 
    	}catch(Exception ex) {}
    }
    // 3. 기능 
    // 3-1. 목록
    public List<FoodVO> foodListData(int page)
    {
    	List<FoodVO> list=new ArrayList<FoodVO>();
    	try
    	{
    		getConnection();
    		String sql="SELECT no,poster,name,address "
    				  +"FROM food "
    				  +"ORDER BY no "
    				  +"OFFSET ? ROWS FETCH NEXT 12 ROWS ONLY";
    		ps=conn.prepareStatement(sql);
    		ps.setInt(1, (page*12)-12);
    		ResultSet rs=ps.executeQuery();
    		while(rs.next())
    		{
    			FoodVO vo=new FoodVO();
    			vo.setNo(rs.getInt(1));
    			vo.setPoster(rs.getString(2));
    			vo.setName(rs.getString(3));
    			vo.setAddress(rs.getString(4));
    			
    			list.add(vo);
    		}
    		rs.close();
    	}catch(Exception ex)
    	{
    		// 오류 처리 
    		ex.printStackTrace();
    	}
    	finally
    	{
    		disConnection();
    		// 반환
    	}
    	return list;
    }
    // 3-1-1 총페이지 
    public int foodTotalPage()
    {
    	int total=0;
    	try
    	{
    		getConnection();
    		String sql="SELECT CEIL(COUNT(*)/12.0) FROM food";
    		ps=conn.prepareStatement(sql);
    		ResultSet rs=ps.executeQuery();
    		rs.next();
    		total=rs.getInt(1);
    		rs.close();
    	}catch(Exception ex)
    	{
    		// 오류 처리 
    		ex.printStackTrace();
    	}
    	finally
    	{
    		disConnection();
    		// 반환
    	}
    	return total;
    }
    // 3-2. 상세보기 
}









