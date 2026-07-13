package com.sist.model;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.vo.*;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.sist.dao.*;
@Controller
public class LikeModel {
  @RequestMapping("like/likeOn.do")
  public String likeOn(HttpServletRequest request,
		      HttpServletResponse resposne)
  {
	  HttpSession session=request.getSession();
	  String id=(String)session.getAttribute("id");
	  String fno=request.getParameter("fno");
	  LikeVO vo=new LikeVO();
	  vo.setId(id);
	  vo.setFno(Integer.parseInt(fno));
	  LikeDAO.likeOn(vo);
	  LikeDAO.foodLikeUpdate(Integer.parseInt(fno));
	  return "redirect:../food/detail.do?no="+fno;
  }
  @RequestMapping("like/likeOff.do")
  public String likeOff(HttpServletRequest request,
		      HttpServletResponse resposne)
  {
	  HttpSession session=request.getSession();
	  String id=(String)session.getAttribute("id");
	  String fno=request.getParameter("fno");
	  
	  LikeVO vo=new LikeVO();
	  vo.setId(id);
	  vo.setFno(Integer.parseInt(fno));
	  LikeDAO.likeOff(vo);
	  LikeDAO.foodLikeUpdate(Integer.parseInt(fno));
	  return "redirect:../food/detail.do?no="+fno;
  }
}
