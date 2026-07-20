package com.sist.dao;
import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.commons.*;
import com.sist.vo.*;
public class RecommandDAO {
   private static SqlSessionFactory ssf;
   static
   {
	   ssf=CreateSqlSessionFactory.getSsf();
   }
   /*
    *     <!--  관심있는 음식 종류 찾기 -->
		  <select id="foodGetType" resultType="string" parameterType="string">
		    SELECT type FROM food
			WHERE no=(SELECT no
			          FROM (SELECT no,count(*) as review_cnt
			                FROM foodReview
			                WHERE id=#{id}
			                GROUP BY no
			                ORDER BY review_cnt DESC)
			          WHERE rownum=1)
		  </select>
     */
     /*
		  <select id="memberGetAddress" resultType="string" parameterType="string">
		    SELECT addr1 FROM member
		    WHERE id=#{id}
		  </select>
     */
   /*
		  <select id="foodRecommandData" resultType="FoodVO"
		     parameterType="hashmap">
		   SELECT * 
		   FROM (SELECT * FROM food 
			     WHERE type LIKE '%'||#{type}||'%' and address LIKE '%'||#{address}||'%'
			     ORDER BY score DESC)
			WHERE rownum&lt;=5;
		  </select>
    */
   public static List<FoodVO> foodRecommandData(String id)
   {
	   SqlSession session=ssf.openSession();
	   String type=session.selectOne("foodGetType",id);
	   if(type==null || type.equals(""))
	   {
		   type="한식";
	   }
	   type=type.substring(0,2);
	   
	   String address=session.selectOne("memberGetAddress",id);
	   String[] addrs=address.split(" ");
	   Map map=new HashMap();
	   map.put("type", type);
	   map.put("address", addrs[1]);// 구
	   List<FoodVO> list=session.selectList("foodRecommandData", map);
	   session.close();
	   return list;
   }
}
