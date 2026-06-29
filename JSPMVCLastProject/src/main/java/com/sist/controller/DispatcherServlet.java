package com.sist.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.*;
import java.lang.reflect.Method;
import java.util.*;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;

import java.net.*;
// => MVC구조 : => 호환성 (윈도우 / 우분투 => AWS 호스팅) => .jar (라이브러리 생성)
@WebServlet("*.do")
public class DispatcherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    // 클래스 저장 => Model 클래스 
	private List<String> clsList=
			    new ArrayList<String>();
	/*
	 *   com.sist.model.FoodModel 
	 *   com.sist.model.MemberModel
	 */
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		try
		{
			URL url=this.getClass().getClassLoader().getResource(".");
			// 파일로 변경 
			File file=new File(url.toURI());
			//System.out.println(file.getPath()); // 경로명 + 파일명 
			String path=file.getPath();
			path=path.replace("\\", File.separator);
			// 자동으로 변환 window:\\ , 우분투 : / File.separator
			// => 우분투 => war => 톰캣에 올려서 실행 
			/*
			 *   C:\webDev\webStudy\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\JSPMVCLastProject\WEB-INF\classes
			 *   
			 */
			path=path.substring(0,path.lastIndexOf(File.separator));
			//System.out.println(path);
			path=path+File.separator+"application.xml";
			//System.out.println(path);
			
			// xml안에 있는 데이터를 추출 : 파싱 
			DocumentBuilderFactory dbf=DocumentBuilderFactory.newInstance();
			// 파싱기 생성 
			DocumentBuilder db=dbf.newDocumentBuilder();
			// 파싱할 XML을 읽어 온다 
			Document doc=db.parse(new File(path));
			// root 태그 읽기 => xml (root태그는 table과 같은 역할)
			Element beans=doc.getDocumentElement();
			System.out.println(beans.getTagName());
			// 같은 이름의 태그를 모아서 데이터 추출 
			NodeList list=doc.getElementsByTagName("context:component-scan");
			String pack="";
			for(int i=0;i<list.getLength();i++)
			{
				Element elem=(Element)list.item(i);
				pack=elem.getAttribute("basepackage");
			}
			System.out.println(pack);
			clsList=ComponentScan.componentScan(file.getPath(), pack);
			
		}catch(Exception ex) {}
	}

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// 사용자 요청 => URL주소 
		String uri=request.getRequestURI();
		uri=uri.substring(request.getContextPath().length()+1);
		 /*
		 *   main/main.do  food/list.do food/detail.do
		 *   
		 *   public class MainModel
		 *   {
		 *     @RequestMapping("main/main.do")
		 *     public String main_main(request,response)
		 *     {
		 *       ... 처리
		 *     }
		 *   }
		 */
		System.out.println(uri);
		try
		{
			// Model 클래스 찾기 => @RequestMapping 
			// => 메소드 호출 
			for(String cls:clsList)
			{
				// 메모리 할당 
				Class clsName=Class.forName(cls);
				// 클래스 위에 @Controller가 존재 여부 확인 
				if(clsName.isAnnotationPresent(Controller.class)==false)
					continue; // @Controller가 없는 경우 제외 
				// @Controller => Model
				Object obj=clsName.getDeclaredConstructor().newInstance();
				// 메모리 할당 
				// 요청한 기능 찾기 => 메소드 
				Method[] methods=clsName.getDeclaredMethods();
				// 모든 메소드를 가지고 온다 
				for(Method m:methods)
				{
					if(!m.isAnnotationPresent(RequestMapping.class))
						continue;
					
					RequestMapping rm=m.getAnnotation(RequestMapping.class);
					/*
					 * if(rm==null) continue;
					 */
					if(rm.value().equals(uri))
					{
						String jsp=(String)m.invoke(obj, request,response);
						
						if(jsp==null) // void 
						{
							// JavaScript => Ajax 
							return;
						}
						else if(jsp.startsWith("redirect:"))
						{
							// sendRedirect : request초기화 => 화면 변경 
							jsp=jsp.substring(jsp.indexOf(":")+1);
							response.sendRedirect(jsp);
							// return "redirect:list.do"
						}
						else
						{
							// forward : request를 유지 => 화면 변경 
							RequestDispatcher rd=
									request.getRequestDispatcher(jsp);
							rd.forward(request, response);
						} 
						
						return;
						
					}
				}
				
			}
		}catch(Exception ex) 
		{
			ex.printStackTrace();
		}
		
	}

}
