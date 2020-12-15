package com.bitcamp.gachi.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.bitcamp.gachi.store.StorePageVO;

public interface ClassDaoImp {
	
	//�겢�옒�뒪紐⑸줉
	public List<ClassVO> selectAllClass(TestVO vo);
	
	//�겢�옒�뒪議고쉶
	public ClassVO selectClass(String code);

	//�겢�옒�뒪�닔�젙
	public int updateClass(ClassVO vo);
	
	//�겢�옒�뒪�벑濡�
	public int insertClass();
	
	//�겢�옒�뒪�궘�젣
	public int deleteClass(String code);
	
	//醫뗭븘�슂 利앷�
	public int countGood();
	
	//�룊�젏 怨꾩궛
	public int countGrade();
	
	//珥� �젅肄붾뱶 �닔 援ы븯湲�
	public int getAllRecordCount(TestVO vo);
	
	//�겢�옒�뒪 �벑濡앹쿂由�
	public int updateClassState(String code);
	
	//由ъ뒪�듃 紐⑸줉 援ы븯湲�(議고쉶�샃�뀡)
	public List<ClassVO> getClassListLookUp(TestVO vo);
	
	//由ъ뒪�듃 紐⑸줉 援ы븯湲�(寃��깋�샃�뀡)
	public List<ClassVO> getClassListSearch(TestVO vo);
	
	//媛뺤쥖 �쁺�긽 媛꾨왂 議고쉶
	//public List<ClassVideoVO> getClassVideoList();
	
	//�씠誘몄��뙆�씪 議고쉶
	public String selectClassImg(String code);
	
	//�씠誘몄��뙆�씪 �닔�젙
	public int updateClassImg(String classImg,String code);
	
	//�겢�옒�뒪 紐⑹감媛��졇�삤湲�
	public List<ClassVideoVO> selectSection(String code);
	
	//紐⑤뱺 �겢�옒�뒪 媛��졇�삤湲�
	public List<ClassVO> getClassAllList(String category);
	
	//�겢�옒�뒪 肄붾뱶援ы븯湲�
	public String getCode(String class_name);

	
	//紐⑹감紐� 援ы븯湲�
	public List<String> getUnitContent(String code);
	
	//紐⑹감理쒕�媛� 援ы븯湲�
	public int getUnitMax(String code);
	
	//鍮꾨뵒�삤 紐⑸줉 異붽��븯湲�
	public int videoInsert(ClassVideoVO vo);
	
	//紐⑹감肄붾뱶 媛��졇�삤湲�
	public String selectSectionCode(String unit_content);
	
	//紐⑹감 �궘�젣
	public int deleteSection(String section_code);
	
	public int updateSection(ClassVO vo);
	
	//현재 시퀀스 다음 값 조회하기
	public int selectNextSeq();
	
	//클래스에 해당하는 비디오 리스크 조회
	public List<ClassVideoVO> selectClassVideoList(String code);
	
	//해당 영상에 해당하는 카테고리 조회
	public String selectVideoCategory(String code);
	
	//해당 영상에 해당하는 클래스명 조회
	public String selectVideoClassName(String code);
	
	//비디오 삭제
	public int videoDelete(String video_code);
	
	public int getUnit(String unit_content);
	
	//비디오 총 레코드수 
	public int getVideoRecordCount(Map<String, String> dbParam);
	
	//비디오리스트
	public List<ClassVideoVO> getClassVideoList(Map<String,String> map);
	
	//클래스 목록가져오기
	public List<ClassVO> selectClassList();
	
	//클래스 총 레코드수 구하기
	public int getClassAllRecordCount(Map<String, String> map);
	
	//클래스 목록구하기
	public List<ClassVO> getClassRecord(Map<String, String> map);
}
