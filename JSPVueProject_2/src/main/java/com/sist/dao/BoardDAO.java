package com.sist.dao;
import java.util.*;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.*;
import com.sist.vo.*;
public class BoardDAO {
   private static SqlSessionFactory ssf;
   static 
   {
	   try
	   {
		   Reader reader=Resources.getResourceAsReader("Config.xml");
		   ssf=new SqlSessionFactoryBuilder().build(reader);
		   // xml => 파싱 (프레임워크 => XML을 제공 => 파싱)
		   // XML / 크롤링 
		   // => 읽어가는 방법 
	   }catch(Exception ex)
	   {
		   ex.printStackTrace();
	   }
   }
   /*
    *   <select id="boardListData" resultType="BoardVO" parameterType="int">
		    SELECT no,subject,name,TO_CHAR(regdate,'YYYY-MM-DD') as dbday,hit
		    FROM jspboard
		    ORDER BY no DESC
		    OFFSET #{start} ROWS FETCH NEXT 12 ROWS ONLY
		  </select>
   */
    public static List<BoardVO> boardListData(int start)
    {
    	SqlSession session=ssf.openSession();
    	List<BoardVO> list=session.selectList("boardListData",start);
    	session.close();
    	return list;
    }
   /*
		  <select id="boardRowCount" resultType="int">
		    SELECT COUNT(*) FROM jspboard
		  </select>
    */
    public static int boardRowCount()
    {
    	SqlSession session=ssf.openSession();
    	int count=session.selectOne("boardRowCount");
    	session.close();
    	return count;
    }
    /*
     *    <insert id="boardInsert" parameterType="BoardVO">
		    <!-- sequence : 자동 증가 번호 
		         #{} = setString() => ''
		         ${} = 일반문장열 => ''(X) = column/table
		    -->
		    <selectKey keyProperty="no" resultType="int" order="BEFORE">
		      SELECT NVL(MAX(no)+1,1) as no FROM jspboard
		    </selectKey>
		    INSERT INTO jspboard VALUES(
		      #{no},
		      #{name},
		      #{subject},
		      #{content},
		      #{pwd},
		      SYSDATE,
		      0
		    )
		  </insert>
     */
    public static void boardInsert(BoardVO vo)
    {
    	SqlSession session=ssf.openSession(true); // commit
    	session.insert("boardInsert",vo);
    	session.close();
    }
}
