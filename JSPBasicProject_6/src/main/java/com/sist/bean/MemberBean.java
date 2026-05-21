package com.sist.bean;

public class MemberBean {
  private String name;
  private String sex;
  private String address;
  private String phone;
  private String content;
  private boolean admin;
  private int age;
  
  
  public int getAge() {
	return age;
  }
  public void setAge(int age) {
	this.age = age;
  }
  public String getName() {
	return name;
  }
  public void setName(String name) {
	this.name = name;
  }
  public String getSex() {
	return sex;
  }
  public void setSex(String sex) {
	this.sex = sex;
  }
  public String getAddress() {
	return address;
  }
  public void setAddress(String address) {
	this.address = address;
  }
  public String getPhone() {
	return phone;
  }
  public void setPhone(String phone) {
	this.phone = phone;
  }
  public String getContent() {
	return content;
  }
  public void setContent(String content) {
	this.content = content;
  }
  public boolean isAdmin() {
	return admin;
  }
  public void setAdmin(boolean admin) {
	this.admin = admin;
  }
  
}
