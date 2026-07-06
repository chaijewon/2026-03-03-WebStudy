package com.sist.commons;
import java.io.*;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
public class CreateSqlSessionFactory {
   private static SqlSessionFactory ssf; // XML 파싱 => 필요한 데이터 저장 
   static 
   {
	   try
	   {
		   Reader reader=Resources.getResourceAsReader("Config.xml");
		   // map1.put("id명","SQL문장")
		   // map2.put("id명","resultType")
		   // map3.put("id명","parameterType")
		   ssf=new SqlSessionFactoryBuilder().build(reader);
	   }catch(Exception ex)
	   {
		   ex.printStackTrace();
	   }
   }
   public static SqlSessionFactory getSsf() {
	    return ssf;
   }
   
}
