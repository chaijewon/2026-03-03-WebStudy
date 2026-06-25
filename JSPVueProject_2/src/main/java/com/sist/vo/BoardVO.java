package com.sist.vo;
import java.util.*;

import lombok.Data;
@Data
// => 오라클 함수 => as => 받는 변수명 지정 
/*
 *    SELECT no,name,TO_CHAR() as dbday
 *          ---- setName()        setDbday()
 *          setNo()  
 */
public class BoardVO {
  private int no,hit;
  private String name,subject,content,pwd,dbday;
  private Date regdate;
}
