package com.bitcamp.gachi.store;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;

import com.bitcamp.gachi.admin.AllVO;

public interface StoreDaoImp {
	//상품 리스트
	public List<AllVO> storeAllRecord(@Param("category") String category, @Param("selectval") String selectval) throws Exception;
	public AllVO storeView(String code);
}
