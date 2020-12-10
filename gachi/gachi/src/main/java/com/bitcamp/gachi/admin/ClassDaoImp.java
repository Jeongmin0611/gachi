package com.bitcamp.gachi.admin;

import java.util.List;

public interface ClassDaoImp {
	
	//클래스목록
	public List<ClassVO> selectAllClass(TestVO vo);
	
	//클래스조회
	public ClassVO selectClass(String code);

	//클래스수정
	public int updateClass(ClassVO vo);
	
	//클래스등록
	public int insertClass();
	
	//클래스삭제
	public int deleteClass(String code);
	
	//좋아요 증가
	public int countGood();
	
	//평점 계산
	public int countGrade();
	
	//총 레코드 수 구하기
	public int getAllRecordCount(TestVO vo);
	
	//클래스 등록처리
	public int updateClassState(String code);
	
	//리스트 목록 구하기(조회옵션)
	public List<ClassVO> getClassListLookUp(TestVO vo);
	
	//리스트 목록 구하기(검색옵션)
	public List<ClassVO> getClassListSearch(TestVO vo);
	
	//강좌 영상 간략 조회
	public List<ClassVideoVO> getClassVideoListSample(String code);
	
	//이미지파일 조회
	public String selectClassImg(String code);
	
	//이미지파일 수정
	public int updateClassImg(String classImg,String code);
	
	//클래스 목차가져오기
	public List<ClassVideoVO> selectSection(String code);
	
	//모든 클래스 가져오기
	public List<ClassVO> getClassAllList(String category);
	
	//클래스 코드구하기
	public String getCode(String class_name);
	
}
