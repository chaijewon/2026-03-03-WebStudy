package com.sist.service;
import java.util.*;
import com.sist.vo.*;
public interface GoodsService {
   public List<GoodsVO> goodsListData(int start);
   public int goodsTotalPage();
}
