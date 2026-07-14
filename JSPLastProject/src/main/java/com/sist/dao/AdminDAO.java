package com.sist.dao;
import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.commons.*;
import com.sist.vo.*;
public class AdminDAO {
  private static SqlSessionFactory ssf;
  static
  {
	  ssf=CreateSqlSessionFactory.getSsf();
  }
  /*
   *     <select id="memberListData" resultType="MemberVO" parameterType="int">
		   SELECT id,name,sex,addr1,phone,grade
		   FROM member
		   WHERE admin!='y'
		   ORDER BY regdate DESC
		   OFFSET #{start} ROWS FETCH NEXT 10 ROWS ONLY
		  </select>
   */
   public static List<MemberVO> memberListData(int start)
   {
	   SqlSession session=ssf.openSession();
	   List<MemberVO> list=session.selectList("memberListData",start);
	   session.close();
	   return list;
   }
  /*
		  <select id="memberTotalPage" resultType="int">
		   SELECT CEIL(COUNT(*)/10.0)
		   FROM member
		  </select>
   */
   public static int memberTotalPage()
   {
	   SqlSession session=ssf.openSession();
	   int total=session.selectOne("memberTotalPage");
	   session.close();
	   return total;
   }
   /*
    *   <update id="memberGradeChange" parameterType="MemberVO">
		    UPDATE member SET 
		    grade=#{grade}
		    WHERE id=#{id}
		  </update>
    */
   // insert / update / delete => return형 : int
   
   public static int memberGradeChange(MemberVO vo)
   {
	   SqlSession session=ssf.openSession(true);
	   int count=session.update("memberGradeChange",vo);
	   session.close();
	   return count;
   }
   
}
