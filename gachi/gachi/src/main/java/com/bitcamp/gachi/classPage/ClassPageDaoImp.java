package com.bitcamp.gachi.classPage;
import java.util.List;

import com.bitcamp.gachi.admin.AllVO;

public interface ClassPageDaoImp {
	//클래스 리스트
	public List<AllVO> classPageAllRecord(String category);
}
