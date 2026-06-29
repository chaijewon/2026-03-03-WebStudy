package com.sist.dao;
import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.commons.*;
import com.sist.vo.*;
public class GoodsDAO {
  private static SqlSessionFactory ssf;
  static
  {
	  ssf=CreateSqlSessionFactory.getSsf();
  }
  /*
   *      <select id="goodsListData" resultType="GoodsVO" 
   *      parameterType="int">
		     SELECT no,goods_poster,goods_price,goods_name
		     FROM goods_all
		     ORDER BY 1
		     OFFSET #{start} ROWS FETCH NEXT 12 ROWS ONLY
		   </select>
   */
  public static List<GoodsVO> goodsListData(int start)
  {
	  SqlSession session=ssf.openSession();
	  List<GoodsVO> list=session.selectList("goodsListData",start);
	  //System.out.println(list);
	  session.close();//반환
	  return list;
  }
  /*
		   <select id="goodsTotalPage" resultType="int">
		     SELECT CEIL(COUNT(*)/12.0) 
		     FROM goods_all
		   </select>
  */
  public static int goodsTotalPage()
  {
	  SqlSession session=ssf.openSession();
	  int total=session.selectOne("goodsTotalPage");
	  session.close();//반환
	  return total;
  }
  /*
		   <!-- 
		   <select id="goodsTopData" resultType="GoodsVO">
		     SELECT no,goods_poster,goods_price,goods_name,rownum
		     FROM (SELECT no,goods_poster,goods_price,goods_name
		       FROM goods_all ORDER BY hit DESC
		     )
		     WHERE rownum&lt;=5
		     rownum = Top-N = rownum의 순서변경 = 인라인뷰 
		     select : 조건문 (WHERE뒤에) 서브쿼리 
		              컬럼 대신 사용 : 스칼라 서브쿼리  
		              테이블 대신 사용 : 인라인뷰 
		   </select> -->
		   <update id="goodsHitIncrement" parameterType="int">
		     UPDATE goods_all SET 
		     hit=hit+1
		     WHERE no=#{no}
		   </update>
		   <select id="goodsDetailData" resultType="GoodsVO" parameterType="int">
		     SELECT *
		     FROM goods_all
		     WHERE no=#{no}
		   </select>
   */
  public static GoodsVO goodsDetailData(int no)
  {
	  SqlSession session=ssf.openSession(true);
	  session.update("goodsHitIncrement",no);
	  GoodsVO vo=session.selectOne("goodsDetailData",no);
	  session.close();
	  return vo;
  }
}
