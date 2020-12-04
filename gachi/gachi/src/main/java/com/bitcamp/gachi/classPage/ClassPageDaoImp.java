package com.bitcamp.gachi.classPage;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.bitcamp.gachi.admin.AllVO;

public interface ClassPageDaoImp {
	//클래스 리스트
	public List<AllVO> classPageAllRecord(@Param("category") String category, @Param("selectval") String selectval);
	//클래스 view
	public AllVO classView(String code);
	//메인화면 인기순
	public List<AllVO> homeClassPopular();
	//메인화면 신규
	public List<AllVO> homeClassNew();
}
