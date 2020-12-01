package com.bitcamp.gachi.mypage;

import java.util.List;

import com.bitcamp.gachi.register.RegisterVO;

public interface UserInfoDaoImp {
	//주문내역 목록(코드만)
	public List<String> orderList(String userid);
	//주문내역 목록(클래스)
	public List<OrderListVO> classOrderView(String order_code);
	//주문내역 목록(상품)
	public List<OrderListVO> goodsOrderView(String order_code);
	//회원정보확인
	public MemberVO userInfoView(String userid);
	//회원정보수정-비밀번호확인
	public int userInfoPwdChk(MemberVO vo);
	//회원정보수정
	public int userInfoEdit(MemberVO vo);
	//회원탈퇴
	public int userLeave(MemberVO vo);
}
