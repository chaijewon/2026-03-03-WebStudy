package com.sist.dao;
import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.commons.*;
import com.sist.vo.*;
public class TourDAO {
   private static SqlSessionFactory ssf;
   static
   {
	   ssf=CreateSqlSessionFactory.getSsf();
   }
   
   /*
    *      <select id="travelListData" resultType="TourVO" parameterType="hashmap">
		    SELECT contentid,contenttypeid,areacode,addr1,firstimage
		    FROM tour
		    WHERE contenttypeid=#{contenttypeid} AND areacode=#{areacode}
		    OFFSET #{start} ROWS FETCH NEXT 12 ROWS ONLY
		  </select>
   */
   public static List<TourVO> travelListData(Map map)
   {
	   SqlSession session=ssf.openSession();
	   List<TourVO> list=session.selectList("travelListData",map);
	   session.close();
	   return list;
   }
   /*
		  <select id="travelTotalPage" resultType="TourVO" parameterType="hashmap">
		    SELECT CEIL(COUNT(*)/12.0)
		    FROM tour
		    WHERE contenttypeid=#{contenttypeid} AND areacode=#{areacode}
		  </select>
    */
   public static int travelTotalPage(Map map)
   {
	   SqlSession session=ssf.openSession();
	   int total=session.selectOne("travelTotalPage",map);
	   session.close();
	   return total;
   }
}
