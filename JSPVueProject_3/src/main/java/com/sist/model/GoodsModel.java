package com.sist.model;
import java.io.PrintWriter;
// 브라우저로 데이터 전송 
import java.util.*;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.*;
import com.sist.vo.*;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@Controller  // DispatcherServlet과 연동 
public class GoodsModel {
  @RequestMapping("goods/list.do")
  // Router
  public String goods_list(HttpServletRequest request,
		  HttpServletResponse response)
  {
	  return "../goods/list.jsp";
  }
  // Vue연동 
  @RequestMapping("goods/list_vue.do")
  public void goods_list_vue(HttpServletRequest request,
		  HttpServletResponse response)
  {
	  String page=request.getParameter("page");
	  int curpage=Integer.parseInt(page);
	  List<GoodsVO> list=GoodsDAO.goodsListData((curpage*12)-12);
	  int totalpage=GoodsDAO.goodsTotalPage();
	  
	  final int BLOCK=10;
	  int startPage=((curpage-1)/BLOCK*BLOCK)+1;
	  int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
	  
	  if(endPage>totalpage)
		  endPage=totalpage;
	  
	  Map map=new HashMap(); // JSON생성 
	  map.put("list", list);
	  System.out.println(list);
	  map.put("curpage", curpage);
	  map.put("totalpage", totalpage);
	  map.put("startPage", startPage);
	  map.put("endPage", endPage);
	  
	  try
	  {
		  ObjectMapper mapper=new ObjectMapper();
		  String json=mapper.writeValueAsString(map);
		  
		  // json을 vue로 전송 
		  response.setContentType("text/plain;charset=UTF-8");
		  PrintWriter out=response.getWriter();
		  // out => 요청한 브라우저에서 읽어 가는 메모리 위치 : TCP 
		  System.out.println(json);
		  out.write(json);
		  // Front연결은 JSON을 만들어서 처리 
	  }catch(Exception ex) {}
  }
}
