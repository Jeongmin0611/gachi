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
	public List<ClassVideoVO> getClassVideoList();
	
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
	
	//목차명 구하기
	public List<String> getUnitContent(String code);
	
	//목차최대값 구하기
	public int getUnitMax(String code);
	
	//비디오 목록 추가하기
	public int videoInsert(ClassVideoVO vo);
	
	//목차코드 가져오기
	public String selectSectionCode(String unit_content);
	
	//목차 삭제
	public int deleteSection(String section_code);
}
