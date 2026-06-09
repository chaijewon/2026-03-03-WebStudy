package com.sist.model;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.PrintWriter;
/*
 *    1. request전송 
 *       return "../main/main.jsp";
 *    2. sendRedirect()
 *       return "redirect:list.do";
 *    3. javascript => void 
 *     
 */
import java.util.*;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.sist.dao.*;
@Controller
public class MusicModel {
  @RequestMapping("js/music.do")
  public void music_list(HttpServletRequest request,HttpServletResponse response)
  {
	  List<MusicVO> list=MusicDAO.musicListData(); // []
	  try
	  {
		  JSONArray arr=new JSONArray();
		  for(MusicVO vo:list) // {} 
		  {
			  JSONObject obj=new JSONObject();
			  obj.put("no", vo.getNo()); // {no:1,title: ,.....}
			  obj.put("title",vo.getTitle());
			  obj.put("singer", vo.getSinger());
			  obj.put("album", vo.getAlbum());
			  obj.put("poster", vo.getPoster());
			  obj.put("state", vo.getState());
			  obj.put("id", vo.getIdcrement());
			  arr.add(obj);
		  }
		  
		  response.setContentType("text/plain;charset=UTF-8");
		  PrintWriter out=response.getWriter();
		  out.write(arr.toJSONString());
	  }catch(Exception ex) {}
  }
}






