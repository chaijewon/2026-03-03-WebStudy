package com.sist.model;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

import java.io.PrintWriter;
import java.util.*;
import com.sist.dao.*;
import com.sist.vo.*;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@Controller
public class BoardModel {
   @RequestMapping("board/list.do")
   // => Router : 화면만 이동 
   // => 실제 처리 => Front에서  
   public String board_list(HttpServletRequest request,
		   HttpServletResponse response)
   {
	   return "../board/list.jsp";
   }
   
   @RequestMapping("board/list_vue.do")
   public void board_list_vue(HttpServletRequest request,
		   HttpServletResponse response)
   {
	   String page=request.getParameter("page");
	   int curpage=Integer.parseInt(page);
	   int start=(curpage*10)-10;
	   List<BoardVO> list=BoardDAO.boardListData(start);
	   int count=BoardDAO.boardRowCount();
	   int totalpage=(int)(Math.ceil(count/10.0));
	   count=count-((curpage*10)-10);
	   
	   Map map=new HashMap();
	   map.put("curpage", curpage);
	   map.put("count", count);
	   map.put("totalpage", totalpage);
	   map.put("list", list);
	   
	   // JavaScript => JSON 
	   
	   try
	   {
		    ObjectMapper mapper=new ObjectMapper();
		    String json=mapper.writeValueAsString(map);
		    
		    response.setContentType("text/plain;charset=UTF-8");
		    PrintWriter out=response.getWriter();
		    out.write(json);
		    
		    // AJAX , VUE / REACT
	   }catch(Exception ex) {}
   }
   
   @RequestMapping("board/insert.do")
   public String board_insert(HttpServletRequest request,
		   HttpServletResponse response)
   {
	   // 화면 이동 
	   return "../board/insert.jsp";
   }
   @RequestMapping("board/insert_ok.do")
   public void board_insert_ok(HttpServletRequest request,
		   HttpServletResponse response)
   {
	   String name=request.getParameter("name");
	   String subject=request.getParameter("subject");
	   String content=request.getParameter("content");
	   String pwd=request.getParameter("pwd");
	   System.out.println(name);
	   System.out.println(subject);
	   BoardVO vo=new BoardVO();
	   vo.setName(name);
	   vo.setSubject(subject);
	   vo.setPwd(pwd);
	   vo.setContent(content);
	   
	   BoardDAO.boardInsert(vo);
   }
   // 화면 변경 
   @RequestMapping("board/detail.do")
   public String board_detail(HttpServletRequest request,
		   HttpServletResponse response)
   {
	   return "../board/detail.jsp";
   }
   
   @RequestMapping("board/detail_vue.do")
   public void board_detail_vue(HttpServletRequest request,
		   HttpServletResponse response)
   {
	   String no=request.getParameter("no");
	   BoardVO vo=BoardDAO.boardDetailData(Integer.parseInt(no));
	   try
	   {
		   ObjectMapper mapper=new ObjectMapper();
		   String json=mapper.writeValueAsString(vo);
		   
		   response.setContentType("text/plain;charset=UTF-8");
		   PrintWriter out=response.getWriter();
		   out.write(json);
	   }catch(Exception ex) {}
   }
   /*
    *         axios.get('../board/delete_vue.do',{
    				params:{
    					no:this.no,
    					pwd:this.pwd
    				}
    			}
    			
    			board/delete_vue.do?no=1&pwd=1234
    			
    			=> Ajax => data:{no:1,pwd:'1234'}
    			
    		fetch('../board/delete_vue.do?no=${no}&....')
    		         JSON / 일반 문자열 
    		javascript ===== server(MVC,Spring,NodeJS)
    		             |
    		           ajax 
    		           -------------
    		           axios
    		           fetch 
    		           ------------- async / await 
    */
   @RequestMapping("board/delete_vue.do")
   public void board_delete_vue(HttpServletRequest request,
		   HttpServletResponse response)
   {
	   String no=request.getParameter("no");
	   String pwd=request.getParameter("pwd");
	   // 데이터베이스 연동 
	   boolean bCheck=BoardDAO.boardDelete(Integer.parseInt(no), pwd);
	   String msg="";
	   if(bCheck==true)
	   {
		   msg="yes";
	   }
	   else
	   {
		   msg="no";
	   }
	   // Vue로 전송 
	   try
	   {
		   response.setContentType("text/html;charset=UTF-8");
		   PrintWriter out=response.getWriter();
		   out.write(msg);
		   // 일반 문자열 => text/html 
		   // JSON     => text/plain
	   }catch(Exception ex) {}
   }
   @RequestMapping("board/update.do")
   public String board_update(HttpServletRequest request,
		   HttpServletResponse response)
   {
	   return "../board/update.jsp";
   }
   
   @RequestMapping("board/update_vue.do")
   public void board_update_vue(HttpServletRequest request,
		   HttpServletResponse response)
   {
	   String no=request.getParameter("no");
	   BoardVO vo=BoardDAO.boardUpdateData(Integer.parseInt(no));
	   // then(response)
	   try
	   {
		   ObjectMapper mapper=new ObjectMapper();
		   String json=mapper.writeValueAsString(vo);
		   
		   response.setContentType("text/plain;charset=UTF-8");
		   PrintWriter out=response.getWriter();
		   out.write(json);
		   // 일반 문자열 => text/html 
		   // JSON     => text/plain
	   }catch(Exception ex) {}
   }
   
   @RequestMapping("board/update_ok.do")
   public void board_update_ok(HttpServletRequest request,
		   HttpServletResponse response)
   {
	   String name=request.getParameter("name");
	   String subject=request.getParameter("subject");
	   String content=request.getParameter("content");
	   String pwd=request.getParameter("pwd");
	   String no=request.getParameter("no");
	   System.out.println(name);
	   System.out.println(subject);
	   BoardVO vo=new BoardVO();
	   vo.setName(name);
	   vo.setSubject(subject);
	   vo.setPwd(pwd);
	   vo.setContent(content);
	   vo.setNo(Integer.parseInt(no));
	   
	   // DB연동
	   String msg="no";
	   
	   boolean bCheck=BoardDAO.boardUpdate(vo);
	   if(bCheck==true)
	   {
		   msg="yes";
	   }
	   
	   try
	   {
		   response.setContentType("text/html;charset=UTF-8");
		   PrintWriter out=response.getWriter();
		   out.write(msg);
		   // 일반 문자열 => text/html 
		   // JSON     => text/plain
	   }catch(Exception ex) {}
	   
   }
}
