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

	public int countEndDelivery(); //배송완료건수 

	public int countDelivery(); //배송중인건수 

	public int countWaitDelivery(); //배송준비건수 

	public int countdeposit(); //결제완료건수

	public List<MemberVO> selectAllDelivery(Map<String, String> dbParam); //배송 리스트

	public int selectCntAllDelivery(Map<String, String> dbParam); //배송 전체 건수 카운트

	public SettleVO selectDelivery(String code); //딜리버리 뷰페이지 정보전달

	public int DeliveryUpdate(Map<String, String> dbParam); //딜리버리 정보수정

	public Integer countWaitClass(String uerid); // 크리에이터 대쉬보드 미승인클래스

	public Integer totalPayment(Map<String, Object> dbParam); //크리에이터 대쉬보드 정산금액 

	public Integer non_Payment(String uerid); // 크리에이터 대쉬보드 미정산금액

	public List<Integer> creatorPayment(Map<String, Object> dbParam);

	public List<Integer> classTotalMember(Map<String, Object> dbParam); //크리에이터 스탯클래스 그래프 데이터 

	public List<Map<String, Integer>> StatClassForAge(Map<String, Object> dbParam2); //크리에이터스탯클래스 파이 에이지

	public List<Map<String, Integer>> StatClassForGender(Map<String, Object> dbParam2); //크리에이터스탯클래스 파이 젠더 

	public Integer creatorSalesY(Map<String, String> dbParam); //크리에이터 > 크리에이터정산

	public Integer creatorSalesN(Map<String, String> dbParam); //크리에이터 > 크리에이터 미정산 

	public Integer creatorAllSales(Map<String, String> dbParam); //크리에이터 > 크리에이터 총정산

	public List<SettleVO> CreatorAllSettle(Map<String, String> dbParam); // 크리에이터 > 정산리스트 

	public int CreatorCntAllSettle(Map<String, String> dbParam); //크리에이터 > 정산 카운트

	public List<QnaVO> selectAllQna(Map<String, String> dbParam); // 어드민 > 질문/답변 

	public int selectCntAllQna(Map<String, String> dbParam); //어드민 > 질문답변 카운트 

	public List<QnaVO> selectAllReply(Map<String, String> dbParam); //어드민 >수강리뷰 리스트 

	public int selectCntAllReply(Map<String, String> dbParam); //어드민>수강리뷰 카운트 

	public QnaVO selectReplyView(int num);  //어드민 상품리뷰 뷰 

	public QnaVO selectAnswerView(int num); //어드민 질문답변

	public int UpdateAnswer(Map<String, String> dbParam);  //어드민 답변 !

	public List<QnaVO> creatorAllQna(Map<String, String> dbParam);  //크리에이터 질문답변 리스트

	public int creatorCntAllQna(Map<String, String> dbParam);  //크리에이터 질문답변 카운트

	public QnaVO creatorAnswerView(int num);  // 크리에이터 질문답변 1개 리스트 

	public int creatorUpdateAnswer(Map<String, String> dbParam); //크리에이터 답변 업데이트
	
	
	


	
	
	
	
	
	
	
	

//	public List<SettleVO> selectStoreList(Map<String, String> dbParam);
//
//	public int selectCntAllGoods(Map<String, String> dbParam);

//	public int SettleStateUpdate(String userid);
	
	
	
}