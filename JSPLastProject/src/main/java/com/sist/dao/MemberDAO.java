package com.sist.dao;
import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.vo.*;
import com.sist.commons.*;
public class MemberDAO {
   private static SqlSessionFactory ssf;
   static 
   {
	   ssf=CreateSqlSessionFactory.getSsf();
   }
   /*
    *   <insert id="memberInsert" parameterType="MemberVO">
		    INSERT INTO member VALUES(
		      #{id},
		      #{pwd},
		      #{name},
		      #{sex},
		      #{birthday},
		      #{email},
		      #{post},
		      #{addr1},
		      #{addr2},
		      #{phone},
		      #{content},
		      'n',SYSDATE
		    )
		  </insert>
     */
      public static void memberInsert(MemberVO vo)
      {
    	  SqlSession session=null;
    	  try
    	  {
    		  session=ssf.openSession(true);
    		  // autoCommit(true)
    		  session.insert("memberInsert",vo);
    		  //                      => 한개만 사용이 가능 (VO : ParamterType) => ?
    		  // 한개 => 해당 데이터형 / 여러개 => VO(여기에 있는 변수) , Map(VO에 없는 변수)
    	  }catch(Exception ex)
    	  {
    		  ex.printStackTrace();
    	  }
    	  finally
    	  {
    		  if(session!=null)
    			  session.close();
    	  }
      }
     /*
		  <!-- ID중복 체크 / 로그인 -->
		  <select id="memberIdCheck" resultType="int" parameterType="string">
		     SELECT COUNT(*) 
		     FROM member
		     WHERE id=#{id}
		  </select>
     */
     public static int memberIdCheck(String id)
     {
    	 SqlSession session=null;
    	 int count=0;
   	  try
   	  {
   		  session=ssf.openSession();
   		  // autoCommit(true)
   		  count=session.selectOne("memberIdCheck",id);
   	  }catch(Exception ex)
   	  {
   		  ex.printStackTrace();
   	  }
   	  finally
   	  {
   		  if(session!=null)
   			  session.close();
   	  }
   	  return count;
     }
     /*
		  <!-- 비밀번호 검색 -->
		  <select id="memberGetPassword" resultType="MemberVO" parameterType="string">
		    SELECT id,pwd,name,sex,phone,email,post,addr1,addr2,admin
		    FROM member
		    WHERE id=#{id}>
	 */
     /*
      *   1. selectList(id명) / selectList(id명, Object)
      *   2. selectOne(id명) /  selectOne(id명,Object)
      *   3. insert / update / delete 
      *      => insert(id명,Object)
      */
     public static MemberVO isLogin(String id,String pwd)
     {
    	 SqlSession session=null;
    	 MemberVO vo=new MemberVO();
    	 try
    	 {
    		 session=ssf.openSession();
    		 // 1. ID 존재여부
    		 int count=session.selectOne("memberIdCheck",id);
    		 // 2. Password 확인 
    		 if(count==0)
    		 {
    			 vo.setMsg("NOID");
    		 }
    		 else
    		 {
    			 MemberVO dbVO=session.selectOne("memberGetPassword",id);
    			 if(dbVO.getPwd().equals(pwd))
    			 {
    				 vo.setMsg("OK");
    				 // 로그인 성공 
    				 //////////////////////////////// HttpSession에 저장할 예정
    				 vo.setId(dbVO.getId());
    				 vo.setName(dbVO.getName());
    				 vo.setSex(dbVO.getSex());
    				 // 기본 배송지 
    				 vo.setPhone(dbVO.getPhone());
    				 vo.setAddr1(dbVO.getAddr1());
    				 vo.setAddr2(dbVO.getAddr2());
    				 vo.setPost(dbVO.getPost());
    				 vo.setAdmin(dbVO.getAdmin()); // 관리자 /일반 사용자 
    				 vo.setEmail(dbVO.getEmail()); // 예약 완료 / 회원 가입시 => email전송 예정
    				 ////////////////////////////////
    				 
    			 }
    			 else
    			 {
    				 vo.setMsg("NOPWD");
    			 }
    		 }
    		 
    	 }catch(Exception ex)
    	 {
    		 ex.printStackTrace();
    	 }
    	 finally
    	 {
    		 if(session!=null)
    			 session.close();
    	 }
    	 return vo;
     }
     
}
