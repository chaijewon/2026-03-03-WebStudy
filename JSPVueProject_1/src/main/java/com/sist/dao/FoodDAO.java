package com.sist.dao;
import java.util.*;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.*;
import com.sist.vo.*;
public class FoodDAO {
   private static SqlSessionFactory ssf;
   /*
    *   Spring = XML => DI 
    *   <bean id="ssf" class="SqlSessionFactory">
    *     <property name="configLocation" value="Config.xml"/>
    *   </bean>
    */
   static 
   {
	   try
	   {
		   Reader reader=Resources.getResourceAsReader("Config.xml");
		   ssf=new SqlSessionFactoryBuilder().build(reader);
	   }catch(Exception ex)
	   {
		   ex.printStackTrace();
	   }
   }
   /*
    *    <select id="foodListData" resultType="FoodVO" parameterType="int">
		    <!-- id:중복이 없어야 한다 (메소드명)  
		         resultType="FoodVO" = return 
		                     List<FoodVO> : selectList
		                     FoodVO : selectOne
		         parameterType="int" = 매개변수 => ?에 값을 채우는 데이터형 
		                       ====== 2개 이상 , VO , Map
		         SELECT no,name,poster,TO_CHAR(regdate...) as dbday
		               === setNo()
		               === 함수사용시는 반드시 별칭(멤버변수로 설정)
		         변경해야 되는 데이터가 많은 경우 : <resultMap>
		    -->
		    SELECT no,name,poster,address
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
     *   <select id="foodDetailData" resultType="FoodVO" parameterType="int">
		    SELECT *
		    FROM food
		    WHERE no=#{no}
		  </select>
     */
    public static FoodVO foodDetailData(int no)
    {
    	SqlSession session=ssf.openSession();
    	FoodVO vo=session.selectOne("foodDetailData",no);
    	session.close();
    	return vo;
    }
    /*
     *   <select id="foodFindListData" resultType="FoodVO" parameterType="hashmap">
		    SELECT no,poster,name,address
		    FROM food
		    WHERE ${column} LIKE '%'||#{ss}||'%'
		    OFFSET #{start} ROWS FETCH NEXT 12 ROWS ONLY
		  </select>
     */
    public static List<FoodVO> foodFindListData(Map map)
    {
   	 SqlSession session=ssf.openSession();
   	 List<FoodVO> list=session.selectList("foodFindListData",map);
   	 session.close();
   	 return list;
    }
    /*
     *   <select id="foodFindTotalPage" resultType="int" parameterType="hashmap">
		    SELECT CEIL(COUNT(*)/12.0) FROM food
		    WHERE ${column} LIKE '%'||#{ss}||'%'
		  </select>
     */
    public static int foodFindTotalPage(Map map)
    {
    	SqlSession session=ssf.openSession();
    	int total=session.selectOne("foodFindTotalPage",map);
    	session.close();
    	return total;
    }
}
