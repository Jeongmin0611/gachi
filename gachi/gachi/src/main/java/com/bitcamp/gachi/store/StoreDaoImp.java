package com.bitcamp.gachi.store;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.bitcamp.gachi.admin.AllVO;
import com.bitcamp.gachi.admin.QnaVO;


public interface StoreDaoImp {
	//상품 리스트
	public List<AllVO> storeAllRecord(StorePageVO vo) throws Exception;
	public AllVO storeView(String code);
	public int storeListAllRecordCount(StorePageVO vo);
	public int storeListCategoryRecordCount(StorePageVO vo);
	//상품 리뷰 리스트
	public List<AllVO> reviewList(String code);
	//상품 질문답변 리스트
	public List<QnaVO> qnaList(String code);
	
	
}
