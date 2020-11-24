package com.bitcamp.gachi.admin;

import java.util.List;

public interface ClassDaoImp {
	
	//클래스목록
	public List<ClassVO> selectAllClass();
	
	//클래스조회
	public ClassVO selectClass();

	//클래스수정
	public int updateClass();
	
	//클래스등록
	public int insertClass();
	//클래스삭제
	public int deleteClass();
	
	//좋아요 증가
	public int countGood();
	
	//평점 계산
	public int countGrade();
}
