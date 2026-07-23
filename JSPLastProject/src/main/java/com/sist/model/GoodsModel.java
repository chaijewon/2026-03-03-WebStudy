package com.sist.model;
import java.util.*;
import com.sist.vo.*;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.*;

@Controller
public class GoodsModel {

	@RequestMapping("goods/list.do")
	public String goods_list(HttpServletRequest request,
			HttpServletResponse response)
	{
		   String page=request.getParameter("page");
		   if(page==null)
			   page="1";
		   int curpage=Integer.parseInt(page);
		   int start=(curpage*12)-12;
		   
		   List<GoodsVO> list=GoodsDAO.goodsListData(curpage);
		  
		   int totalpage=GoodsDAO.goodsTotalPage();
		   
		   final int BLOCK=10;
		   int startPage=((curpage-1)/BLOCK*BLOCK)+1;
		   int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		   if(endPage>totalpage)
			   endPage=totalpage;
		   
		   request.setAttribute("list", list);
		   request.setAttribute("curpage", curpage);
		   request.setAttribute("totalpage", totalpage);
		   request.setAttribute("endPage", endPage);
		   request.setAttribute("startPage", startPage);
		   
		   
		   
		   request.setAttribute("main_jsp", "../goods/list.jsp");
		   
		   // Cookie 전송 
		   /*
		   List<GoodsVO> cList=new ArrayList<GoodsVO>();
		   Cookie[] cookies=request.getCookies();
		   if(cookies!=null)
		   {
			   // 최신순으로 읽어 온다 
			   for(int i=cookies.length-1;i>=0;i--)
			   {
				    // Cookie cookie=new Cookie("Goods_"+no, no);
				   if(cookies[i].getName().startsWith("Goods_"))
				   {
					   String no=cookies[i].getValue();
					   if(no!=null)
					   {
						   GoodsVO vo=
								  GoodsDAO.GoodsCookieData(Integer.parseInt(no));
						   cList.add(vo);
					   }
				   }
			   }
		   }
		   request.setAttribute("cList", cList);*/
		   return "../main/main.jsp";
	}
	@RequestMapping("goods/detail.do")
	public String goods_detail(HttpServletRequest request,
			HttpServletResponse response)
	{
		String no=request.getParameter("no");
		GoodsVO vo=GoodsDAO.goodsDetailData(Integer.parseInt(no));
		String won=vo.getGoods_price();
		won=won.replaceAll("[^0-9]", "");
		int a=Integer.parseInt(won);
		a-=a*vo.getGoods_discount()/100;
		vo.setPrice(a);
		request.setAttribute("vo", vo);
		request.setAttribute("main_jsp", "../goods/detail.jsp");
		return "../main/main.jsp";
	}
}
