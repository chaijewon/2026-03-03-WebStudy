package com.sist.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.commons.CreateSqlSessionFactory;
import java.util.*;
import com.sist.vo.*;
public class JjimDAO {
	  private static SqlSessionFactory ssf;
	  static
	  {
		  ssf=CreateSqlSessionFactory.getSsf();
	  }
	  
	  /*
	   *   <select id="jjimCount" resultType="int" 
		     parameterType="com.sist.vo.JjimVO">
		     SELECT COUNT(*) 
		     FROM jjim
		     WHERE id=#{id} AND fno=#{fno}
		 </select>
	   */
	  public static int jjimCount(JjimVO vo)
	  {
		  SqlSession session=ssf.openSession();
		  int count=session.selectOne("jjimCount",vo);
		  session.close();
		  return count;
	  }
	  /*
	   *   <insert id="jjimInsert" parameterType="com.sist.vo.JjimVO">
		   INSERT INTO jjim VALUES(
		     jjim_jno_seq.nextval,
		     #{fno},
		     #{id},
		     SYSDATE
		   )
		  </insert>
	   */
	  public static void jjimInsert(JjimVO vo)
	  {
		  SqlSession session=ssf.openSession(true);
		  session.insert("jjimInsert",vo);
		  session.close();
		  
	  }
}
