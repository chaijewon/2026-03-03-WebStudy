package com.sist.vo;
import java.util.*;

import lombok.Data;
/*
 *   NO                                        NOT NULL NUMBER
	 FNO                                                NUMBER
	 ID                                                 VARCHAR2(20)
	 NAME                                      NOT NULL VARCHAR2(51)
	 MSG                                       NOT NULL CLOB
	 REGDATE                                            DATE
 */
@Data
public class ReplyVO {
  private int no,fno;
  private String id,name,msg,dbday;
  private Date regdate;
}
