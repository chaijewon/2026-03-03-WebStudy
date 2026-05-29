package com.sist.commons;
import java.util.*;
import java.sql.*;
import javax.sql.*;
import javax.naming.*;
public class DBCPUtil {
   private Connection conn;
   public Connection getConnection()
   {
	   try
	   {
		   Context init=new InitialContext();
		   Context c=(Context)init.lookup("java://comp/env");
		   DataSource ds=(DataSource)c.lookup("jdbc/oracle");
		   conn=ds.getConnection();
	   }catch(Exception ex) 
	   {
		   ex.printStackTrace();
	   }
	   return conn;
   }
   public void disConnection(Connection conn,PreparedStatement ps)
   {
	   try
	   {
		   if(ps!=null) ps.close();
		   if(conn!=null) conn.close();
	   }catch(Exception ex) {}
   }
}
