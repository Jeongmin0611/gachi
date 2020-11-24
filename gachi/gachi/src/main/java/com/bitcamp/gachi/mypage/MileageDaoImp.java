package com.bitcamp.gachi.mypage;

import java.util.List;

public interface MileageDaoImp {
	//전체 레코드 선택
	public List<MileageVO> mileageAllRecord();
	//전체 레코드 합
	public int mileageAllSum();
	//양수값 합계
	public int mileagePosiSum();
	//음수값 합계
	public int mileageNegaSum();
}
