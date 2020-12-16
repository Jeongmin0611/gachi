package com.bitcamp.gachi.admin;

import java.util.List;
import java.util.Map;

public interface EventDaoImp {

	List<QnaVO> selectEventList(Map<String, String> dbParam); //이벤트 리스트

	int selectCntAllEvent(Map<String, String> dbParam); //이벤트 카운트

	QnaVO selectEvent(String event_num); //이벤트1개내용 

	int updateEvent(QnaVO vo);  //이벤트 수정 ;
	
	

}
