package com.bitcamp.gachi.register;

public class RegisterVO {
	private String userid;
	private String userpwd;
	
	private int grade;//체크박스에따라서 결정
	
	private String username;
	private String nickname;
	
	private String birthdate;
	private String birthdate1;
	private String birthdate2;
	private String birthdate3;
	
	
	private String tel;
	private String tel1;
	private String tel2;
	private String tel3;
	
	private String gender;
	private String addr;
	private String detailaddr;
	
	private String signupdate;
	private String lnterest;
	
	private int deleted;
	
	public int getDeleted() {
		return deleted;
	}
	public void setDeleted(int deleted) {
		this.deleted = deleted;
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
		birthdate=birthdate1+"-"+birthdate2+"-"+birthdate3;
		return birthdate;
	}
	public void setBirthdate(String birthdate) {
		this.birthdate = birthdate;
		String birthdateCut[]=birthdate.split("-");
		birthdate1=birthdateCut[0];
		birthdate2=birthdateCut[1];
		birthdate3=birthdateCut[2];
		
	}
	public String getBirthdate1() {
		return birthdate1;
	}
	public void setBirthdate1(String birthdate1) {
		this.birthdate1 = birthdate1;
	}
	public String getBirthdate2() {
		return birthdate2;
	}
	public void setBirthdate2(String birthdate2) {
		this.birthdate2 = birthdate2;
	}
	public String getBirthdate3() {
		return birthdate3;
	}
	public void setBirthdate3(String birthdate3) {
		this.birthdate3 = birthdate3;
	}
	public String getTel() {
		tel=tel1+"-"+tel2+"-"+tel3;
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
		//
		String telCut[]=tel.split("-");
		tel1=telCut[0];
		tel2=telCut[1];
		tel3=telCut[2];
	}
	public String getTel1() {
		return tel1;
	}
	public void setTel1(String tel1) {
		this.tel1 = tel1;
	}
	public String getTel2() {
		return tel2;
	}
	public void setTel2(String tel2) {
		this.tel2 = tel2;
	}
	public String getTel3() {
		return tel3;
	}
	public void setTel3(String tel3) {
		this.tel3 = tel3;
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
	public String getLnterest() {
		return lnterest;
	}
	public void setLnterest(String lnterest) {
		this.lnterest = lnterest;
	}

	
}
