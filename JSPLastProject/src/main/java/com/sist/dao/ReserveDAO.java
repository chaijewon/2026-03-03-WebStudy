package com.sist.dao;
import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.commons.*;
import com.sist.vo.*;
/*
 *   <bean id="ssf" class="SqlSessionFactory"
 *     p:configLocation="Config.xml"
 *   />
 *   => XML/Annotation을 이용해서 메모리 할당 => Spring-Boot 
 *          => Fast API 
 */
public class ReserveDAO {
	  private static SqlSessionFactory ssf;
	  static
	  {
		  ssf=CreateSqlSessionFactory.getSsf();
	  }
	  // 기능 
	  /*
	   *    <select id="reserveFoodListData" resultType="FoodVO"
			  parameterType="hashmap">
			    SELECT no,name,poster,type
			    FROM food 
			    WHERE type LIKE '%'||#{type}||'%'
			    ORDER BY no ASC
			    OFFSET #{start} ROWS FETCH NEXT 20 ROWS ONLY
			  </select>
	  */
	  public static List<FoodVO> reserveFoodListData(Map map)
	  {
		  SqlSession session=ssf.openSession();
		  List<FoodVO> list=session.selectList("reserveFoodListData",map);
		  session.close();
		  return list;
	  }
	  /*
			  <select id="reserveFoodTotalPage" resultType="int" parameterType="string">
			    SELECT CEIL(COUNT(*)/20.0)
			    FROM food 
			    WHERE type LIKE '%'||#{type}||'%'
			  </select>
	   */
	  public static int reserveFoodTotalPage(String type)
	  {
		  SqlSession session=ssf.openSession();
		  int total=session.selectOne("reserveFoodTotalPage",type);
		  session.close();
		  return total;
	  }
}
