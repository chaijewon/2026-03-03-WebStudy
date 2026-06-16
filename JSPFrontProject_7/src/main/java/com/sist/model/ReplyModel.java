package com.sist.model;
import java.util.*;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.*;
import com.sist.vo.*;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@Controller
/*
 *   댓글 / 게시판 
 *   페이징 / 상세보기 
 *   => JSP / Spring / Spring-Boot 
 *   => 오라클 / MySQL
 *   => MyBatis / JPA 
 *   => Cookie / Session
 */
// 흐름 => 이동하는 JSP
public class ReplyModel {
   @RequestMapping("reply/insert.do")
   public String reply_insert(HttpServletRequest request,
		   HttpServletResponse response)
   {
	   String fno=request.getParameter("fno");
	   String msg=request.getParameter("msg");
	   
	   HttpSession session=request.getSession();
	   String id=(String)session.getAttribute("id");
	   String name=(String)session.getAttribute("name");
	   
	   ReplyVO vo=new ReplyVO();
	   vo.setFno(Integer.parseInt(fno));
	   vo.setMsg(msg);
	   vo.setId(id);
	   vo.setName(name);
	   
	   ReplyDAO.replyInsert(vo);
	   return "redirect:../food/detail.do?no="+fno;
   }
   /*            DispatcherServlet
    *   요청 => JSP => mapper.xml => DAO => Model => 확인(JSP)
    */
   @RequestMapping("reply/update.do")
   public String reply_update(HttpServletRequest request,
		   HttpServletResponse response)
   {
	   String fno=request.getParameter("fno");
	   String no=request.getParameter("no");
	   String msg=request.getParameter("msg");
	   
	   Map map=new HashMap();
	   map.put("no", no);
	   map.put("msg", msg);
	   ReplyDAO.replyUpdate(map);
	   return "redirect:../food/detail.do?no="+fno;
   }
   @RequestMapping("reply/delete.do")
   public String reply_delete(HttpServletRequest request,
		   HttpServletResponse response)
   {
	   String fno=request.getParameter("fno");
	   String no=request.getParameter("no");
	   ReplyDAO.replyDelete(Integer.parseInt(no));
	   
	   return "redirect:../food/detail.do?no="+fno;
   }
}
