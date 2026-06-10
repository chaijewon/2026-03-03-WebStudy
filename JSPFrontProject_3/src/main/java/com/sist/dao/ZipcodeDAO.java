package com.sist.dao;
import java.util.*;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.*;
public class ZipcodeDAO {
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
   *   <select id="postFind" resultType="ZipcodeVO" parameterType="string">
	    SELECT zipcode,sido,gugun,dong,NVL(bunji,' ') as bunji
	    FROM zipcode
	    WHERE dong LIKE '%'||#{dong}||'%'
	  </select>
	  <select id="postFindCount" resultType="int" parameterType="string">
	    SELECT COUNT(*)
	    FROM zipcode
	    WHERE dong LIKE '%'||#{dong}||'%'
	  </select>
   */
  public static List<ZipcodeVO> postFind(String dong)
  {
	  List<ZipcodeVO> list=new ArrayList<ZipcodeVO>();
	  SqlSession session=ssf.openSession();
	  list=session.selectList("postFind",dong);
	  session.close();
	  /*try
	  {
		  
	  }catch(Exception ex)
	  {
		  
	  }
	  finally
	  {
		  
	  }*/
	  return list;
  }
  public static int postFindCount(String dong)
  {
	  SqlSession session=ssf.openSession();
	  int total=session.selectOne("postFindCount",dong);
	  session.close();
	  return total;
  }
}
