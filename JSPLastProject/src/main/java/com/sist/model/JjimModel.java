package com.sist.model;



import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.JjimDAO;
import com.sist.vo.JjimVO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class JjimModel {
   @RequestMapping("jjim/jjim_insert.do")
   public String jjim_insert(HttpServletRequest request,
		   HttpServletResponse response)
   {
	   String fno=request.getParameter("fno");
	   HttpSession session=request.getSession();
	   String id=(String)session.getAttribute("id");
	   
	   JjimVO vo=new JjimVO();
	   vo.setFno(Integer.parseInt(fno));
	   vo.setId(id);
	   
	   // DB연동
	   JjimDAO.jjimInsert(vo);
	   return "redirect:../food/detail.do?no="+fno;
   }
}
