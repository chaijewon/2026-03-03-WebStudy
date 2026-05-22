package com.sist.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.sist.vo.DataBoardVO;

public class DataBoardDAO {
	private Connection conn;
	private PreparedStatement ps;
	private static DataBoardDAO dao; // 싱글턴 
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
	public static DataBoardDAO newInstance()
	{
		if(dao==null)
			dao=new DataBoardDAO();
		return dao;
	}
	// 기능 설정 => MyBatis | SQL을 모른 사람 => JPA
	/*
	 *    findAll
	 *     select * from table
	 *    findByName(String name)  findByNameLike(String name) 
	 *     select * from table 
	 *     where name=name
	 */
	// 1. 목록 
	public List<DataBoardVO> databoardListData(int page)
	{
		List<DataBoardVO> list=
				new ArrayList<DataBoardVO>();
		try
		{
			getConnection();
			String sql="SELECT no,subject,name,TO_CHAR(regdate,'yyyy-mm-dd'),hit "
					  +"FROM databoard "
					  +"ORDER BY no DESC "
					  +"OFFSET ? ROWS FETCH NEXT 10 ROWS ONLY";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, (page*10)-10);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				DataBoardVO vo=new DataBoardVO();
				vo.setNo(rs.getInt(1));
				vo.setSubject(rs.getString(2));
				vo.setName(rs.getString(3));
				vo.setDbday(rs.getString(4));
				vo.setHit(rs.getInt(5));
				
				list.add(vo); // selectList()
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
	// 1-1. 총페이지 
	public int databoardTotalPage()
	{
		int total=0;
		try
		{
			getConnection();
			String sql="SELECT CEIL(COUNT(*)/10.0) FROM databoard";
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
	// 2. 추가 => 파일 업로드 
	public void databoardInsert(DataBoardVO vo)
	{
		try
		{
			getConnection();
			String sql="INSERT INTO databoard(no,name,subject,content,pwd,"
					+"filename,filesize) "
					+"VALUES(db_no_seq.nextval,?,?,?,?,?,?)";
			ps=conn.prepareStatement(sql);
			ps.setString(1, vo.getName());
			ps.setString(2, vo.getSubject());
			ps.setString(3, vo.getContent());
			ps.setString(4, vo.getPwd());
			ps.setString(5, vo.getFilename());
			ps.setInt(6, vo.getFilesize());
			
			ps.executeUpdate();
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally
		{
			disConnection();
		}
	}
	// 3. 상세보기 => 다운로드 
	// 4. 수정 
	// 5. 삭제 => 파일도 삭제
	// 6. 저장 폴더 => realpath : 호환 (리눅스에서도 실행)
}
