package com.sist.dao;
/*
<select id="foodListData" resultType="FoodVO" parameterType="int">
SELECT no,poster,name
FROM food
ORDER BY no ASC
OFFSET #{start} ROWS FETCH NEXT 12 ROWS ONLY
</select>
*/
/*
 *   class A
 *   {
 *      int a;
 *   }
 *   
 *   new A().a=10
 *   new A().a=20
 *  
 */

import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import java.util.*;
import com.sist.vo.*;
public class FoodDAO {
	  private static SqlSessionFactory ssf;
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
	      <select id="foodListData" resultType="FoodVO" parameterType="int">
			SELECT no,poster,name
			FROM food
			ORDER BY no ASC
			OFFSET #{start} ROWS FETCH NEXT 12 ROWS ONLY
          </select>
          <select id="foodTotalPage" resultType="int">
		    SELECT CEIL(COUNT(*)/12.0) FROM food
		   </select>
	   */
	  // ajax=>json / jsp=request
	  public static List<FoodVO> foodListData(int start)
	  {
		  // 단점 : 에러시 처리가 어렵다 => try~catch
		  SqlSession session=ssf.openSession();
		  // => connection을 이용해서 => ps/rs
		  List<FoodVO> list=session.selectList("foodListData",start);
		  session.close();
		  return list;
	  }
	  public static int foodTotalPage()
	  {
		  SqlSession session=ssf.openSession();
		  // => connection을 이용해서 => ps/rs
		  int total=session.selectOne("foodTotalPage");
		  session.close();
		  return total;
	  }
	  /*
	   *   <select id="foodDetailData" resultType="FoodVO"
		    parameterType="int"
		   >
		     SELECT *
		     FROM food
		     WHERE no=#{no}
		   </select>
	   */
	  public static FoodVO foodDetailData(int no)
	  {
		  SqlSession session=ssf.openSession();
		  // => connection을 이용해서 => ps/rs
		  FoodVO vo=session.selectOne("foodDetailData",no);
		  session.close();
		  return vo;
	  }
}
