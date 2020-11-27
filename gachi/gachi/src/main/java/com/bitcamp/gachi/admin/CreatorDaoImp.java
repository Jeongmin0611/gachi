package com.bitcamp.gachi.admin;


import java.util.List;
import com.bitcamp.gachi.admin.MemberVO;
import com.bitcamp.gachi.admin.CreatorVO;
import com.bitcamp.gachi.admin.AllVO;

public interface CreatorDaoImp {
	
	public List<AllVO> selectAllCreator(); //전체 크리에이터 회원리스트
	
	public int countAllCreator(); // 전체 크리에이터 명 수 (현재 크리에이터 + 탈퇴 크리에이터)

	public int countNowCreator(); // 현재 크리에이터 명 수

	public int countDeletedCreator(); // 탈퇴 크리에이터 명 수 
	
	public List<AllVO> creatorBoardSelectAll();//크리에이터 소개 페이지 리스트
	
	public AllVO selectCreator(String userid); // 레코드 1개 멤버회원 가져오기

	public int creatorMemberUpdate(AllVO vo); //크리에이터 정보 수정
	
	public int creatorleaveMemberUpdate(String userid); //크리에이터 탈퇴 정보수정
	
	public int creatorMemberDelete(String userid); //크리에이터 정보삭제
	
}


