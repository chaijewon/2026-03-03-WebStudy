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
	   ssf=CreateSqlSessionFactory.getSsf();
   }
   /*
    *    <select id="foodListData" resultType="FoodVO" parameterType="int">
		    SELECT no,name,poster,address,phone,likecount,replycount,
		           theme,content
		    FROM food 
		    ORDER BY no ASC
		    OFFSET #{start} ROWS FETCH NEXT 12 ROWS ONLY
		  </select>
		  
   */
   //              resultType    id        parameterType
   public static List<FoodVO> foodListData(int start)
   {
	   // 1. 연결 
	   SqlSession session=ssf.openSession();
	   // 2. SQL문장 실행 결과 
	   List<FoodVO> list=session.selectList("foodListData",start);
	   //                                     id명          #{start}
	   // 3. session 닫기
	   session.close(); // 반환 
	   return list;
   }
   /*
		  <select id="foodTotalPage" resultType="int">
		    SELECT CEIL(COUNT(*)/12.0) FROM food
		  </select>
		  let html=''
		  list.forEach((m)=>{
		    html+='<div>..'
		  })
		  
		  <div class="col-sm-3" v-for="vo in list" v-if="">
		  </div>
		  
		  <%
		     for(int i=0;i<=10;i++)
		     {
		  %>
		       <div>
		  <%
		     }
		  %>
		  <c:forEach>
		   <div>
		  </c:forEach>
		  
		  <div th:each="">
		  </div>
		  
		  <select id="foodListData" resultType="FoodVO" parameterType="int">
		    SELECT no,name,poster,address,phone,likecount,replycount,
		           theme,content
		    FROM food 
		    ORDER BY no ASC
		    OFFSET #{start} ROWS FETCH NEXT 12 ROWS ONLY
		  </select>
		  
		  List<FoodVO> findAll()
    */
   public static int foodTotalPage()
   {
	   SqlSession session=ssf.openSession();
	   int total=session.selectOne("foodTotalPage");
	   session.close();
	   return total;
   }
   /*
    *   <!-- 상세보기  -->
		  <update id="foodHitIncrement" parameterType="int">
		    UPDATE food SET
		    hit=hit+1
		    WHERE no=#{no}
		  </update>
		  <select id="foodDetailData" parameterType="int" resultType="FoodVO">
		    SELECT *
		    FROM food
		    WHERE no=#{no}
		  </select>
		  <select id="foodRearData" resultType="FoodVO" parameterType="string">
		    SELECT no,name,poster,address,rownum
		    FROM food
		    WHERE address LIKE '%'||#{address}||'%'
		    AND rownum&lt;=7
		  </select>
    */
}
