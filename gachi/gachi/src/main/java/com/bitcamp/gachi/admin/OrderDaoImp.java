package com.bitcamp.gachi.admin;

import java.util.List;
import java.util.Map;

public interface OrderDaoImp {

	List<OrderVO> selectAllOrder(Map<String, String> dbParam);

	int selectCntAllOrder(Map<String, String> dbParam);  // 오더 카운트

}
