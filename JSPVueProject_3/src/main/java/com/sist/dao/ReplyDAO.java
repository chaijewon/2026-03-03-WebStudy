package com.sist.dao;
import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.commons.*;
import com.sist.vo.*;
public class ReplyDAO {
   private static SqlSessionFactory ssf;
   static
   {
	   ssf=CreateSqlSessionFactory.getSsf();
   }
   
   /*
    *   <select id="replyListData" resultType="ReplyVO" parameterType="hashmap">
		    SELECT no,cno,rno,id,name,msg,
		           TO_CHAR(regdate,'yyyy-mm-dd hh24:mi:ss') as dbday
		    FROM allReply
		    WHERE cno=#{cno} AND rno=#{rno}
		    ORDER BY no DESC
		  </select>
    */
   public static List<ReplyVO> replyListData(Map map)
   {
	   SqlSession session=ssf.openSession();
	   List<ReplyVO> list=session.selectList("replyListData",map);
	   session.close();
	   return list;
   }
   /*
		  <insert id="replyInsert" parameterType="ReplyVO">
		    INSERT INTO allReply VALUES(
		      (SELECT NVL(MAX(no)+1,1) FROM allReply),
		      #{cno},#{rno},#{id},#{name},#{msg},SYSDTAE
		    )
		  </insert>
    */
   public static void replyInsert(ReplyVO vo)
   {
	   SqlSession session=ssf.openSession(true);
	   session.insert("replyInsert",vo);
	   session.close();
   }
}
