package com.bitcamp.gachi.admin;

import java.sql.Date;
import java.util.List;
import com.bitcamp.gachi.admin.MemberVO;
import com.bitcamp.gachi.admin.CreatorVO;
import com.bitcamp.gachi.admin.AllVO;

public interface CreatorDaoImp {
	
	public List<AllVO> selectAllCreator(); //전체 크리에이터 회원리스트
	
	public int countAllCreator(); // 전체 크리에이터 명 수 (현재 크리에이터 + 탈퇴 크리에이터)

	public int countNowCreator(); // 현재 크리에이터 명 수

	public int countDeletedCreator(); // 탈퇴 크리에이터 명 수 
}


