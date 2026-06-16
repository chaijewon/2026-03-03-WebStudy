package com.sist.dao;
import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.commons.*;
import com.sist.vo.*;
/*
 *      food/list.do 
 *          | ===========> 찾기 @WebServlet("*.do")
 *      DispatcherServlet (Spring의 Controller명)
 *          => 모든 요청을 받아서 => Model을 찾아주는 역할 
 *          => Model에서 수행 결과를 JSP로 전송 
 *          |
 *       Model에서 메소드를 찾는다 
 *       -------------------- @RequestMapping("main/main.do")
 *                            @RequestMapping("food/list.do")
 *                            => 메소드 
 *                               처리 => request.setAttribute()
 *          |
 *       DispatcherServlet 
 *          |
 *        request를 전송 => 출력할 JSP를 찾아서 전송
 *                        --------------------
 *                        | => request 전송 
 *                             return "../food/list.jsp"
 *                        | => request 초기화 => 화면 이동 
 *                             return "redirect:list.do"
 *                        | => Ajax를 이용한 방식 
 *                             void => JSON 
 *       => Model클래스를 전체를 찾는다 : 싱글턴 패턴 / Factory 패턴
 *       => 클래스 메모리 할당 @Autowired 
 *       => @ResponseBody => getParameter()없이 전송한 모든 데이터를 받을 수 있다 
 *       
 */
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
   /*
    *   <select id="foodFindData" resultType="FoodVO" parameterType="hashmap">
		    SELECT no,name,poster,address
		    FROM food
		    WHERE ${column} LIKE '%'||#{fd}||'%'
		    ORDER BY no ASC
		    OFFSET #{start} ROWS FETCH NEXT 12 ROWS ONLY 
		  </select>
   */
   public static List<FoodVO> foodFindData(Map map)
   {
	   SqlSession session=ssf.openSession();
	   List<FoodVO> list=session.selectList("foodFindData",map);
	   session.close(); // 반환 
	   return list;
   }
   /*
		  <select id="foodFindTotalPage" resultType="int" parameterMap="hashmap">
		   SELECT CEIL(COUNT(*)/12.0) 
		   FROM food
		   WHERE ${column} LIKE '%'||#{fd}||'%'
		  </select>
    */
   public static int foodFindTotalPage(Map map)
   {
	   SqlSession session=ssf.openSession();// getConnection()
	   int total=session.selectOne("foodFindTotalPage",map);
	   session.close();//disConnection()
	   return total;
   }
}
