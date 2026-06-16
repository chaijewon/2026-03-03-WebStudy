package com.sist.dao;
import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.vo.*;
import com.sist.commons.*;
public class ReplyDAO {
   private static SqlSessionFactory ssf;
   static
   {
	   ssf=CreateSqlSesionFactory.getSsf();
   }
   /*
    *   <select id="replyListData" resultType="ReplyVO" parameterType="int">
		   SELECT no,fno,id,name,msg,
		          TO_CHAR(regdate,'YYYY-MM-DD HH24:MI:SS') as dbday
		   FROM reply
		   WHERE fno=#{fno}
		   ORDER BY no DESC
		  </select>
	*/
   public static List<ReplyVO> replyListData(int fno)
   {
	   SqlSession session=ssf.openSession();
	   List<ReplyVO> list=session.selectList("replyListData",fno);
	   session.close();
	   return list;
   }
   /*
		  <insert id="replyInsert" parameterType="ReplyVO">
		    <!-- Sequence  
		       order => 먼저 실행 
		    -->
		    <selectKey keyProperty="no" resultType="int"
		     order="BEFORE"
		    >
		    SELECT NVL(MAX(no)+1,1) as no FROM reply
		    </selectKey>
		    INSERT INTO reply VALUES(#{no},#{fno},#{id},#{name},
		    #{msg},SYSDATE)
		  </insert>
    */
   public static void replyInsert(ReplyVO vo)
   {
	   SqlSession session=ssf.openSession(true);
	   session.insert("replyInsert",vo);
	   session.close();
   }
   /*
    *     <update id="replyUpdate" parameterType="hashmap">
		    UPDATE reply SET 
		    msg=#{msg}
		    WHERE no=#{no}
		  </update>
		  
		  => @Update("UPDATE reply SET 
					    msg=#{msg}
					    WHERE no=#{no}")
	         public void replyUpdate(Map map)
	         
	         @Mapper
    */
   public static void replyUpdate(Map map)
   {
	   SqlSession session=ssf.openSession(true);// autoCommit
	   session.update("replyUpdate",map);
	   session.close();
   }
   /*
    *   <delete id="replyDelete" parameterType="int">
		    DELETE FROM reply
		    WHERE no=#{no}
		  </delete>
    */
   public static void replyDelete(int no)
   {
	   SqlSession session=ssf.openSession(true);// autoCommit
	   session.delete("replyDelete",no);
	   session.close();
   }
}
