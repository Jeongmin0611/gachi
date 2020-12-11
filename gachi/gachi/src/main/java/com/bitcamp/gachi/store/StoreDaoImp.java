package com.bitcamp.gachi.store;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.bitcamp.gachi.admin.AllVO;


public interface StoreDaoImp {
	//상품 리스트
	public List<AllVO> storeAllRecord(StorePageVO vo) throws Exception;
	public AllVO storeView(String code);
	public int storeListAllRecordCount(StorePageVO vo);
	
}
