package com.bitcamp.gachi.board;

import java.util.List;

public interface BoardDaoImp {
	//공지사항 전체 레코드 선택
	public List<NoticeBoardVO> noticeBoardAllRecord(); 
	//공지사항 레코드 한 개 선택
	public NoticeBoardVO noticeBoardSelect(int no);
}
