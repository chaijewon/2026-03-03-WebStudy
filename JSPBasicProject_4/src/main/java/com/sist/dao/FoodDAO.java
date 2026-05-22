package com.sist.dao;
import java.util.*;
import java.sql.*;
public class FoodDAO {
	   private Connection conn;
	   private PreparedStatement ps;
	   private final String URL="jdbc:oracle:thin:@localhost:1521:XE";
	   private static FoodDAO dao;
	   
	   // 드라이버 등록 
	   public FoodDAO()
	   {
		   try
		   {
			   Class.forName("oracle.jdbc.driver.OracleDriver");
		   }catch(Exception ex)
		   {
			   ex.printStackTrace();
		   }
	   }
	   // 연결 
	   public void getConnection()
	   {
		   try
		   {
			   conn=DriverManager.getConnection(URL,"hr","happy");
		   }catch(Exception ex) {}
	   }
	   // 닫기 
	   public void disConnection()
	   {
		   try
		   {
			   if(ps!=null) ps.close();
			   if(conn!=null) conn.close();
		   }catch(Exception ex) {}
	   }
	   // 싱글턴 
	   public static FoodDAO newInstance()
	   {
		   if(dao==null)
			   dao=new FoodDAO();
		   return dao;
	   }
	   // 기능 => 목록 출력 
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
	   // 검색 
	   public List<FoodVO> foodFindData(int page,String address)
	   {
		   List<FoodVO> list=new ArrayList<FoodVO>();
		   try
		   {
			   getConnection();
			   String sql="SELECT no,name,poster "
					     +"FROM food "
					     +"WHERE address LIKE '%'||?||'%' "
					     +"ORDER BY no ASC "
					     +"OFFSET ? ROWS FETCH NEXT 12 ROWS ONLY";
			   ps=conn.prepareStatement(sql);
			   ps.setString(1, address);
			   ps.setInt(2, (page*12)-12); // OFFSET은 0번부터 시작 
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
	   public int foodFindTotalPage(String address)
	   {
		   int total=0;
		   try
		   {
			   getConnection();
			   String sql="SELECT CEIL(COUNT(*)/12.0) FROM food "
					     +"WHERE address LIKE '%'||?||'%'";
			   ps=conn.prepareStatement(sql);
			   ps.setString(1, address);
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
