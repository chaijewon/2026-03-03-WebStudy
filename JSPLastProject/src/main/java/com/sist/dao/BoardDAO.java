package com.sist.dao;
import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.vo.*;
import com.sist.commons.*;
public class BoardDAO {
   private static SqlSessionFactory ssf;
   static
   {
	   ssf=CreateSqlSessionFactory.getSsf();
   }
   
   /*
    *   <select id="boardListData" resultType="BoardVO" parameterType="int">
	    SELECT no,subject,name,TO_CHAR(regdate,'yyyy-mm-dd') as dbday,hit
	    FROM freeboard
	    ORDER BY no DESC
	    OFFSET #{start} ROWS FETCH NEXT 10 ROWS ONLY
	  </select>
   */
   public static List<BoardVO> boardListData(int start)
   {
	   SqlSession session=ssf.openSession();
	   List<BoardVO> list=session.selectList("boardListData",start);
	   session.close();
	   return list;
   }
   /*
	  <select id="boardTotalPage" resultType="int">
	    SELECT CEIL(COUNT(*)/10.0)
	    FROM freeboard
	  </select>
   */
   public static int boardTotalPage()
   {
	   SqlSession session=ssf.openSession();
	   int total=session.selectOne("boardTotalPage"); 
	   session.close();
	   return total;
   }
   /*
	  <insert id="boardInsert" parameterType="BoardVO">
	    INSERT INTO freeboard(no,name,subject,content,pwd)
	    VALUES(
	       fb_no_seq.nextval,
	       #{name},#{subject},#{content},#{pwd}
	         |         |
	        vo.getName()
	    )
	  </insert>
    */
   // 모든 mapper / 모든 @RequestMapping  => Ajax / Vue 
   // 중복이 되면 안된다 (id) 
   public static void boardInsert(BoardVO vo)
   {
	   SqlSession session=ssf.openSession(true);
	   session.insert("boardInsert",vo);
	   session.close();
   }
   // 수정 하기 
   // 삭제 하기 
   // 상세 보기 
}
