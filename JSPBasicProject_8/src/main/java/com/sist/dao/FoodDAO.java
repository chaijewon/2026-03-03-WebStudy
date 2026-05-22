package com.sist.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import com.sist.vo.*;

public class FoodDAO {
	private Connection conn;
	private PreparedStatement ps;
	private static FoodDAO dao; // 싱글턴 
	// => 보안 
	public void getConnection()
	{
		try
		{
			// 연결 => POOL연결 
			Context init=new InitialContext();
			Context c=(Context)init.lookup("java://comp/env");
			DataSource ds=(DataSource)c.lookup("jdbc/oracle");
			// connection 정보 읽기 
			conn=ds.getConnection();
		}catch(Exception ex) 
		{
			ex.printStackTrace();
		}
	}
	public void disConnection()
	{
		try
		{
			if(ps!=null) ps.close();
			if(conn!=null) conn.close();
			// 닫는 것이 아니라 => POOL안으로 반환 => 재사용이 가능 
			// POOL => Connection 객체 저장 메모리 공간 
			// Connection갯수를 제어할 수 있다 
			// 많이 생성이 되면 서버 부하가 있다 
		}catch(Exception ex) {}
	}
	public static FoodDAO newInstance()
	{
		if(dao==null)
			dao=new FoodDAO();
		return dao;
	}
	public List<FoodVO> foodListData(int page)
	   {
		   List<FoodVO> list=
				   new ArrayList<FoodVO>();
		   try
		   {
			   getConnection();
			   String sql="SELECT no,name,poster "
					     +"FROM food "
					     +"ORDER BY no ASC "
					     +"OFFSET ? ROWS FETCH NEXT 12 ROWS ONLY";
			   ps=conn.prepareStatement(sql);
			   ps.setInt(1, (page*12)-12); // OFFSET은 0번부터 시작 
			   ResultSet rs=ps.executeQuery();
			   while(rs.next())
			   {
				   FoodVO vo=new FoodVO();
				   vo.setNo(rs.getInt(1));
				   vo.setName(rs.getString(2));
				   vo.setPoster(rs.getString(3));
				   list.add(vo);
			   }
			   rs.close();
		   }catch(Exception ex)
		   {
			   ex.printStackTrace();
		   }
		   finally
		   {
			   disConnection();
		   }
		   return list;
	   }
	   // 상세보기 
	   public FoodVO foodDetailData(int no)
	   {
		   FoodVO vo=new FoodVO();
		   try
		   {
			   getConnection();
			   String sql="SELECT no,name,poster,address,phone,"
					     +"score,theme,parking,time,price,content,type "
					     +"FROM food "
					     +"WHERE no=?";
			   ps=conn.prepareStatement(sql);
			   ps.setInt(1, no);
			   ResultSet rs=ps.executeQuery();
			   rs.next();
			   vo.setNo(rs.getInt(1));
			   vo.setName(rs.getString(2));
			   vo.setPoster(rs.getString(3));
			   vo.setAddress(rs.getString(4));
			   vo.setPhone(rs.getString(5));
			   vo.setScore(rs.getDouble(6));
			   vo.setTheme(rs.getString(7));
			   vo.setParking(rs.getString(8));
			   vo.setTime(rs.getString(9));
			   vo.setPrice(rs.getString(10));
			   vo.setContent(rs.getString(11));
			   vo.setType(rs.getString(12));
			   rs.close();
		   }catch(Exception ex)
		   {
			   ex.printStackTrace();
		   }
		   finally
		   {
			   disConnection();
		   }
		   return vo;
	   }
	   // 총페이지 
	   public int foodTotalPage()
	   {
		   int total=0;
		   try
		   {
			   getConnection();
			   String sql="SELECT CEIL(COUNT(*)/12.0) FROM food";
			   ps=conn.prepareStatement(sql);
			   ResultSet rs=ps.executeQuery();
			   rs.next();
			   total=rs.getInt(1);
			   rs.close();
		   }catch(Exception ex)
		   {
			   ex.printStackTrace();
		   }
		   finally
		   {
			   disConnection();
		   }
		   return total;
	   }
}
