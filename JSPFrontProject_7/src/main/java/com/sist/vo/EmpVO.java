package com.sist.vo;
import java.util.*;

import lombok.Data;
/*
 *   MyBatis 
 *   1. CRUD => <select> <input> <update> <delete>
 *      resutlType / parameterType 
 *                   --------------- ?에 값을 채우는 상태
 *      ---------- 실행 결과값을 받아서 저장 변수 
 *   2. JOIN 
 *      resultMap : dvo.dname => getDvo().setDname()
 *   3. 동적 쿼리 = JSTL 
 *      <if test="조건">
 *      <choose>
 *        <when test=""></when>
 *        ..
 *        <otherwise></otherwise>
 *      </choose> 
 *      <foreach var="" items=""> : IN
 *      <where> <set> <trim> 
 *      <bind>  
 */
@Data
public class EmpVO {
   private int empno,sal,deptno;
   private String ename,job,dbday;
   private Date hiredate;
}
