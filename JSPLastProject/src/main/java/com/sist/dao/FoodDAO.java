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
}
