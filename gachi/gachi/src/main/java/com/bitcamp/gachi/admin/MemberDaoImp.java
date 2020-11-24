package com.bitcamp.gachi.admin;

import java.util.List;

import com.bitcamp.gachi.admin.MemberVO;

public interface MemberDaoImp {

	public List<MemberVO> selectAllMember(); // 전체 회원 리스트 가져오기
	
	public int countAllMember(); // 전체 회원 명 수 (현재 회원 + 탈퇴 회원)

	public int countNowMember(); // 현재 회원 명 수

	public int countDeletedMember(); // 탈퇴 회원 명 수

	
}
