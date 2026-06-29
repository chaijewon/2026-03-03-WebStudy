package com.sist.model;
import java.io.PrintWriter;
import java.lang.annotation.Repeatable;
// 브라우저로 데이터 전송 
import java.util.*;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.sist.commons.Commons;
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
		  
		  Commons.sendData(response, "text/plain", json);
	  }catch(Exception ex) {}
  }
  /*
   *   goods/list.do
   */
  @RequestMapping("goods/detail.do")
  public String goods_detail(HttpServletRequest request,
		  HttpServletResponse response)
  {
	  return "../goods/detail.jsp";
  }
  
  @RequestMapping("goods/detail_vue.do")
  public void goods_detail_vue(HttpServletRequest request,
		  HttpServletResponse response)
  {
	  String no=request.getParameter("no");
	  GoodsVO vo=GoodsDAO.goodsDetailData(Integer.parseInt(no));
	  String p=vo.getGoods_price();
	  p=p.replaceAll("[^0-9]", "");
	  vo.setPrice(Integer.parseInt(p));
	  // Vue => JSON변경 => 전송 
	  try
	  {
		  ObjectMapper mapper=new ObjectMapper();
		  String json=mapper.writeValueAsString(vo);
		  
		  Commons.sendData(response, "text/plain", json);
		  // yes / no => text/html
	  }catch(Exception ex) {}
  }
  
  
}
