package com.bitcamp.gachi.admin;

import java.util.List;
import java.util.Map;

public interface GoodsDaoImp {

	List<GoodsVO> selectAllGoods(Map<String, String> dbParam);

	GoodsVO selectGoods(String code);

	List<GoodsVO> selectStoreList(Map<String, String> dbParam);

	int selectCntAllGoods(Map<String, String> dbParam);

	String selectStoreImg(String code);

	void updateStoreImg(String txt, String code);

	int updateStore(GoodsVO vo);

	int selectTodayGoodsCnt();

	int selectTodayGoodsCnt(String writedate);

	void insertStore(GoodsVO vo);

	void deleteOne(String code);


}
