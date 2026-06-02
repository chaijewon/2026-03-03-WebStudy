package com.sist.anno;
@Controller
public class MemberModel {
   @RequestMapping("member/login.do")
   public void login()
   {
	   System.out.println("login() Call...");
   }
}
