package com.sist.dao;
import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.commons.*;
import com.sist.vo.*;
public class FoodDAO {
   private static SqlSessionFactory ssf;
   static
   {
	   ssf=CreateSqlSesionFactory.getSsf();
   }
   
   /*
    *    <select id="foodListData" resultType="FoodVO" parameterType="int">
		    SELECT no,name,poster,address
		    FROM food
		    ORDER BY no ASC
		    OFFSET #{start} ROWS FETCH NEXT 12 ROWS ONLY
		  </select>
   */
   public static List<FoodVO> foodListData(int start)
   {
	   SqlSession session=ssf.openSession();
	   List<FoodVO> list=session.selectList("foodListData", start);
	   session.close();
	   return list;
   }
   /*
		  <select id="foodTotalPage" resultType="int">
		    SELECT CEIL(COUNT(*)/12.0) FROM food
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
		  <select id="foodDetailData" resultType="FoodVO" parameterType="int">
		    SELECT *
		    FROM food
		    WHERE no=#{no}
		  </select>
    */
   // select => selectOne() / selectList() => row단위 
   public static FoodVO foodDetailData(int no)
   {
	   SqlSession session=ssf.openSession();
	   FoodVO vo=session.selectOne("foodDetailData", no);
	   session.close();
	   return vo;
   }
}
