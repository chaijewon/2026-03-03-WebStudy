package com.sist.dao;
import java.util.*;

import lombok.Data;
@Data
public class EmpVO {
  private int empno,deptno,sal,mgr;
  private String ename,job,dbday;
  private Date hiredate;
  private DeptVO dvo=new DeptVO(); // 포함 클래스 => JOIN
}
