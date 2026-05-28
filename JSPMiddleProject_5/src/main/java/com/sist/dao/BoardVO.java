package com.sist.dao;
import java.util.*;

import lombok.Data;
import lombok.Setter;
@Data
// desc table명
/*
 *   읽기 => getter
 *   쓰기 => setter
 */
public class BoardVO {
   private int no,hit,group_id,group_step,group_tab,root,depth;
   private String name,subject,content,pwd,dbday;
   private Date regdate;
}
