package com.sist.dao;
import java.io.*;
import java.util.*;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
/*
 *   MyBatis 
 *     = CRUD 
 *       <select> <update> <insert> <delete>
 *                                  | delete()
 *                         | insert()
 *                | update()
 *         | = List selectList()
 *         | = VO   selectOne()
 *     = JOIN / SubQuery() => <resultMap>
 *     = 동적 쿼리 
 *       <if> <forEach> <where> <choose> <trim> : 다중 검색 
 *     = Annotation 사용 
 *     = MyBatis의 단점 
 *       SQL문장을 한개만 처리 
 *       => 여러개 처리 
 *          <select> : Procedure형식 => 회원 탈퇴 
 *           BEGIN 
 *           {
 *           }
 *           END
 *          </select>
 */
public class EmpDAO {
   private static SqlSessionFactory ssf;
   static 
   {
	   try
	   {
		   // XML 파싱 
		   Reader reader=Resources.getResourceAsReader("Config.xml");
		   // mapper.xml이 포함 
		   ssf=new SqlSessionFactoryBuilder().build(reader);
	   }catch(Exception ex)
	   {
		   ex.printStackTrace();
	   }
   }
   // 기능 
   /*
    *    <select id="empListData" resultMap="empMap">
		    SELECT empno,ename,job,TO_CHAR(hiredate,'YYYY-MM-DD') as dbday,
		           sal,dname,loc
		    FROM emp,dept
		    WHERE emp.deptno=dept.deptno
		    ORDER BY empno ASC
		  </select>
    */
   public static List<EmpVO> empListData()
   {
	   List<EmpVO> list=new ArrayList<EmpVO>();
	   // 연결 => Connection 주소 읽기 
	   SqlSession session=null;
	   try
	   {
		   session=ssf.openSession();
		   list=session.selectList("empListData");
	   }catch(Exception ex)
	   {
		   ex.printStackTrace();
	   }
	   finally
	   {
		   if(session!=null)
			   session.close(); // POOL로 반환 
	   }
	   return list;
   }
}
