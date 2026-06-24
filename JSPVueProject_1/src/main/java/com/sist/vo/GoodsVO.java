package com.sist.vo;

import lombok.Data;
import lombok.Getter;

/*
 *    NO                                        NOT NULL NUMBER
 GOODS_NAME                                NOT NULL VARCHAR2(1000)
 GOODS_SUB                                          VARCHAR2(1000)
 GOODS_PRICE                               NOT NULL VARCHAR2(50)
 GOODS_DISCOUNT                                     NUMBER
 GOODS_FIRST_PRICE                                  VARCHAR2(20)
 GOODS_DELIVERY                            NOT NULL VARCHAR2(20)
 GOODS_POSTER                                       VARCHAR2(260)
 HIT                                                NUMBER
      &lt;%= %&gt;
 */
@Data
public class GoodsVO {
   private int no,discount,hit,won;
   private String name,sub,price,fprice,delivery,poster;
}
