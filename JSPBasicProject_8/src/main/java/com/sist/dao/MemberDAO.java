package com.sist.dao;
import java.util.*;
import java.sql.*;
/////////////////// DBCP용 => 라이브러리 
/*
 *    MyBatis 
 *      1. XML 기반 
 *         -------- XML을 수업 => XML 파싱 => Spring구조
 *      2. Annotation 기반 ==> Spring
 *    JQuery 
 *      1. 데이터 읽기 => JSON
 *    -----------------------------------------------
 *    크롤링 => 오라클 => 데이터베이스 설계 / 요구사항 / 정규화 
 *      JSoup / 셀레니움 / PlayWeight
 *      -----            ----------
 *    => Vue / React / Ajax => 크롤링이 불가능 
 *    => data.go.kr / seoul => 이미지
 *    -------------------------------------- 1차 프로젝트 
 *    
 *    기초 
 *     자바 / 오라클 / HTML / CSS / JavaScript / JSP 
 *     나머지 => 라이브러리 => 활용 => 실제 사이트 구축 
 */
import javax.sql.*;

import com.sist.vo.MemberVO;

import javax.naming.*; 
/*
 *   SpringFramework : JSP + MVC 
 *   ---------------------------- 지원하지 않는다 (유지보수) 
 *   SpringBoot + ThymeLeaf + Vue(Pinia) + MyBatis
 *   --------------------------------------------- + CI/CD
 *   SpringBoot+NodeJS+React+JPA+MySQL => 개인 
 *   
 *   => 처음부터 끝까지 (X) 
 *   => 다음에 나올때 
 */
public class MemberDAO {
  /*
   *   DBCP : 데이터베이스 연결시에 가장 시간이 걸린다 
   *          -------------------------------
   *            연결 : 연결 줄이기 위해서 미리 연결한 상태 (속도가 빠르게)
   *            => 몇개 저장 ? maxActive / maxIdle 
   *            => Mybatis => 설정 => default : 8,8
   *   사용법 : 1) server.xml에 등록 => 톰캣이 실행 
   *             ----------- <Resource name="jdbc/oracle">
   *   => 1. 저장된 Connection 주소 읽기 
   *         ------------------------ 
   *         = JDNI => 가상으로 탐색기 형식으로 
   *           java://comp/env ==> C드라이브 => Connection 주소 저장 
   *                                         ------------
   *                                         이름 : jdbc/oracle
   *      2. Connection 주소 대입 
   *         conn=ds.getConnection()
   *   => getConnection() / disConnection() 
   *      주소 읽기            반환 => 재사용이 가능 
   */
	private Connection conn;
	private PreparedStatement ps;
	private static MemberDAO dao; // 싱글턴 
	// => 보안 
	public void getConnection()
	{
		try
		{
			// 연결 => POOL연결 
			Context init=new InitialContext();
			Context c=(Context)init.lookup("java://comp/env");
			DataSource ds=(DataSource)c.lookup("jdbc/oracle");
			// connection 정보 읽기 
			conn=ds.getConnection();
		}catch(Exception ex) 
		{
			ex.printStackTrace();
		}
	}
	public void disConnection()
	{
		try
		{
			if(ps!=null) ps.close();
			if(conn!=null) conn.close();
			// 닫는 것이 아니라 => POOL안으로 반환 => 재사용이 가능 
			// POOL => Connection 객체 저장 메모리 공간 
			// Connection갯수를 제어할 수 있다 
			// 많이 생성이 되면 서버 부하가 있다 
		}catch(Exception ex) {}
	}
	public static MemberDAO newInstance()
	{
		if(dao==null)
			dao=new MemberDAO();
		return dao;
	}
	////////////// 기본 설정 
	// 기능 설정 => 연결 / 반환 
	public MemberVO memberLogin(String id,String pwd)
	{
		MemberVO vo=new MemberVO();
		try
		{
			// 1. Connection 주소값 읽기 
			getConnection();
			// 2. SQL제작 
			String sql="SELECT COUNT(*) FROM member "
					  +"WHERE id=?";
			// 3. SQL문장을 오라클로 전송 
			ps=conn.prepareStatement(sql);
			// 4. ?가 있는 경우에 값을 채운다 => SQL Injection 
			ps.setString(1, id); // ?는 앞에서부터 1 2 3...
			// 5. 결과값 
			ResultSet rs=ps.executeQuery();
			rs.next();
			int count=rs.getInt(1);
			rs.close();
			//////////////////// ID 존재여부 확인 
			if(count==0)
			{
				vo.setMsg("NOID"); //id가 없는 경우 
			}
			else // id가 있는 경우
			{
				sql="SELECT id,name,pwd,isadmin,post,addr1,addr2,phone "
				   +"FROM member "
				   +"WHERE id=?";
				ps=conn.prepareStatement(sql);
				ps.setString(1, id);
				rs=ps.executeQuery();
				rs.next();
				String db_id=rs.getString(1);
				String name=rs.getString(2);
				String db_pwd=rs.getString(3);
				String isadmin=rs.getString(4);
				String post=rs.getString(5);
				String addr1=rs.getString(6);
				String addr2=rs.getString(7);
				String phone=rs.getString(8);
				// 로그인시에 Session에 하는 사용자의 정보를 가지고 온다 
				// 배송지의 문제 
				if(pwd.equals(db_pwd))
				{
					// 로그인 
					vo.setId(db_id);
					vo.setIsadmin(isadmin);
					vo.setName(name);
					vo.setPhone(phone);
					vo.setAddr1(addr1);
					vo.setAddr2(addr2);
					vo.setPost(post);
					vo.setMsg("OK");
				}
				else
				{
					// 비번이 틀린 경우
					vo.setMsg("NOPWD");
				}
				rs.close();
			}
			
		}catch(Exception ex)
		{
			// 오류 처리 
			ex.printStackTrace();
		}
		finally
		{
			// 반환 
			disConnection();
		}
		return vo;
	}
}



