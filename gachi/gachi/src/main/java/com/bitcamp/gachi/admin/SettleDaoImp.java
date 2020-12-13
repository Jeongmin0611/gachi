package com.bitcamp.gachi.admin;

import java.util.List;
import java.util.Map;

public interface SettleDaoImp {
	
	public List<SettleVO> manageSettle(Map<String, String> dbParam); // 정산 관리 리스트

	public Integer countAllSales(Map<String, String> dbParam);
	
	public Integer countSalesN(Map<String, String> dbParam);
	
	public Integer countSalesY(Map<String, String> dbParam);

	public Integer cntClassN(Map<String, String> dbParam);

	public Integer cntStatClassAll(Map<String, String> dbParam);

	public Integer cntClassY(Map<String, String> dbParam);

	public Integer cntStoreAll(Map<String, String> dbParam);

	public Integer cntStoreN(Map<String, String> dbParam);

	public Integer cntStoreY(Map<String, String> dbParam);

	public Integer StatStoreSum(Map<String, String> dbParam);

	public Integer paymentStoreAll(Map<String, String> dbParam);

	public Integer paymentStoreN(Map<String, String> dbParam);

	public Integer paymentStoreY(Map<String, String> dbParam);

	public List<SettleVO> managePaymentStore(Map<String, String> dbParam);

	public List<SettleVO> managePaymentClass(Map<String, String> dbParam);

	public Integer paymentClassAll(Map<String, String> dbParam);

	public Integer paymentClassY(Map<String, String> dbParam);

	public Integer paymentClassAll_Dash(Map<String, String> dbParam1);

	public Integer paymentStoreAll_Dash(Map<String, String> dbParam1);

	public List<SettleVO> managePaymentClass_Dash(Map<String, String> dbParam1);

	public Integer paymentAll_Dash(Map<String, String> dbParam1);

	public List<Integer> dashClassChart(Map<String, List> dbParam);

	public List<Integer> dashStoreChart(Map<String, List> dbParam);

	public List<Integer> dashAllChart(Map<String, List> dbParam);

	public int selectCntAllStore(Map<String, String> dbParam);

	public List<SettleVO> selectAllStore(Map<String, String> dbParam);

	public Integer paymentClassN(Map<String, String> dbParam);

	public int selectCntAllClass(Map<String, String> dbParam);

	public List<SettleVO> selectAllClass(Map<String, String> dbParam);

	public int selectCntAllSettle(Map<String, String> dbParam);

	public List<SettleVO> selectAllSettle(Map<String, String> dbParam);

	public List<Integer> sumStoreSalesByDay(Map<String, Object> dbParam);
	
	public List<Integer> sumClassSalesByDay(Map<String, Object> dbParam);

	public void SettleInfoInsert(Map<String, String> dbParam);

	public int SettleStateUpdate(String order_code);

	public int PaymentStateUpdate(String goods_order_code);

	public List<Map<String, Integer>> ClassForAge(Map<String, String> dbParam_pie); //클래스 파이차트 연령정보 

	public List<Map<String, Integer>> ClassForGender(Map<String, String> dbParam_pie); //클래스 파이차트 성별정보

	public List<Map<String, Integer>> StoreForAge(Map<String, String> dbParam_pie); //스토어 파이 차트 연령정보

	public List<Map<String, Integer>> StoreForGender(Map<String, String> dbParam_pie); //스토어 파이 차트 성별정보

//	public List<SettleVO> selectStoreList(Map<String, String> dbParam);
//
//	public int selectCntAllGoods(Map<String, String> dbParam);

//	public int SettleStateUpdate(String userid);
	
	
	
}
