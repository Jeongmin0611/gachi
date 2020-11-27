package com.bitcamp.gachi.board;

import java.util.List;

import com.bitcamp.gachi.admin.PagingVO;

public interface BoardDaoImp {
	//공지사항 전체 레코드 선택
	public List<NoticeBoardVO> noticeBoardAllRecord(PagingVO vo); 
	//공지사항 레코드 한 개 선택
	public NoticeBoardVO noticeBoardSelect(int no);
	//공지사항 총 레코드 개수
	public int noticeBoardAllRecordCount(PagingVO vo);
	
	
	//이벤트 레코드 한 개 선택 (진행, 종료)
	public EventBoardVO eventBoardSelect(int no);	
	//이벤트 전체 레코드 선택
	public List<EventBoardVO> eventBoardAllRecord();
	//이벤트 총 레코드 수
	public int eventGetAllRecordCount(PagingVO pvo);

	//종료된 이벤트 전체 선택
	public List<EventBoardVO> endEventBoardAllRecord();
	//종료된 이벤트 총 레코드 수
	public int endEvnetGetAllRecordCount(PagingVO pvo);	
}
