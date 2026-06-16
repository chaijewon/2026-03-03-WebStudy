package com.sist.commons;
import java.util.*;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import lombok.Getter;

import java.io.*;
// 모든 DAO에서 사용하는 공통 소스 => 공통 모듈 : AOP
public class CreateSqlSesionFactory {
   @Getter
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
   
}
