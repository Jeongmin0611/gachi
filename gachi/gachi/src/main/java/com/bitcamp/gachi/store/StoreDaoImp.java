package com.bitcamp.gachi.store;

import java.util.List;

import com.bitcamp.gachi.admin.AllVO;

public interface StoreDaoImp {
	//상품 리스트
	public List<AllVO> storeAllRecord(String category);

}
