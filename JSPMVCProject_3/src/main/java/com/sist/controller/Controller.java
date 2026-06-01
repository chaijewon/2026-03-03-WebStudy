package com.sist.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.*;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;

import com.sist.model.*;

@WebServlet("*.do")
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private Map<String,Model> clsMap=new HashMap<String, Model>();
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		// XML => 클래스 등록 => 
		try
		{
			// RealPath 
			String path="C:\\Users\\sist\\git\\webstudy\\JSPMVCProject_3\\src\\main\\webapp\\WEB-INF\\application.xml";
			// 파싱 
			DocumentBuilderFactory dbf=DocumentBuilderFactory.newInstance();
			// 파서기 생성 => HTML / WML / XML 
			// => 클래스 생성하는 패턴 => Factory Pattern
			DocumentBuilder db=dbf.newDocumentBuilder();
			// DocumentBuilder를 이용해서 파싱 
			Document doc=db.parse(new File(path));
			// doc는 XML 파싱한 결과를 저장 
			// Document =>  문서 저장 공간 
			
			// 값 읽기 => 테이블
			Element root=doc.getDocumentElement();
			System.out.println(root.getTagName());
			// <beans> <bean>를 모아서 => 데이터 추출
			NodeList list=root.getElementsByTagName("bean");
			// bean안에 있는 id / class를 추출 
			for(int i=0;i<list.getLength();i++)
			{
				Element bean=(Element)list.item(i);
				String id=bean.getAttribute("id");
				String cls=bean.getAttribute("class");
				//System.out.println("id:"+id+",class="+cls);
				Class clsName=Class.forName(cls);
				Model model=(Model)clsName.getDeclaredConstructor().newInstance();
				clsMap.put(id, model);
				System.out.println("id:"+id+",class="+model);
				//싱글턴
			}
			
		}catch(Exception ex){}
	}

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// 사용자 요청 => 처리 => 결과값 전송 : GET/POST => 동시 처리 
		try
		{
			// http://localhost
			// main/main.do = URI
			String uri=request.getRequestURI();
			String key=uri.substring(request.getContextPath().length()+1);
			//System.out.println(key);
			// Model 클래스 찾기 
			Model model=clsMap.get(key);
			// 요청 처리 
			String jsp=model.handleRequest(request, response);
			// 결과값을 JSP로 전송 
			RequestDispatcher rd=request.getRequestDispatcher(jsp);
			rd.forward(request, response);
		}catch(Exception ex) {}
		
	}

}
