package com.sist.service;

import java.util.List;

import com.sist.dao.GoodsDAO;
import com.sist.vo.GoodsVO;

public class GoodsServiceImpl implements GoodsService{

	private GoodsDAO dao=new GoodsDAO();
	@Override
	public List<GoodsVO> goodsListData(int start) {
		// TODO Auto-generated method stub
		return dao.goodsListData(start);
	}
    
	@Override
	public int goodsTotalPage() {
		// TODO Auto-generated method stub
		return dao.goodsTotalPage();
	}

}
