package com.bitcamp.gachi.mypage;

public class MemberVO {
	private String userid; // 아이디(이메일)
	private String userpwd; // 비밀번호
	private String grade; // 회원등급 ( 일반 / 크리에이터 / 관리자)
	private String username; // 이름
	private String nickname; // 닉네임
	// 생년월일
	private String birthdate; 
	private String year;
	private String month;
	private String day;
	//연락처
	private String tel; 
	
	private String gender; // 성별 (m 남 / f 여)
	private String zipcode; // 우편번호 
	private String addr; // 주소
	private String detailaddr; // 상세주소
	private String signupdate; // 가입일
	private String interest; // 관심사
	private String deleted; // 회원 상태 (0:회원, 1:탈퇴)
	private String withdrawdate; // 탈퇴일 (null인 경우 탈퇴 X)
	
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
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
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
		birthdate = year + month + day;
		return birthdate;
	}
	public void setBirthdate(String birthdate) {
		this.birthdate = birthdate;
		
		String birthCut[] = birthdate.split("-");
		year = birthCut[0];
		month = birthCut[1];
		day = birthCut[2];
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
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
	public String getWithdrawdate() {
		return withdrawdate;
	}
	public void setWithdrawdate(String withdrawdate) {
		this.withdrawdate = withdrawdate;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	
}
