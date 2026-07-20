package com.sist.temp; // 6184
import java.sql.*;
public class MainClass {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Connection conn=null;
		PreparedStatement ps=null;
        try
        {
        	Class.forName("oracle.jdbc.driver.OracleDriver");
        	String url="jdbc:oracle:thin:@211.238.142.45:1521:XE";
        	conn=DriverManager.getConnection(url,"hr","happy");
        	conn.setAutoCommit(false);
        	String sql="UPDATE goods_all SET "
        			  +"stock=? "
        			  +"WHERE no=?";
        	for(int i=1;i<=6184;i++)
        	{
        	   try
        	   {
        		ps=conn.prepareStatement(sql);
        		ps.setInt(1, (int)(Math.random()*11)+10);
        		ps.setInt(2, i);
        		ps.executeUpdate();
        		ps.close();
        		System.out.println(i+"ROW Injection");
        	   }catch(Exception e) {}
        	}
        	conn.commit();
        }catch(Exception ex) {
        	try
        	{
        		conn.rollback();
        	}catch(Exception e) {}
        }
	}
	

}
