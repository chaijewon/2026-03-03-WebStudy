package com.sist.dao;
import org.junit.jupiter.api.*;

import com.sist.vo.ReplyVO;

import static org.junit.jupiter.api.Assertions.*;
/*
 *   import static java.lang.Math.*;
 *   
 *   Math.ceil() Math.random() 
 *   => random()
 */
import java.util.*;
public class ReplyDAOTest {
  @Test
  public void listTest()
  {
	  Map map=new HashMap();
	  map.put("cno", 1);
	  map.put("rno", 1);
	  
	  List<ReplyVO> list=ReplyDAO.replyListData(map);
	  
	  assertNotNull(list,"댓글 목록 정상 수행");
	  assertFalse(list.isEmpty());
  }
}
