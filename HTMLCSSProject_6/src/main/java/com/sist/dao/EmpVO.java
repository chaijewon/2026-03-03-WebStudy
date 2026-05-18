package com.sist.dao;
/*
 *   EMPNO    NOT NULL NUMBER       
ENAME    NOT NULL VARCHAR2(50) 
JOB      NOT NULL VARCHAR2(50) 
HIREDATE NOT NULL DATE         
SAL      NOT NULL NUMBER(10,2) 
DEPTNO   NOT NULL NUMBER       
ISADMIN           CHAR(1) 
 */

import java.util.Date;

import lombok.Data;
@Data
public class EmpVO {
   private int empno,sal;
   private String ename,job,dbday,sal2;
   private Date hiredate;
}
