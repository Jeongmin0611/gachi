package com.bitcamp.gachi.mypage;

import com.bitcamp.gachi.register.RegisterVO;

public interface UserInfoDaoImp {
	//회원정보확인
	public RegisterVO userInfoView(String userid);
	//회원정보수정-비밀번호확인
	public int userInfoPwdChk(RegisterVO vo);
	//회원정보수정
	public int userInfoEdit(RegisterVO vo);
	//회원탈퇴
	public int userLeave(RegisterVO vo);
}
