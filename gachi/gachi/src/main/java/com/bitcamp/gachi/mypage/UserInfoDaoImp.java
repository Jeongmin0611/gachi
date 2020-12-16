package com.bitcamp.gachi.mypage;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.bitcamp.gachi.admin.QnaVO;
import com.bitcamp.gachi.board.EventBoardVO;
import com.bitcamp.gachi.register.RegisterVO;

public interface UserInfoDaoImp {
	//주문내역 목록(코드만)
	public List<String> orderList(String userid);
	//주문내역 목록(코드만)-날짜검색
	public List<String> orderListDate(@Param("userid") String userid, @Param("startDate") String startDate, @Param("endDate") String endDate);
	//주문내역 목록(클래스)
	public List<OrderListVO> classOrderView(String order_code);
	//주문내역 목록(상품)
	public List<OrderListVO> goodsOrderView(String order_code);
	//구매확정
	public int userOrderFix(String goods_order_code);
	//회원정보확인
	public MemberVO userInfoView(String userid);
	//회원정보수정-비밀번호확인
	public int userInfoPwdChk(MemberVO vo);
	//회원정보수정(비밀번호 변경)
	public int userInfoEditPwd(MemberVO vo);
	//회원정보수정(비밀번호 변경하지 않음)
	public int userInfoEdit(MemberVO vo);
	//회원탈퇴
	public int userLeave(MemberVO vo);
	//장바구니 수량 조절
	public int cartUpdate(OrderListVO vo);
	//장바구니(클래스)
	public List<OrderListVO> classCartView(String userid);
	//장바구니(상품)
	public List<OrderListVO> goodsCartView(String userid);
	//장바구니 비었는지 아닌지 검사
	public int countUserCart(String userid);
	//장바구니 상품 개수
	public int countGoodsCart(@Param("userid") String userid, @Param("code") String code);
	//장바구니 중복검사
	public int userCartCheck(OrderVO vo);
	//장바구니 중복검사(수강중인 클래스인지)
	public int userCartClassCheck(OrderVO vo);
	//장바구니 추가
	public int userCartInsert(OrderVO vo);
	//장바구니 삭제
	public int cartDelete(@Param("userid") String userid, @Param("code") String code);
	//장바구니 전체삭제
	public int cartDeleteAll(String userid);
	//주문목록 리스트(클래스)
	public OrderListVO classOrderList(String code);
	//주문목록 리스트(상품)
	public OrderListVO goodsOrderList(String code);
	//결제 후 주문정보 넣기(주문)
	public int orderInsert(OrderVO vo);
	//결제 후 주문정보 넣기(클래스주문)
	public int classOrderInsert(OrderListVO vo);
	//결제 후 주문정보 넣기(상품주문)
	public int goodsOrderInsert(OrderListVO vo);
	//결제후 수강테이블 넣기
	public int courseInsert(OrderListVO vo);
	//결제 후 주문정보확인
	public OrderVO orderView(String order_code);
	//클래스 이름
	public String getClassName(String code);
	//상품 이름
	public String getGoodsName(String code);
	//내 클래스 개수
	public int countClass(String userid);
	//내 클래스 목록
	public List<OrderListVO> myclassList(String userid);
	//내 클래스 보기
	public OrderListVO myclassView(@Param("userid") String userid, @Param("code") String code);
	//내 클래스 영상
	public ClassVideoVO myclassVideoView(@Param("code") String code, @Param("video_code") String video_code);
	//차시 목록
	public List<ClassVideoVO> sectionList(String code);
	//동영상 목록
	public List<ClassVideoVO> classVideoList(@Param("code") String code, @Param("section_code") String section_code);
	//클래스 qna 리스트
	public List<QnaVO> qnaList(String code);
	//좋아요(클래스)
	public List<OrderListVO> classWishList(String userid);
	//좋아요(상품)
	public List<OrderListVO> goodsWishList(String userid);
	//좋아요(숫자)
	public int countGood(String userid);
	//좋아요 테이블에 추가
	public int wishListAdd(@Param("userid") String userid, @Param("code") String code);
	//좋아요 테이블에 삭제
	public int wishListDel(@Param("userid") String userid, @Param("code") String code);
	//좋아요 클래스 테이블 업데이트
	public int goodClassUpdate(@Param("code") String code,@Param("msg") String msg);
	//좋아요 상품 테이블 업데이트
	public int goodStoreUpdate(@Param("code") String code,@Param("msg") String msg);
	//좋아요 (클래스, 상품 view화면)
	public OrderListVO wishOneRecord(@Param("userid") String userid, @Param("code") String code);
	//클래스 질문답변
	public List<QnaVO> qnaView(String userid);
	//클래스 질문답변 삭제
	public int qnaDelete(int num);
	//클래스 수강평 삭제
	public int classReviewDelete(int num);
	//스토어 질문답변 삭제
	public int goodsReviewDelete(int num);
	//이벤트댓글 삭제
	public int eventReplyDelete(int reply_num);
	//클래스 수강평
	public List<QnaVO> classReview(String userid);
	//상품 질문답변
	public List<QnaVO> goodsQnaView(String userid);
	//상품 리뷰
	public List<QnaVO> goodsReview(String userid);
	//이벤트 댓글
	public List<EventBoardVO> eventReplyView(String userid);
	//리뷰쓸 상품목록
	public List<OrderListVO> goodsList(String userid);
}
