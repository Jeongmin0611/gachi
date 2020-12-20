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
	//상품 review 등록
	public int insertReview(AllVO vo);
	//상품 review 수정
	public int updateReview(AllVO vo);
	//상품 구매여부 확인
	public int orderCheck(@Param("code") String code, @Param("userid") String userid);
	
}
