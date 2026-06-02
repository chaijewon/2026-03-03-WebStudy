package com.sist.anno;
@Controller
public class GoodsModel {
   
   @RequestMapping("goods/list.do")
   public void goods_list()
   {
	   
	   System.out.println("goods_list() Call...");
   }
   @RequestMapping("goods/detail.do")
   public void goods_detail()
   {
	   System.out.println("goods_detail() Call...");
   }
}
