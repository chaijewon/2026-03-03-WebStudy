package com.sist.dao;
import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.commons.*;
import com.sist.vo.*;
public class MemberDAO {
  private static SqlSessionFactory ssf;
  static 
  {
	  ssf=CreateSqlSesionFactory.getSsf();
  }
  // 기능 처리 
  /*
   *      <select id="memberIdCount" resultType="int" parameterType="string">
		   SELECT COUNT(*) 
		   FROM member
		   WHERE id=#{id}
		  </select>
		  <select id="memberGetPassword" resultType="MemberVO" parameterType="string">
		   SELECT id,name,pwd
		   FROM member
		   WHERE id=#{id}
		  </select>
   */
  public static MemberVO memberLogin(String id,String pwd)
  {
      MemberVO vo=new MemberVO();
      SqlSession session=ssf.openSession();
      int count=session.selectOne("memberIdCount",id);
      // ID존재 여부 
      if(count==0)
      {
    	  vo.setMsg("NOID");
      }
      else
      {
    	  // ID가 존재 => 비밀번호 => session저장된 데이터를 가지고 온다
    	  MemberVO dbVO=session.selectOne("memberGetPassword",id);
    	  if(pwd.equals(dbVO.getPwd()))
    	  {
    		  vo.setId(dbVO.getId());
    		  vo.setName(dbVO.getName());
    		  vo.setMsg("OK");
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







