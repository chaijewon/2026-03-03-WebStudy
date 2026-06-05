package com.sist.commons;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.util.*;
import java.io.*;
public class CreateSqlSessionFactory {
   private static SqlSessionFactory ssf;
   static 
   {
	   try
	   {
		   // XML 읽기 
		   Reader reader=Resources.getResourceAsReader("Config.xml");
		   // 필요한 데이터만 추출 => 파싱 
		   ssf=new SqlSessionFactoryBuilder().build(reader);
		   // Map => (id, SQL문장)
	   }catch(Exception ex) 
	   {
		   ex.printStackTrace();
	   }
   }
   
   public static SqlSessionFactory getSsf() {
	   return ssf;
   }
   
}
