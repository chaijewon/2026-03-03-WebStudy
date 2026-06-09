package com.sist.dao;
import java.util.*;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.*;
public class MusicDAO {
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
    *     <select id="musicListData" resultType="MusicVO">
		   SELECT no,title,poster,singer,album,state,idcrement
		   FROM genie_music
		   WHERE cno=1
		   ORDER BY no ASC
		  </select>
		  
		  MyBatis => Config.xml 
		  ======================
		  mapper.xml 
		    => CRUD (JOIN / SUBQUERY)
		    => 동적 쿼리 : 다중 조건 => 잡 포털 / 검색 (필터) 
		    => #{} / ${}
		             ---- table,column명 => ''(X)
		       --- ?에 값을 채운다 => ''(O)
		    => < : 오류  &lt;
    */
   public static List<MusicVO> musicListData()
   {
	   List<MusicVO> list=new ArrayList<MusicVO>();
	   // 연결 => 송수신이 가능한 클래스 생성 
	   SqlSession session=null;
	   try
	   {
		   // session 얻기 
		   session=ssf.openSession();
		   list=session.selectList("musicListData");
	   }catch(Exception ex)
	   {
		   ex.printStackTrace();
	   }
	   finally
	   {
		   if(session!=null)
			   session.close(); // POOL안에 반환 => 8/8
	   }
	   return list;
   }
}
