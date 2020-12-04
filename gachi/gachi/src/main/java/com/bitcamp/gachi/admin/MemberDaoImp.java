package com.bitcamp.gachi.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.bitcamp.gachi.admin.MemberVO;

public interface MemberDaoImp {

	public List<MemberVO> selectAllMember(); // 전체 회원 리스트 가져오기
	
	public int countAllMember(); // 전체 회원 명 수 (현재 회원 + 탈퇴 회원)

	public int countNowMember(); // 현재 회원 명 수

	public int countDeletedMember(); // 탈퇴 회원 명 수

	public MemberVO selectMember(String userid); // 레코드 1개 멤버회원 가져오기
	
	public int MemberUpdate(MemberVO vo); //회원정보 수정
	
	public int leaveMemberUpdate(String userid); //회원탈퇴 

	public List<Integer> dashForMember(Map<String, List> dbParam); //회원통계 그래프형

	public List<Map<String, Integer>> dashForGender(Map<String, String> dbParam_pie); // 회원통계 성별 파이형

	public List<Map<String, Integer>> dashForAge(Map<String, String> dbParam_pie); //회원통계 나이 파이형
	

	public List<Map<String, Integer>> dashboardMember(Map<String, String> dashmember_cnt); //대쉬보드 회원수

	public List<Map<String, Integer>> dashboardAllMember(Map<String, String> dashmember_cnt); //대쉬보드 전체회원수

	public List<Map<String, Integer>> dashboardCreator(Map<String, String> dashmember_cnt); //대쉬보드 크리에이터수
	

}
