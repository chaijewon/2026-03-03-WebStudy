package com.sist.dao;
/*
 *  MyBatis 
 *    => Config.xml : Connection
 *    => mapper.xml : SQL문장 => PreparedStatement/ResultSet
 *    => VO : 한개의 정보 저장하는 장소 
 *    => DAO : XML + 자바 연결 
 *    => 분업 
 */
import java.util.*;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.*;
import com.sist.vo.*;
public class FoodDAO {
   // => XML의 데이터를 저장하는 클래스 
   private static SqlSessionFactory ssf;
   // XML 파싱 
   static // 초기화 블록 => 자동 호출 / 상속 예외 
   {
	   try
	   {
		   // XML 읽기 => 한번에 모든 XML을 포함하고 있는 XML이 존재 
		   Reader reader=Resources.getResourceAsReader("Config.xml");
		   // 파싱된 내용을 저장 
		   ssf=new SqlSessionFactoryBuilder().build(reader);
	   }catch(Exception ex)
	   {
		   ex.printStackTrace();
	   }
   }
   
   // 목록
   /*
    *  
		  <select id="foodListData" resultType="FoodVO" parameterType="int">
		    SELECT no,name,poster,address 
		    FROM food 
		    ORDER BY no ASC
		    OFFSET #{start} ROWS FETCH NEXT 12 ROWS ONLY
		  </select>
    */
   public static List<FoodVO> foodListData(int start)
   {
	   List<FoodVO> list=new ArrayList<FoodVO>();
	   // 에러 잡기 
	   SqlSession session=null;
	   try
	   {
		   // session 생성 => PreparedStatement / ResultSet
		   session=ssf.openSession();
		   list=session.selectList("foodListData",start);
		   // 대소문자 구분 
	   }catch(Exception ex)
	   {
		   ex.printStackTrace(); // XML에서 
	   }
	   finally
	   {
		  if(session!=null)
			  session.close(); // 반환 
	   }
	   return list;
   }
   // 총페이지 
   /*
    *   
		  <select id="foodTotalPage" resultType="int">
		    SELECT CEIL(COUNT(*)/12.0) FROM food
		  </select>
    */
   public static int foodTotalPage()
   {
	   int total=0;
	   SqlSession session=null;
	   try
	   {
		   // session 생성 => PreparedStatement / ResultSet
		   session=ssf.openSession();
		   total=session.selectOne("foodTotalPage");
		   // 대소문자 구분 
	   }catch(Exception ex)
	   {
		   ex.printStackTrace(); // XML에서 
	   }
	   finally
	   {
		  if(session!=null)
			  session.close(); // 반환 
	   }
	   return total;
   }
   
}
