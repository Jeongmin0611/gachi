package com.bitcamp.gachi.admin;

import java.util.List;
import java.util.Map;

public interface GoodsDaoImp {

	List<GoodsVO> selectAllGoods(Map<String, String> dbParam);

	GoodsVO selectGoods(String code);


}
