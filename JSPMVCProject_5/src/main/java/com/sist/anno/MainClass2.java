package com.sist.anno;
import java.lang.reflect.Method;
import java.util.*;
public class MainClass2 {

	public static void main(String[] args) throws Exception{
		// TODO Auto-generated method stub
        Scanner scan=new Scanner(System.in);
        String[] cls={
        	"com.sist.anno.FoodModel",
        	"com.sist.anno.GoodsModel",
        	"com.sist.anno.MemberModel",
        	"com.sist.anno.ReplyModel",
        	"com.sist.anno.MainClass"
        };
        System.out.print("URI입력:예) goods/list.do");
        String uri=scan.next();
        for(String clsName:cls)
        {
        	Class c=Class.forName(clsName);
        	Object obj=c.getDeclaredConstructor().newInstance();
        	// 클래스 메모리 할당 
        	Method[] methods=c.getDeclaredMethods();
        	for(Method m:methods)
        	{
        		RequestMapping rm=m.getAnnotation(RequestMapping.class);
        		if(rm.value().equals(uri))
        		{
        			m.invoke(obj, null);
        		}
        		
        	}
        }
        
	}

}
