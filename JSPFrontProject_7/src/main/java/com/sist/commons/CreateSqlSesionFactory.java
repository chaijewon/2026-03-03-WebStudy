package com.sist.commons;
import java.util.*;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import lombok.Getter;

import java.io.*;
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
