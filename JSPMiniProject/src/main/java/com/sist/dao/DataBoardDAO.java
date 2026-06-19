package com.sist.dao;
/*
 *      오라클 
 *      -----
 *      SQL 
 *       |
 *    -----------------------------------------------
 *    |         |         |           |             |
 *   DQL      DML        DDL         DCL           TCL
 *   SELECT   INSERT     CREATE      GRANT         COMMIT
 *            UPDATE     DROP        ROVOKE        ROLLBACK
 *            DELETE     ALTER                     SAVEPOINT
 *                       TRUNCATE
 *                       RENAME
 *   1. SELECT : 데이터 검색 
 *      형식) 
 *           SELECT *|column_list
 *           FROM table_name|view_name|SELECT ~
 *           [
 *              WHERE 조건 => 연산자 
 *              GROUP BY group_column|함수
 *              HAVING 조건 (그룹관련)
 *              ORDER BY 컬럼|함수 => ASC|DESC
 *                                 ----- 생략이 가능
 *           ]
 *           
 *           FROM - WHERE - GROUP BY - HAVING - SELECT - ORDER
 *      => 가장 많이 사용 기술 
 *         조인 => 테스트지 => JOIN 사용하는 문제
 *           INNER JOIN 
 *             SELECT A.col,B.col
 *             FROM A,B
 *             WHERE A.col=B.col
 *             
 *             SELECT A.col,B.col
 *             FROM A JOIN B
 *             ON A.col=B.col
 *             
 *           OUTER JOIN 
 *             SELECT A.col,B.col
 *             FROM A,B
 *             WHERE A.col=B.col(+)
 *             
 *             SELECT A.col,B.col
 *             FROM A LEFT OUTER JOIN B
 *             ON A.col=B.col
 *             
 *             SELECT A.col,B.col
 *             FROM A,B
 *             WHERE A.col(+)=B.col
 *             
 *             SELECT A.col,B.col
 *             FROM A RIGHT OUTER JOIN B
 *             ON A.col=B.col
 *             
 *             
 *         서브쿼리 
 *             인라인뷰 
 *               => SELECT 
 *                  FROM (SELECT ~)  => table 대체  
 *                  
 *               => 스칼라 서브쿼리
 *                  SELECT (SELECT~),column  => 컬럼 대체 
 *                  FROM table_name 
 *      --------------- DBA 
 *      => 복잡한 쿼리 : View / Function
 *      => 공통으로 사용되는 부분 : 댓글 , 좋아요 , 찜하기 
 *         => PROCEDURE 
 *      => 다른 테이블이 연결 : TRIGGER 
 *      -------------------------------------------------------
 *      INSERT : 데이터 추가 
 *         형식) INSERT INTO table_name VALUES(....) 
 *                          ---------- 컬럼 전체의 값 주입 
 *                          ---------- DEFAULT가 적용이 안됨 
 *              INSERT INTO table_name(컬럼,컬럼..)
 *              VALUES(값,값)...
 *              VARCHAR2 / CLOB => '값'
                날짜 => SYSDATE 
                예약일 => 'yy/mm/dd' => DATE / VARCHAR2
 *      UPDATE : 데이터 수정 
 *         형식) UPDATE table_name SET 
 *              컬럼=값 , 컬럼=값...
 *              [WHERE 조건]
 *      DELETE : 데이터 삭제 
 *         형식) DELETE FROM table_name
 *              [WHERE 조건] 
 *      -------------------------------------- 웹 개발 (CRUD)
 *      Create Read Update Delete
 *                         | DELETE
 *                  | UPDATE
 *        |    | SELECT
 *      INSERT
 *      ----------------------------------------------------
 *      SELECT (X) , DELETE,UPDATE,INSERT (O)
 *                   | 데이터가 변경 
 *                   | COMMIT / ROLLBACK => 트랜잭션 (일괄처리)
 *      DDL 
 *      
 */
import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.vo.*;
import com.sist.commons.*;
public class DataBoardDAO {
   private static SqlSessionFactory ssf;
   static 
   {
	  ssf=CreateSqlSessionFactory.getSsf();
   }
   
   /*
    *   <select id="boardListData" resultType="DataBoardVO" parameterType="int">
		    SELECT no,subject,name,TO_CHAR(regdate,'yyyy-mm-dd') as dbday,hit
		    FROM mvcdataboard
		    ORDER BY no DESC
		    OFFSET #{start} ROWS FETCH NEXT 10 ROWS ONLY
		  </select>
     */
    public static List<DataBoardVO> boardListData(int start)
    {
    	SqlSession session=ssf.openSession();
    	List<DataBoardVO> list=session.selectList("boardListData",start);
    	session.close();
    	return list;
    }
    /*
		  <select id="boardRowCount" resultType="int">
		    SELECT COUNT(*) 
		    FROM mvcdataboard
		  </select>
    */
    public static int boardRowCount()
    {
    	SqlSession session=ssf.openSession();
    	int total=session.selectOne("boardRowCount");
    	session.close();
    	return total;
    }
    /*
     *   <insert id="boardInsert" parameterType="DataBoardVO">
		    <selectKey keyProperty="no" resultType="int" order="BEFORE">
		      <!-- sequence -->
		      SELECT NVL(MAX(no)+1,1) as no FROM mvcdataboard
		    </selectKey>
		    INSERT INTO mvcdataboard(no,name,subject,content,pwd,filename,filesize)
		    VALUES(#{no},#{name},#{subject},#{content},#{pwd},
		    #{filename},#{filesize})
		  </insert>
     */
    public static void boardInsert(DataBoardVO vo)
    {
    	SqlSession session=ssf.openSession(true); // commit
    	session.insert("boardInsert",vo);
    	session.close();
    }
    /*
     *   <update id="boardHitIncrement" parameterType="int">
		     UPDATE mvcdataboard SET
		     hit=hit+1
		     WHERE no=#{no}
		   </update>
		   <select id="boardDetailData" parameterType="int" 
		       resultType="DataBoardVO">
		     SELECT no,name,subject,content,
		            TO_CHAR(regdate,'yyyy-mm-dd hh24:mi:ss') as dbday,   
		            filename,filesize
		     FROM mvcdataboard
		     WHERE no=#{no} 
		   </select>
     */
    public static DataBoardVO boardDetailData(int no)
    {
    	SqlSession session=ssf.openSession();
    	session.update("boardHitIncrement",no);
    	session.commit();
    	DataBoardVO vo=session.selectOne("boardDetailData",no);
    	session.close();
    	return vo;
    }
    /*
     *   <select id="boardGetPassword" parameterType="int" resultType="string">
		    SELECT pwd FROM mvcdataboard
		    WHERE no=#{no}
		   </select>
		   
		   <update id="boardUpdate" parameterType="DataBoardVO">
		     UPDATE mvcdataboard SET 
		     name=#{name},subject=#{subject},content=#{content},
		     filename=#{filename},filesize=#{filesize}
		     WHERE no=#{no}
		   </update>
     */
    public static DataBoardVO boardUpdateData(int no)
    {
    	SqlSession session=ssf.openSession();
    	DataBoardVO vo=session.selectOne("boardDetailData",no);
    	session.close();
    	return vo;
    }
    public static boolean boardUpdate(DataBoardVO vo)
    {
    	boolean bCheck=false;
    	SqlSession session=ssf.openSession(true);
    	String db_pwd=
    			session.selectOne("boardGetPassword",vo.getNo());
    	if(db_pwd.equals(vo.getPwd()))
    	{
    		bCheck=true;
    		session.update("boardUpdate",vo);
    	}
    	return bCheck;
    }
}







