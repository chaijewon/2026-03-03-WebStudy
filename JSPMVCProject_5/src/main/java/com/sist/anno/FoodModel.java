package com.sist.anno;
// 구분자 :(index) => if문 추가 
/*
 *   @ => 클래스 구분 (Type)
 *   class A
 *   {
 *      @ => 멤버변수 구분  (Field)
 *      B b;
 *      
 *      @ => 생성자 구분 (Constructor)
 *      public A()
 *      {
 *      }
 *      @ => 메소드 (Method)
 *      public void disp()
 *      {
 *      }
 *   }
 */
@Controller
public class FoodModel {
	   @RequestMapping("food/list.do")
	   public void food_list()
	   {
		   System.out.println("food_list() Call...");
	   }
	   @RequestMapping("food/detail.do")
	   public void food_detail()
	   {
		   System.out.println("food_detail() Call...");
	   }
	   
}
