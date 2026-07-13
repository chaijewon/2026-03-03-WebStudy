package com.sist.dao;
import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.commons.*;
import com.sist.vo.*;
public class LikeDAO {
   private static SqlSessionFactory ssf;
   static 
   {
	   ssf=CreateSqlSessionFactory.getSsf();
   }
   /*
    *     <insert id="likeOn" parameterType="LikeVO">
		   INSERT INTO mylike VALUES(
		     like_lno_seq.nextval,
		     #{fno},
		     #{id}
		   )
		  </insert>
  */
     public static void likeOn(LikeVO vo)
     {
    	 SqlSession session=ssf.openSession(true);
    	 session.insert("likeOn",vo);
    	 session.close();
     }
   /*
		  <delete id="likeOff" parameterType="int">
		   DELETE FROM mylike
		   WHERE lno=#{lno}
		  </delete>
   */
     public static void likeOff(LikeVO vo)
     {
    	 SqlSession session=ssf.openSession(true);
    	 session.delete("likeOff",vo);
    	 session.close();
     }
    /*
		  <select id="likeCount" resultType="int" parameterType="int">
		    SELECT COUNT(*) 
		    FROM mylike 
		    WHERE fno=#{fno}
		  </select>
     */
     public static int likeCount(int fno)
     {
    	 SqlSession session=ssf.openSession(true);
    	 int count=session.selectOne("likeCount",fno);
    	 session.close();
    	 return count;
     }
     /*
		  <select id="likeCheck" resultType="int" parameterType="LikeVO">
		    SELECT COUNT(*)
		    FROM mylike
		    WHERE fno=#{fno} AND id=#{id}
		  </select>
    */
     public static int likeCheck(LikeVO vo)
     {
    	 SqlSession session=ssf.openSession(true);
    	 int count=session.selectOne("likeCheck",vo);
    	 session.close();
    	 return count;
     }
     /*
      *   <update id="foodLikeUpdate" parameterType="int">
		    UPDATE food SET 
		    likecount=(SELECT COUNT(*) 
		               FROM mylike 
		               WHERE fno=#{fno})
		    WHERE no=#{fno}
		  </update>
  
      */
     public static void foodLikeUpdate(int fno)
     {
    	 SqlSession session=ssf.openSession(true);
    	 session.update("foodLikeUpdate",fno);
    	 session.close();
     }
}
