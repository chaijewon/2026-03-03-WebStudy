package com.sist.dao;
import java.util.*;
import java.sql.*;
public class MusicDAO {
  private Connection conn;
  private PreparedStatement ps;
  private final String URL="jdbc:oracle:thin:@localhost:1521:XE";
  private static MusicDAO dao; // 필수 => 싱글턴 
  // 드라이버 등록 
  public MusicDAO()
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
  // 해제 
  public void disConnection()
  {
	  try
	  {
		  if(ps!=null) ps.close();
		  if(conn!=null) conn.close();
	  }catch(Exception ex) {}
  }
  // 싱글턴 : 메모리를 1개 생성 => 재사용 => 메모리 누수 현상 방지 
  // Connection 남발 방지
  public static MusicDAO newInstance()
  {
	  if(dao==null)
		  dao=new MusicDAO();
	  return dao;
  }
  // 기능 : 목록 출력 
  public List<MusicVO> musicListData(int page)
  {
	  List<MusicVO> list=new ArrayList<MusicVO>();
	  try
	  {
		  // 연결 
		  getConnection();
		  // SQL문장 
		  String sql="SELECT no,title,singer,album,poster,state,idcrement "
				    +"FROM genie_music "
				    +"WHERE cno=1 "
				    +"ORDER BY no ASC "
				    +"OFFSET ? ROWS FETCH NEXT 20 ROWS ONLY";
		  ps=conn.prepareStatement(sql);
		  ps.setInt(1, (page*20)-20);
		  ResultSet rs=ps.executeQuery();
		  while(rs.next())
		  {
			  MusicVO vo=new MusicVO();
			  vo.setNo(rs.getInt(1));
			  vo.setTitle(rs.getString(2));
			  vo.setSinger(rs.getString(3));
			  vo.setAlbum(rs.getString(4));
			  vo.setPoster(rs.getString(5));
			  vo.setState(rs.getString(6));
			  vo.setIdcrement(rs.getInt(7));
			  list.add(vo);
		  }
		  rs.close();
	  }catch(Exception ex)
	  {
		  // 오류 처리 
		  ex.printStackTrace(); // 테스트 방법 => Junit (단위 테스트)
	  }
	  finally
	  {
		  // 닫기 
		  disConnection();
	  }
	  return list;
  }
  
}
