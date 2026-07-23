package com.sist.vo;

import lombok.Data;

/*
 *  NO                NOT NULL NUMBER         
	GOODS_NAME        NOT NULL VARCHAR2(1000) 
	GOODS_SUB                  VARCHAR2(1000) 
	GOODS_PRICE       NOT NULL VARCHAR2(50)   
	GOODS_DISCOUNT             NUMBER         
	GOODS_FIRST_PRICE          VARCHAR2(20)   
	GOODS_DELIVERY    NOT NULL VARCHAR2(20)   
	GOODS_POSTER               VARCHAR2(260)  
	HIT                        NUMBER         
	REPLYCOUNT                 NUMBER         
	JJIMCOUNT                  NUMBER         
	LIKECOUNT                  NUMBER         
	STOCK                      NUMBER    
	
	상품명 / 상품 이미지 / 가격 / 배달 / 상품 내용 / 장바구니 / 바로 구매
 */
@Data
public class GoodsVO {
  private int no,goods_discount,hit,replycount,jjimcount,likecount,
              stock,price;
  private String goods_name,goods_sub,goods_first_price,goods_delivery,
                 goods_poster,goods_price;
}
