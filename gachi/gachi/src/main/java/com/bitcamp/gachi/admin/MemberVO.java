package com.bitcamp.gachi.admin;

import java.sql.Date;

public class MemberVO {
	private int rownum;
	private String userid; // 아이디(이메일)
	private String userpwd; // 비밀번호
	private int grade; // 회원등급 (1 일반 / 2 크리에이터 3 관리자)
	private String username; // 이름
	private String nickname; // 닉네임
	
	private String birthdate; // 생년월일
	
	private String tel;
	
	private String gender; // 성별 (m 남 / f 여)
	private String addr; // 주소
	private String detailaddr; // 상세주소
	private String profile; // 프로필 이미지 파일명
	private String signupdate; // 가입일
	private String interest; // 관심사
	private String deleted; // 회원 상태 (0:회원, 1:탈퇴)
	private Date withdrawdate; // 탈퇴일 (null인 경우 탈퇴 X)
	
	
	public int getRownum() {
		return rownum;
	}
	public void setRownum(int rownum) {
		this.rownum = rownum;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUserpwd() {
		return userpwd;
	}
	public void setUserpwd(String userpwd) {
		this.userpwd = userpwd;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getBirthdate() {
		return birthdate;
	}
	public void setBirthdate(String birthdate) {
		this.birthdate = birthdate;
		
	}
	
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getDetailaddr() {
		return detailaddr;
	}
	public void setDetailaddr(String detailaddr) {
		this.detailaddr = detailaddr;
	}
	public String getProfile() {
		return profile;
	}
	public void setProfile(String profile) {
		this.profile = profile;
	}
	public String getSignupdate() {
		return signupdate;
	}
	public void setSignupdate(String signupdate) {
		this.signupdate = signupdate;
	}
	public String getInterest() {
		return interest;
	}
	public void setInterest(String interest) {
		this.interest = interest;
	}
	
	public String getDeleted() {
		return deleted;
	}
	public void setDeleted(String deleted) {
		this.deleted = deleted;
	}
	public Date getWithdrawdate() {
		return withdrawdate;
	}
	public void setWithdrawdate(Date withdrawdate) {
		this.withdrawdate = withdrawdate;
	}
	
	public MemberVO() {}
	
	public MemberVO(String userid, String userpwd, int grade, String username, String nickname, String birthdate,
			String tel, String gender, String addr, String detailaddr, String profile,
			String signupdate, String interest, String deleted, Date withdrawdate) {
		super();
		this.userid = userid;
		this.userpwd = userpwd;
		this.grade = grade;
		this.username = username;
		this.nickname = nickname;
		this.birthdate = birthdate;
		this.tel = tel;
		this.gender = gender;
		this.addr = addr;
		this.detailaddr = detailaddr;
		this.profile = profile;
		this.signupdate = signupdate;
		this.interest = interest;
		this.deleted = deleted;
		this.withdrawdate = withdrawdate;
	}
	
	@Override
	public String toString() {
		return "MemberVO [userid=" + userid + ", userpwd=" + userpwd + ", grade=" + grade + ", username=" + username
				+ ", nickname=" + nickname + ", birthdate=" + birthdate + ", tel=" + tel +", gender =" + gender + ", addr=" + addr + ", detailaddr=" + detailaddr
				+ ", profile=" + profile + ", signupdate=" + signupdate + ", interest=" + interest + ", deleted="
				+ deleted + ", withdrawdate=" + withdrawdate + "]";
	}
	

	
	
	

}
