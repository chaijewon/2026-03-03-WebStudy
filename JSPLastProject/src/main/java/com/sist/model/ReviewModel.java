package com.sist.model;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.ReviewDAO;

import java.util.*;
import com.sist.vo.*;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
/*
 *    4 => 웹 사이트 구축 
 *    5 => 보안 
 *    6 => 부하가 심하다 => 도메인 방식 
 *    
 */
@Controller
public class ReviewModel {
   @RequestMapping("review/insert.do")
   public String review_insert(HttpServletRequest request,
		   HttpServletResponse response)
   {
	   String fno=request.getParameter("fno");
	   String msg=request.getParameter("msg");
	   HttpSession session=request.getSession();
	   String id=(String)session.getAttribute("id");
	   String name=(String)session.getAttribute("name");
	   
	   ReviewVO vo=new ReviewVO();
	   vo.setId(id);
	   vo.setMsg(msg);
	   vo.setName(name);
	   vo.setFno(Integer.parseInt(fno));
	   // DB에 저장 요청 
	   ReviewDAO.reviewInsert(vo);
	   ReviewDAO.foodReviewCount(Integer.parseInt(fno));
	   return "redirect:../food/detail.do?no="+fno;
   }
   @RequestMapping("review/delete.do")
   public String review_delete(HttpServletRequest request,
		   HttpServletResponse response)
   {
	   String no=request.getParameter("no");
	   String fno=request.getParameter("fno");
	   ReviewDAO.reviewDelete(Integer.parseInt(no));
	   ReviewDAO.foodReviewCount(Integer.parseInt(fno));
	   return "redirect:../food/detail.do?no="+fno;
   }
   @RequestMapping("review/update.do")
   public String review_update(HttpServletRequest request,
		   HttpServletResponse response)
   {
	   String no=request.getParameter("no");
	   String fno=request.getParameter("fno");
	   String msg=request.getParameter("msg");
	   ReviewVO vo=new ReviewVO();
	   vo.setNo(Integer.parseInt(no));
	   vo.setMsg(msg);
	   ReviewDAO.reviewUpdate(vo);
	   return "redirect:../food/detail.do?no="+fno;
   }
   
}
