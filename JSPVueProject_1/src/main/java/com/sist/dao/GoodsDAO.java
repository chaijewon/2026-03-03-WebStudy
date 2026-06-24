package com.sist.dao;
import java.util.*;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.sist.vo.*;
import java.io.*;
public class GoodsDAO {
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
   public List<GoodsVO> goodsListData(int start)
   {
	   SqlSession session=ssf.openSession();
	   List<GoodsVO> list=session.selectList("goodsListData",start);
	   session.close();
	   return list;
   }
   public int goodsTotalPage()
   {
	   SqlSession session=ssf.openSession();
	   int total=session.selectOne("goodsTotalPage");
	   session.close();
	   return total;
   }
}
