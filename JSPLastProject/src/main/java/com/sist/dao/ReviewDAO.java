package com.sist.dao;
// => VO => mapper = DAO = Model
//                         => Spring : BoardController
//                         => struts : BoardAction 
import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.vo.*;
import com.sist.commons.*;
public class ReviewDAO {
   private static SqlSessionFactory ssf;
   static
   {
	   ssf=CreateSqlSessionFactory.getSsf();
   }
   
   /*
    *    <insert id="reviewInsert" parameterType="ReviewVO">
		    INSERT INTO foodReview(fno,id,name,msg)
		    VALUES(#{fno},#{id},#{name},#{msg})
		  </insert>
   */
     public static void reviewInsert(ReviewVO vo)
     {
    	 SqlSession session=ssf.openSession(true);
    	 session.insert("reviewInsert",vo);
    	 session.close();
     }
   /*
		  <select id="reviewListData" resultType="ReviewVO" parameterType="int">
		    SELECT no,fno,id,name,msg,
		          TO_CHAR(regdate,'yyyy-mm-dd hh24:mi:ss') as dbday
		    FROM foodReview
		    WHERE fno=#{fno}
		    ORDER BY no DESC
		  </select>
    */
     public static List<ReviewVO> reviewListData(int fno)
     {
    	 SqlSession session=ssf.openSession();
    	 List<ReviewVO> list=session.selectList("reviewListData",fno);
    	 session.close();
    	 return list;
     }
     /*
      *   <delete id="reviewDelete" parameterType="int">
		   DELETE FROM foodReview
		   WHERE no=#{no}
		  </delete>
      */
     public static void reviewDelete(int no)
     {
    	 SqlSession session=ssf.openSession(true);
    	 session.delete("reviewDelete",no);
    	 session.close();
     }
     
     /*
      *   <update id="reviewUpdate" parameterType="ReviewVO">
		    UPDATE foodReview SET
		    msg=#{msg}
		    WHERE no=#{no}
		  </update>
      */
     public static void reviewUpdate(ReviewVO vo)
     {
    	 SqlSession session=ssf.openSession(true);
    	 session.delete("reviewUpdate",vo);
    	 session.close();
     }
}
