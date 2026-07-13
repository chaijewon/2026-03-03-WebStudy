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
	   public static void noticeInsert(NoticeVO vo)
	   {
		   SqlSession session=ssf.openSession(true);
		   session.insert("noticeInsert",vo);
		   session.close();
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
}
