package com.sist.dao;
// VO => mapper => DAO => Model => JSP
import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.commons.*;
import com.sist.vo.*;
public class NoticeDAO {
	   private static SqlSessionFactory ssf;
	   static
	   {
		   ssf=CreateSqlSessionFactory.getSsf();
	   }
	   /*
	    *  <insert id="noticeInsert" parameterType="NoticeVO">
		   INSERT INTO notice(no,type,subject,content)
		   VALUES(notice_no_seq.nextval,
		    #{type},
		    #{subject},
		    #{content}
		   )
		  </insert>
	 */
	   public static int noticeInsert(NoticeVO vo)
	   {
		   SqlSession session=ssf.openSession(true);
		   int a=session.insert("noticeInsert",vo);
		   session.close();
		   return a;
	   }
	  /*
		  <!-- user/admin -->
		  <select id="noticeListData" parameterType="int" resultType="NoticeVO">
		    SELECT no,type,name,subject,
		           TO_CHAR(regdate,'yyyy-MM-dd') as dbday,hit
		    FROM notice 
		    ORDER BY no DESC
		    OFFSET #{start} ROWS FETCH NEXT 10 ROWS ONLY
		  </select>
      */
	   public static List<NoticeVO> noticeListData(int start)
	   {
		   SqlSession session=ssf.openSession();
		   List<NoticeVO> list=session.selectList("noticeListData",start);
		   session.close();
		   return list;
	   }
	   /*
		  <select id="noticeTotalPage" resultType="int">
		    SELECT CEIL(COUNT(*)/10.0) FROM notice
		  </select>
	    */
	   public static int noticeTotalPage()
	   {
		   SqlSession session=ssf.openSession();
		   int total=session.selectOne("noticeTotalPage"); 
		   session.close();
		   return total;
	   }
	   /*
	    *   <delete id="noticeDelete" parameterType="int">
			   DELETE FROM notice
			   WHERE no=#{no}
			  </delete>
	    */
	   public static void noticeDelete(int no)
	   {
		   SqlSession session=ssf.openSession(true);
		   session.delete("noticeDelete",no);
		   session.close();
		   
	   }
	   
	   /*
	    *   <select id="noticeDetailData" resultType="NoticeVO" parameterType="int">
			   SELECT *
			   FROM notice
			   WHERE no=#{no}
			  </select>
			  <update id="noticeHitIncrement" parameterType="int">
			   UPDATE notice SET
			   hit=hit+1
			   WHERE no=#{no}
			  </update>
	    */
	   public static NoticeVO noticeUpdateData(int no)
	   {
		   SqlSession session=ssf.openSession();
		   NoticeVO vo=session.selectOne("noticeDetailData",no);
		   session.close();
		   return vo;
	   }
	   
	   public static NoticeVO noticeDetailData(int no)
	   {
		   SqlSession session=ssf.openSession(true);
		   session.update("noticeHitIncrement",no);
		   NoticeVO vo=session.selectOne("noticeDetailData",no);
		   session.close();
		   return vo;
	   }
}
