package com.bitcamp.gachi.classPage;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.bitcamp.gachi.admin.AllVO;
import com.bitcamp.gachi.admin.QnaVO;

public interface ClassPageDaoImp {
	//클래스 리스트
	public List<AllVO> classPageAllRecord(ClassPageVO vo);
	//클래스 view
	public AllVO classView(String code);
	//클래스 총 레코드 개수
	public int classBoardAllRecordCount(ClassPageVO vo);
	//메인화면 인기순
	public List<AllVO> homeClassPopular();
	//메인화면 신규
	public List<AllVO> homeClassNew();
	//메인화면 추천
	public List<AllVO> homeClassRecommand();
	//메인화면 추천(로그인 한 경우 관심사 찾기)
	public String homeClassInterestFind(String userid);
	//메인화면 추천(로그인 한 경우 관심사 찾은 걸로 추천)
	public List<AllVO> homeClassRecommandUser(@Param("interest1") String interest1, @Param("interest2") String interest2,@Param("interest3") String interest3);
	//클래스 review 리스트
	public List<AllVO> reviewList(String code);
	//클래스 qna 리스트
	public List<QnaVO> qnaList(String code);
	//클래스 qna 검색 리스트
	public List<QnaVO> qnaListSearch(AllVO vo);
	//클래스 review 등록
	public int insertReview(AllVO vo);
	//클래스 review 수정
	public int updateReview(AllVO vo);
	//클래스 qnq 등록
	public int insertQna(AllVO vo);
	//클래스 qna 수정
	public int updateQna(AllVO vo);
	public int classPageCategoryRecordCount(ClassPageVO vo);
	

}
