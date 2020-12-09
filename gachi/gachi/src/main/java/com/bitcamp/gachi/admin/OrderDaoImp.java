package com.bitcamp.gachi.admin;

import java.util.List;
import java.util.Map;

public interface OrderDaoImp {

	List<OrderVO> selectAllOrder(Map<String, String> dbParam);

}
