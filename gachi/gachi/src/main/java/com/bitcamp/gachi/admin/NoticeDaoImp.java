package com.bitcamp.gachi.admin;

import java.util.List;

public interface NoticeDaoImp {
	//공지사항 총 레코드 구하기
	public List<NoticeVO> selectList(NoticePageVO npvo);
	
	//공지사항 총 레코드 수 구하기
	public int getAllRecord(NoticePageVO vo);
	
	//공지사항 글쓰기
	public int insertNotice(NoticeVO vo);
	
	//공지사항 보기
	public NoticeVO selectNotice(int notice_num);
	
	//공지사항 수정
	public int updateNotice(NoticeVO vo);
	
	//공지사항 삭제
	public int deleteNotice(int notice_num);
	
}
