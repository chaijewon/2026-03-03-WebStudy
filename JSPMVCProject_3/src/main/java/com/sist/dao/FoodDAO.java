package com.sist.dao;
import java.util.*;
import java.sql.*;
import com.sist.commons.*;
public class FoodDAO {
   private Connection conn;
   private PreparedStatement ps;
   private DBCPUtil db=new DBCPUtil();
   
   // 기능 
   public List<FoodVO> foodListData(int page)
   {
	   List<FoodVO> list=new ArrayList<FoodVO>();
	   try
	   {
		   conn=db.getConnection();
		   String sql="SELECT no,poster,name,address "
				     +"FROM food "
				     +"ORDER BY no ASC "
				     +"OFFSET ? ROWS FETCH NEXT 12 ROWS ONLY";
	   }catch(Exception ex)
	   {
		   ex.printStackTrace();
	   }
	   finally
	   {
		   db.disConnection(conn, ps);
	   }
	   return list;
   }
}
