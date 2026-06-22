package com.sist.model;

import java.util.Arrays;

public class TimeConfig {
	   public static String reserveTime()
	   {
		   String time="";
		   String[] times={"10:00","11:00","12:00","12:30","13:00","13:30"
				          ,"14:00","15:00","16:00","17:00","18:00",
				          "18:30","19:00","19:30","20:00","21:00","22:00"};
		   int[] com=new int[(int)(Math.random()*7)+3];
		   int su=0;
		   boolean bCheck=false;
		   for(int i=0;i<com.length;i++)
		   {
			   bCheck=true;
			   while(bCheck) // 중복 체크 
			   {
				   su=(int)(Math.random()*times.length);
				   bCheck=false;
				   for(int j=0;j<i;j++) // 중복체크 
				   {
					   if(com[j]==su)
					   {
						   bCheck=true; // while으로 이동 
						   break;
					   }
				   }
			   }
			   com[i]=su;
		   }
		   Arrays.sort(com);
		   for(int i=0;i<com.length;i++)
		   {
			   time+=times[com[i]]+",";
		   }
		   time=time.substring(0,time.lastIndexOf(","));
		   System.out.println(time);
		   return time;
	   }
}
