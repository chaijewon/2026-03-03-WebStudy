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
   /*
    *    <update id="boardHitIncrement" parameterType="int">
		    UPDATE freeboard SET 
		    hit=hit+1
		    WHERE no=#{no}
		  </update>
		  <!-- 
		       1. 회원가입 (로그인)
		       2. 게시판 : CRUD
		       3. 공지사항 : 관리자 / 일반사용자 
		       4. HttpSession / Cookie 
		                        | 최신방문 / 장바구니 / 자동로그인 (remember-me)
		   -->
		  <select id="boardDetailData" resultType="BoardVO" parameterType="int">
		    SELECT no,name,subject,content,hit,
		           TO_CHAR(regdate,'yyyy-mm-dd hh24:mi:ss') as dbday
		    FROM freeboard
		    WHERE no=#{no}
		  </select>
    */
   public static BoardVO boardDetailData(int no)
   {
	   SqlSession session=ssf.openSession(true);
	   session.update("boardHitIncrement",no);
	   BoardVO vo=session.selectOne("boardDetailData",no);
	   session.close();
	   return vo;
   }
   //  JSP = Mapper = DAO = Model = JSP
   
   /*
    *     <select id="boardGetPassword" resultType="string" parameterType="int">
		   SELECT pwd 
		   FROM freeboard
		   WHERE no=#{no}
		  </select>
		  
		  <delete id="boardDelete" parameterType="int">
		    DELETE FROM freeboard
		    WHERE no=#{no}
		  </delete>
    */
   public static String boardDelete(int no,String pwd)
   {
	   String result="no";
	   SqlSession session=ssf.openSession();
	   String db_pwd=session.selectOne("boardGetPassword",no);
	   if(db_pwd.equals(pwd))
	   {
		   session.delete("boardDelete",no);
		   session.commit();
		   result="yes";
	   }
	   session.close();
	   return result;
   }
   
   public static BoardVO boardUpdateData(int no)
   {
	   SqlSession session=ssf.openSession(true);
	   BoardVO vo=session.selectOne("boardDetailData",no);
	   session.close();
	   return vo;
   }
   /*
    *    <update id="boardUpdate" parameterType="BoardVO">
		    UPDATE freeboard SET 
		    name=#{name},subject=#{subject},content=#{content}
		    WHERE no=#{no}
		  </update>
    */
   public static String boardUpdate(BoardVO vo)
   {
	   String result="no";
	   SqlSession session=ssf.openSession();
	   String db_pwd=session.selectOne("boardGetPassword",vo.getNo());
	   if(db_pwd.equals(vo.getPwd()))
	   {
		   session.update("boardUpdate",vo);
		   session.commit();
		   result="yes";
	   }
	   session.close();
	   return result;
   }
   
}
