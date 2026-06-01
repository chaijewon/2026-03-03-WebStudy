package com.sist.vo;
import java.util.*;

import lombok.Data;
/*
 *    SELECT name,subject,TO_CHAR(regdate,'yyyy-mm-dd') as dbday
 *          ----- ------- -----------------------------
 *          | setName(rs.getString(1))
 */
@Data
public class DataBoardVO {
   private int no,hit,filesize;
   private String name,subject,content,pwd,filename,dbday;
   private Date regdate;
}
