package com.bitcamp.gachi.mypage;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface MileageDaoImp {
	//마일리지 있는지 없는지 검사
	public int countMileage(String userid);
	//전체 레코드 선택
	public List<MileageVO> mileageAllRecord(String userid);
	//현재 마일리지
	public int mileageAllSum(String userid);
	//총 적립 마일리지
	public int mileagePosiSum(String userid);
	//사용한 마일리지
	public int mileageNegaSum(String userid);
	//마일리지 적립
	public int mileageInsert(@Param("userid") String userid, @Param("goods_order_code") String goods_order_code);
}
