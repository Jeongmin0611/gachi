package com.bitcamp.gachi.admin;

import java.util.List;
import java.util.Map;

public interface EventDaoImp {

	List<EventVO> selectEventList(Map<String, String> dbParam); //이벤트 리스트

	int selectCntAllEvent(Map<String, String> dbParam); //이벤트 카운트

	EventVO selectEvent(String event_num); //이벤트1개내용 

	int updateEvent(EventVO vo);  //이벤트 수정 ;

	String selectEventImg(String event_num);

	void updateEventImg(Object event_img, String event_num);
	
	

}
