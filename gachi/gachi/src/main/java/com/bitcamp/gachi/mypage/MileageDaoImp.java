package com.bitcamp.gachi.mypage;

import java.util.List;

public interface MileageDaoImp {
	//전체 레코드 선택
	public List<MileageVO> mileageAllRecord();
	//현재 마일리지
	public int mileageAllSum();
	//총 적립 마일리지
	public int mileagePosiSum();
	//사용한 마일리지
	public int mileageNegaSum();
}
