package com.sist.vo;
// 지금부터는 <%= %>는 사용하지 않는다 => ${} 
// 1. Spring / SpringBoot => MVC 

public class SawonVO {
   private int sabun;
   private String name;
   private String dept;
   private String job;
   private String loc;
   public int getSabun() {
	return sabun;
   }
   public void setSabun(int sabun) {
	this.sabun = sabun;
   }
   public String getName() {
	return name;
   }
   public void setName(String name) {
	this.name = name;
   }
   public String getDept() {
	return dept;
   }
   public void setDept(String dept) {
	this.dept = dept;
   }
   public String getJob() {
	return job;
   }
   public void setJob(String job) {
	this.job = job;
   }
   public String getLoc() {
	return loc;
   }
   public void setLoc(String loc) {
	this.loc = loc;
   }
   
}
