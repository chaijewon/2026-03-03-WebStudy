package com.sist.dao;
import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.vo.*;
import com.sist.commons.*;
public class FoodDAO {
   private static SqlSessionFactory ssf;
   static
   {
	   ssf=CreateSqlSessionFactory.getSsf();
   }
   /*
    *   <select id="foodListData" resultType="FoodVO" parameterType="int">
		    SELECT no,name,poster,type,phone,likecount,replycount
		    FROM food
		    ORDER BY no ASC
		    OFFSET #{start} ROWS FETCH NEXT 12 ROWS ONLY
		  </select>
    */
   public static List<FoodVO> foodListData(int start)
   {
	   SqlSession session=ssf.openSession();
	   List<FoodVO> list=session.selectList("foodListData",start);
	   session.close();
	   return list;
   }
   /*
		  <select id="foodTotalPage" resultType="int">
		    SELECT CEIL(COUNT(*)/12.0)
		    FROM food
		  </select>
    */
   public static int foodTotalPage()
   {
	   SqlSession session=ssf.openSession();
	   int total=session.selectOne("foodTotalPage");
	   session.close();
	   return total;
   }
   /*
    *    <update id="foodHitIncrement" parameterType="int">
		    UPDATE food SET
		    hit=hit+1
		    WHERE no=#{no}
		  </update>
		  <select id="foodDetailData" resultType="FoodVO" parameterType="int">
		    SELECT *
		    FROM food
		    WHERE no=#{no}
		  </select>
    */
   /*
    *                    요청 JSP(.do)
    *                    => <a> <img> title
    *                    => button
    *                                     | Controller
    *    View(JSP,ThymeLeaf) ========> DispatcherServlet 
    *                                     |
    *                                  ------------- 
    *                                   Model ==> request/json
    *                                     |
    *                                   Service : SpringFramework 
    *                                     |
    *                                    DAO 
    *                                  ------------ Model
    *    ------------------------------------------------------
    *    SpringFrameWork / Spring-Boot 
    *      => Setting      | XML(X) , Annotation 
    *                        | 6버전 / 3.xx , 4.xx , 5.xx
    *                                        | 사용 => MyBatis 
    *                                        | SpringAI
    *         | XML / Annotataion      
    *         | 5버전 
    *    ------------------------------------------------------
    *      JPA / Security (JWT) / MSA 
    *    ------------------------------------------------------
    *    => Vue => vuex / Pinia 
    *    => React => Redux => TanStack-Query => NextJS 
    *    ------------------------------------------------------
    *    Oracle / MySQL 
    *    ------------------------------------------------------
    *    Stomp / 카프카 
    *    ------------------------------------------------------
    *    CI/CD => Git Action / docker / docker-compose / 쿠바네티스
    *    Jenkins / ngiex / ngrok / 
    *    ------------------------------------------------------- 
    */
   public static FoodVO foodDetailData(int no)
   {
	   SqlSession session=ssf.openSession(true);
	   session.update("foodHitIncrement",no);
	   FoodVO vo=session.selectOne("foodDetailData",no);
	   session.close();
	   return vo;
   }
   public static FoodVO foodCookieData(int no)
   {
	   SqlSession session=ssf.openSession();
	   FoodVO vo=session.selectOne("foodDetailData",no);
	   session.close();
	   return vo;
   }
}
