package com.sist.vo;

import java.util.Date;

import lombok.Data;
@Data
public class MemberVO {
	private String id,pwd,name,sex,post,addr1,addr2,phone,content,
                   isadmin,msg,dbday;
    private Date regdate;
}
