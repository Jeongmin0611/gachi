package com.bitcamp.gachi.admin;


import java.util.List;
import java.util.Map;

import com.bitcamp.gachi.admin.MemberVO;
import com.bitcamp.gachi.admin.CreatorVO;
import com.bitcamp.gachi.admin.AllVO;

public interface CreatorDaoImp {
	
	public List<AllVO> selectAllCreator(Map<String, String> dbParam); //전체 크리에이터 회원리스트
	
	public int countAllCreator(); // 전체 크리에이터 명 수 (현재 크리에이터 + 탈퇴 크리에이터)

	public int countNowCreator(); // 현재 크리에이터 명 수

	public int countDeletedCreator(); // 탈퇴 크리에이터 명 수 
	
	public List<AllVO> creatorBoardSelectAll(PagingVO vo);//크리에이터 소개 페이지 리스트	

	public AllVO creatorBoardViewSelect(String userid);//크리에이터 소개 상세 (사진, 닉네임, 소개글)
	
	public List<AllVO> creatorBoardViewSelectClass(String userid);//크리에이터 소개 상세 (관련 클래스)

	public AllVO selectCreator(String userid); // 레코드 1개 멤버회원 가져오기

	public int creatorMemberUpdate(AllVO vo); //크리에이터 정보 수정
	
	public int creatorleaveMemberUpdate(String userid); //크리에이터 탈퇴 정보수정
	
	public int creatorMemberDelete(String userid); //크리에이터 정보삭제
	
	public List<Integer> dashForCreator(Map<String, List> dbParam); // 크리에이터 통계 그래프

	public List<Map<String, Integer>> CreatorForGender(Map<String, String> dbParam_pie); //크리에이터 파이

	public List<Map<String, Integer>> CreatorForAge(Map<String, String> dbParam_pie); //크리에이터 파이 

	public List<Map<String, Integer>> CreatorForCategory(Map<String, String> dbParam_pie);	//크리에이터 파이
	
	public int introCreatorSelectAllCount(PagingVO vo);//크리에이터 소개 페이지 (현재 크리에이터 전체 명 수)

}


