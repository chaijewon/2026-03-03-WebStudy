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
	  /*
	   *   <insert id="reserveInsert" parameterType="ReserveVO">
		   INSERT INTO reserve(rno,fno,id,name,rdate,rtime,inwon)
		   VALUES(res_rno_seq.nextval,#{fno},#{id},#{name},
		   #{rdate},#{rtime},#{inwon})
		  </insert>
	   */
	  public static void reserveInsert(ReserveVO vo)
	  {
		  SqlSession session=ssf.openSession(true);
		  session.insert("reserveInsert",vo);
		  session.close();
	  }
	  /*
	   *    <select id="reservemyPageListData" parameterType="string">
			    SELECT rno,fno,id,r.name,rdate,rtime,inwon,
			           TO_CHAR(regdate,'yyyy-mm-dd') as dbday,
			           poster,f.name,phone
			    FROM reserve r JOIN food f
			    ON r.fno=f.no
			    AND id=#{id}
			    ORDER BY rno DESC
			  </select>
	   */
	  public static List<ReserveVO> reservemyPageListData(String id)
	  {
		  SqlSession session=ssf.openSession();
		  List<ReserveVO> list=session.selectList("reservemyPageListData",id);
		  session.close();
		  return list;
	  }
	  /*
	   *   <select id="reserveAdminPageListData" parameterType="string"
		    resultMap="rMap"
		  >
		    SELECT rno,fno,id,r.name,rdate,rtime,inwon,
		           TO_CHAR(regdate,'yyyy-mm-dd') as dbday,
		           poster,f.name,phone,ok
		    FROM reserve r JOIN food f
		    ON r.fno=f.no
		    ORDER BY rno DESC
		  </select>
	   */
	  public static List<ReserveVO> reserveAdminPageListData()
	  {
		  SqlSession session=ssf.openSession();
		  List<ReserveVO> list=session.selectList("reserveAdminPageListData");
		  session.close();
		  return list;
	  }
	  /*
	   *   <delete id="reserveDelete" parameterType="int">
		   DELETE FROM reserve
		   WHERE rno=#{rno}
		  </delete>
	   */
	  public static void reserveDelete(int rno)
	  {
		  SqlSession session=ssf.openSession(true);
		  session.insert("reserveDelete",rno);
		  session.close();
	  }
	  /*
	   *  <select id="reserveInfoData" parameterType="int"
		   resultMap="infoMap"
		  >
		    SELECT rno,no,rdate,rtime,inwon,address,phone,parking,poster,
		           type,score,time
		    FROM reserve r JOIN food f
		    ON r.fno=f.no
		    AND rno=#{rno}
		  </select>
	   */
	  public static ReserveVO reserveInfoData(int rno)
	  {
		  SqlSession session=ssf.openSession();
		  ReserveVO list=session.selectOne("reserveInfoData",rno);
		  session.close();
		  return list;
	  }
}
