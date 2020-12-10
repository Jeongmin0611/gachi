package com.bitcamp.gachi.classPage;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.bitcamp.gachi.admin.AllVO;
import com.bitcamp.gachi.admin.PagingVO;
import com.bitcamp.gachi.admin.QnaVO;

public interface ClassPageDaoImp {
	//클래스 리스트
	public List<AllVO> classPageAllRecord(@Param("category") String category, @Param("selectval") String selectval);
	//클래스 view
	public AllVO classView(String code);
	//클래스 총 레코드 개수
	public int classBoardAllRecordCount(PagingVO vo);
	//메인화면 인기순
	public List<AllVO> homeClassPopular();
	//메인화면 신규
	public List<AllVO> homeClassNew();
	//클래스 review 리스트
	public List<AllVO> reviewList(String code);
	//클래스 qna 리스트
	public List<QnaVO> qnaList(String code);
	//클래스 review 등록
	public int insertReview(AllVO vo);
}
