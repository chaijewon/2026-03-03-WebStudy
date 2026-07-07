package com.sist.vo;

import lombok.Data;

/*
 *      CONTENTID     NOT NULL NUMBER(38)     
		CONTENTTYPEID          NUMBER(38)     
		AREACODE               NUMBER(38)     
		TITLE         NOT NULL VARCHAR2(4000) 
		ADDR1                  VARCHAR2(4000) 
		ADDR2                  VARCHAR2(4000) 
		MAPX                   NUMBER(38,10)  
		MAPY                   NUMBER(38,10)  
		FIRSTIMAGE             VARCHAR2(4000) 
 */
// detail 
@Data
public class TourVO {
   private int contentid,contenttypeid,areacode,likecount,replycount,hit;
   private double mapx,mapy;
   private String title,addr1,firstimage;
}
