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
import com.sist.model.*;
// 우분투 => 오라클 : IP 
// => 우분투안에서만 실행 => domain : ngrook => AWS 
// => URI 주소 마지막 => .do가 있는 경우에 servlet을 호출 
// MVC는 무조건 Controller를 거쳐야 수행 
/*
 *                            DispatcherServlet
 *    브라우저 (주소창) 요청 ===== Controller ======== Model 찾기 
 *                                                |
 *                                                Model 메소드 호출 
 *                                                ------
 *                                                  DAO연동 : JDBC/DBCP => MyBatis
 *                                                |
 *                                               결과값 
 *                                                | ===> request/session
 *                                              Controller
 *                                                | ===> request/session을 전송 
 *                                              JSP 찾아서 
 *                                              결과값 전송 
 *    1) 클래스 구분 / 메소드 찾기 => 어노테이션 
 *                               | 기능은 없다 => 검색(인덱스)
 *                                 => 쉽게 찾기 
 *    2) 필요한 데이터를 등록 => XML 
 *    3) 데이터베이스 연동 => MyBatis / JPA
 *    4) MVC 동작 방법 
 *    ------------------------------ 라이브러리 : SpringBoot/SpringFramework
 *    
 *    어노테이션 : 알아보기 쉽게 만든 것 
 *              주석이 아니다 (인식 없다) 
 *              => 구분 => 마커 
 *      | 복잡한 XML / IF문을 단순화 => 소스 간결화 / 생산성 향상
 *    
 *    => 제작 
 *    1. Retention : 메모리 할당시 => 언제까지 사용되는 
 *       SOURCE / CLASS / RUNTIME 
 *       ---------------  -------- 프로그램 종료시까지 유지 
 *       컴파일시에 바로 사라진다 @Override
 *    2. Target : 어디에 붙일까? 
 *       **Type => 클래스 위에 (클래스 찾기)
 *       **Method => 메소드 위에 (메소드 찾기)
 *       Constructor => 생성자 위에 (생성자 찾기)
 *       Parameter => 매개변수 위에 (매개변수 찾기)
 *       **Filed => 멤버변수 위에 (멤버변수 찾기)
 *       -------------------------------------
 *       
 *       위에 있거나 옆에 있다 
 *       @
 *       public void disp(@어노테이션 B b)
 *       {
 *       }
 *       
 * 
 */
// => 스프링은 @WebServlet가 없다 : web.xml에 등록 
@WebServlet("*.do")
public class DispatcherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private String pack="com.sist.model";// XML등록 
    private List<String> clsList=new ArrayList<String>();
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		try
		{
			// 수정 => realPath() => 리눅스 호환 
			// => 경로 /
			String path="C:\\Users\\sist\\git\\webstudy\\JSPMVCProject_5\\src\\main\\java";
			String s=path+"\\"+pack.replace(".", "\\");
			System.out.println(s);
			File dir=new File(s);
			File[] files=dir.listFiles();
			for(File f:files)
			{
				if(f.isFile())
				{
					String name=f.getName();
					String ext=name.substring(name.lastIndexOf(".")+1);
					if(ext.equals("java"))
					{
						//System.out.println(name);
						String ss=pack+"."+name.substring(0,name.lastIndexOf("."));
						System.out.println(ss);
						/*Class clsName=Class.forName(ss);
						Object obj=clsName.getDeclaredConstructor().newInstance();
						System.out.println(obj);*/
						clsList.add(ss);
					}
				}
			}
		}catch(Exception ex){}
	}

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// 사용자 요청 정보 받기 
		/*
		 *   http://localhost/JSPMVCProject_5/food/list.do
		 *   
		 *   uri="/JSPMVCProject_5/food/list.do"
		 *   cmd="food/list.do"
		 */
		String uri=request.getRequestURI();
		String cmd=uri.substring(request.getContextPath().length()+1);
		try
		{
			// 메소드 찾기  com.sist.model.FoodModel
			for(String cls:clsList)
			{
				Class clsName=Class.forName(cls);
				if(clsName.isAnnotationPresent(Controller.class)==false)
				{
					continue;
					// @Controller가 없는 클래스면 => 사용하지 않는다 
				}
				// @Controller가 있는 클래스는 메모리 할당을 한다 
				Object obj=clsName.getDeclaredConstructor().newInstance();
				// 클래스안에서 메소드 찾는다 
				// 클래스의 전체 메소드를 가지고 온다 
				Method[] methods=clsName.getDeclaredMethods();
				for(Method m:methods)
				{
					// method 위에 @RequestMapping가 존재하는 확인
					RequestMapping rm=m.getAnnotation(RequestMapping.class);
					if(rm.value().equals(cmd))
					{
						String jsp=(String)m.invoke(obj, request,response);
						if(jsp==null)
						{
							// void => Jquery / Vue => JSON전송 : JavaScript연결
							return; // 메소드 자체에서 처리
						}
						else if(jsp.startsWith("redirect:"))
						{
							// sendRedirect() => request 초기화후에 화면 변경
							// => _ok
							response.sendRedirect(jsp.substring(jsp.indexOf(":")+1));
						}
						else
						{
							// request전송 => forward이용 => request값을 유지 
							RequestDispatcher rd=request.getRequestDispatcher(jsp);
							rd.forward(request, response);
						}
						return;
					}
				}
			}
		}catch(Exception ex){}
		
	}

}
