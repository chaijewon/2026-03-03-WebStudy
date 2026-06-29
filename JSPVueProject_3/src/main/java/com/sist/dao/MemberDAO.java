package com.sist.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.commons.CreateSqlSessionFactory;
import java.util.*;
import com.sist.vo.*;
public class MemberDAO {
	  private static SqlSessionFactory ssf;
	  static
	  {
		  ssf=CreateSqlSessionFactory.getSsf();
	  }
	  /*
	   *   <select id="memberIdCount" resultType="int" parameterType="string">
		     SELECT COUNT(*) 
		     FROM member
		     WHERE id=#{id}
		   </select>
		   <select id="memberInfoData" resultType="MemberVO" 
		      parameterType="string">
		     SELECT id,name,isadmin,pwd
		     FROM member
		     WHERE id=#{id}   
		   </select>
	   */
	  public static MemberVO isLogin(String id,String pwd)
	  {
		  SqlSession session=ssf.openSession();
		  MemberVO vo=new MemberVO();
		  int count=session.selectOne("memberIdCount",id);
		  if(count==0)
		  {
			  vo.setMsg("NOID");
		  }
		  else
		  {
			  MemberVO dbVO=session.selectOne("memberInfoData",id);
			  if(pwd.equals(dbVO.getPwd()))
			  {
				  vo.setMsg("OK");
				  vo.setId(dbVO.getId());
				  vo.setName(dbVO.getName());
				  vo.setIsadmin(dbVO.getIsadmin());
				  // session에 저장 
			  }
			  else
			  {
				  vo.setMsg("NOPWD");
			  }
		  }
		  session.close();
		  return vo;
	  }
}
