package com.bitcamp.gachi.admin;

import java.util.List;

public interface NoticeDaoImp {
	//공지사항 총 레코드 구하기
	public List<NoticeVO> selectList();
	
	//공지사항 총 레코드 수 구하기
	public int getAllRecord(NoticePageVO vo);
	
	//공지사항 글쓰기
	public int insertNotice(NoticeVO vo);
	
	
	
}
