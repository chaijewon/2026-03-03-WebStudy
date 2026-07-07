package com.sist.dao;
import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.vo.*;
import com.sist.commons.*;
/*
 *    반복 기능 => 메소드 
 *    ==> 여러개 클래스 사용시 : 클래스화 
 *    ----------------------------- 반복 기능 제거 
 *                                  | 자동 호출 (콜백 => AOP)
 *                                  OOP VS AOP 
 *                                  Spring 
 *                                  ------
 *                                  1. DI 
 *                                  **2. AOP
 *                                  **3. MVC
 *                                  4. Transaction 
 *                                  5. ORM 
 *                                  6. Security : 일반 / JWT 
 *                                  7. Front-End 
 */
public class MainDAO {
   private static SqlSessionFactory ssf;
   static
   {
	   ssf=CreateSqlSessionFactory.getSsf();
   }
   /*
    *   <select id="mainSeoulOne" resultType="TourVO">
	    SELECT contentid,firstimage,addr1,likecount,replycount,rownum
	    FROM (SELECT contentid,firstimage,addr1,likecount,replycount 
	          FROM tour 
	          WHERE areacode=1 AND contenttypeid=12
	          ORDER BY hit DESC
	         )
	    WHERE rownum=1
	  </select>
   */
   public static TourVO mainSeoulOne()
   {
	   SqlSession session=ssf.openSession();
	   TourVO vo=session.selectOne("mainSeoulOne");
	   session.close();
	   return vo;
   }
   /*
	  <select id="mainPusanTop4" resultType="TourVO">
	    SELECT contentid,firstimage,addr1,likecount,replycount,rownum
	    FROM (SELECT contentid,firstimage,addr1,likecount,replycount 
	          FROM tour 
	          WHERE areacode=6 AND contenttypeid=12
	          ORDER BY hit DESC
	         )
	    WHERE rownum&lt;=4
	  </select>
   */
   public static List<TourVO> mainPusanTop4()
   {
	   SqlSession session=ssf.openSession();
	   List<TourVO> list=session.selectList("mainPusanTop4");
	   session.close();
	   return list;
   }
   /*
	  <select id="mainJejuTop4" resultType="TourVO">
	    SELECT contentid,firstimage,addr1,likecount,replycount,rownum
	    FROM (SELECT contentid,firstimage,addr1,likecount,replycount 
	          FROM tour 
	          WHERE areacode=39 AND contenttypeid=12
	          ORDER BY hit DESC
	         )
	    WHERE rownum&lt;=4
	  </select>
   */
   public static List<TourVO> mainJejuTop4()
   {
	   SqlSession session=ssf.openSession();
	   List<TourVO> list=session.selectList("mainJejuTop4");
	   session.close();
	   return list;
   }
   /*
	  <select id="mainFoodTop7" resultType="FoodVO">
	    SELECT no,name,type,poster,likecount,replycount,address,rownum
	    FROM (SELECT no,name,type,poster,likecount,replycount,address
	          FROM food
	          ORDER BY hit DESC
	         )
	    WHERE rownum&lt;=7
	  </select>
    */
   public static List<FoodVO> mainFoodTop7()
   {
	   SqlSession session=ssf.openSession();
	   List<FoodVO> list=session.selectList("mainFoodTop7");
	   session.close();
	   return list;
   }
}
