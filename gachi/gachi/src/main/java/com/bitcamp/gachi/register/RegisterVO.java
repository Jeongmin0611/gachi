package com.bitcamp.gachi.register;

public class RegisterVO {
	private String logStatus = "N";
	private String userSort = "D";

	public String getUserSort() {
		return userSort;
	}

	public void setUserSort(String userSort) {
		this.userSort = userSort;
	}

	private String userid;
	private String userpwd;
	private String userid2;
	private String userpwd2;
	private String userid3;
	private String userpwd3;

	private String grade;// 체크박스에따라서 결정
	private String grade2;

	private String username;
	private String nickname;
	private String username2;
	private String nickname2;

	private String birthdate;
	private String birthdate1;
	private String birthdate2;
	private String birthdate3;
	private String birthdateC;
	private String birthdate1C;
	private String birthdate2C;
	private String birthdate3C;

	private String tel;
	private String telC;

	private String gender;
	private String gender2;
	private String sample6_postcode;
	private String addr;
	private String sample6_address;
	private String sample6_detailAddress;
	private String sample6_extraAddress;
	private String sample6_postcode2;
	private String addr2;
	private String sample6_address2;
	private String sample6_detailAddress2;
	private String sample6_extraAddress2;

	private String signupdate;
	private String interest;
	private String interest2;
	
	private String business_number;
	private String bankname;
	private String account;
	
	private String creatorLicense_img1;
	private String creatorLicense_img2;
	private String creatorLicense_img3;
	
	private String sns_addr;
	private String creator_info;

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

	public String getUserid2() {
		return userid2;
	}

	public void setUserid2(String userid2) {
		this.userid2 = userid2;
	}

	public String getUserpwd2() {
		return userpwd2;
	}

	public void setUserpwd2(String userpwd2) {
		this.userpwd2 = userpwd2;
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
		birthdate = birthdate1 + "-" + birthdate2 + "-" + birthdate3;
		return birthdate;
	}

	public void setBirthdate(String birthdate) {
		this.birthdate = birthdate;
		String birthdateCut[] = birthdate.split("-");
		birthdate1 = birthdateCut[0];
		birthdate2 = birthdateCut[1];
		birthdate3 = birthdateCut[2];

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

	public String getInterest() {
		return interest;
	}

	public void setInterest(String interest) {
		this.interest = interest;
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

	public String getSignupdate() {
		return signupdate;
	}

	public void setSignupdate(String signupdate) {
		this.signupdate = signupdate;
	}

	public String getLogStatus() {
		return logStatus;
	}

	public void setLogStatus(String logStatus) {
		this.logStatus = logStatus;
	}

	public String getSample6_postcode() {
		return sample6_postcode;
	}

	public void setSample6_postcode(String sample6_postcode) {
		this.sample6_postcode = sample6_postcode;
	}

	public String getAddr() {
		addr = sample6_address + " " + sample6_extraAddress;
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
		String addrCut[] = addr.split(" ");
		sample6_address = addrCut[0];
		sample6_extraAddress = addrCut[1];
	}

	public String getSample6_address() {
		return sample6_address;
	}

	public void setSample6_address(String sample6_address) {
		this.sample6_address = sample6_address;
	}

	public String getSample6_detailAddress() {
		return sample6_detailAddress;
	}

	public void setSample6_detailAddress(String sample6_detailAddress) {
		this.sample6_detailAddress = sample6_detailAddress;
	}

	public String getSample6_extraAddress() {
		return sample6_extraAddress;
	}

	public void setSample6_extraAddress(String sample6_extraAddress) {
		this.sample6_extraAddress = sample6_extraAddress;
	}

	public String getUserid3() {
		return userid3;
	}

	public void setUserid3(String userid3) {
		this.userid3 = userid3;
	}

	public String getUserpwd3() {
		return userpwd3;
	}

	public void setUserpwd3(String userpwd3) {
		this.userpwd3 = userpwd3;
	}

	public String getGrade2() {
		return grade2;
	}

	public void setGrade2(String grade2) {
		this.grade2 = grade2;
	}

	public String getUsername2() {
		return username2;
	}

	public void setUsername2(String username2) {
		this.username2 = username2;
	}

	public String getNickname2() {
		return nickname2;
	}

	public void setNickname2(String nickname2) {
		this.nickname2 = nickname2;
	}

	public String getBirthdateC() {
		birthdateC = birthdate1C + "-" + birthdate2C + "-" + birthdate3C;
		return birthdateC;
	}

	public void setBirthdateC(String birthdate) {
		this.birthdateC = birthdateC;
		String birthdateCutC[] = birthdateC.split("-");
		birthdate1C = birthdateCutC[0];
		birthdate2C = birthdateCutC[1];
		birthdate3C = birthdateCutC[2];

	}

	public String getBirthdate1C() {
		return birthdate1C;
	}

	public void setBirthdate1C(String birthdate1c) {
		birthdate1C = birthdate1c;
	}

	public String getBirthdate2C() {
		return birthdate2C;
	}

	public void setBirthdate2C(String birthdate2c) {
		birthdate2C = birthdate2c;
	}

	public String getBirthdate3C() {
		return birthdate3C;
	}

	public void setBirthdate3C(String birthdate3c) {
		birthdate3C = birthdate3c;
	}

	public String getTelC() {
		return telC;
	}

	public void setTelC(String telC) {
		this.telC = telC;

	}
	public String getGender2() {
		return gender2;
	}

	public void setGender2(String gender2) {
		this.gender2 = gender2;
	}

	public String getSample6_postcode2() {
		return sample6_postcode2;
	}

	public void setSample6_postcode2(String sample6_postcode2) {
		this.sample6_postcode2 = sample6_postcode2;
	}

	public String getAddr2() {
		addr2 = sample6_address2 + " " + sample6_extraAddress2;
		return addr;
	}

	public void setAddr2(String addr2) {
		this.addr2 = addr2;
		String addrCut2[] = addr2.split(" ");
		sample6_address2 = addrCut2[0];
		sample6_extraAddress2 = addrCut2[1];
	}

	public String getSample6_address2() {
		return sample6_address2;
	}

	public void setSample6_address2(String sample6_address2) {
		this.sample6_address2 = sample6_address2;
	}

	public String getSample6_detailAddress2() {
		return sample6_detailAddress2;
	}

	public void setSample6_detailAddress2(String sample6_detailAddress2) {
		this.sample6_detailAddress2 = sample6_detailAddress2;
	}

	public String getSample6_extraAddress2() {
		return sample6_extraAddress2;
	}

	public void setSample6_extraAddress2(String sample6_extraAddress2) {
		this.sample6_extraAddress2 = sample6_extraAddress2;
	}

	public String getInterest2() {
		return interest2;
	}

	public void setInterest2(String interest2) {
		this.interest2 = interest2;
	}

	public String getBusiness_number() {
		return business_number;
	}

	public void setBusiness_number(String business_number) {
		this.business_number = business_number;
	}

	public String getBankname() {
		return bankname;
	}

	public void setBankname(String bankname) {
		this.bankname = bankname;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getCreatorLicense_img1() {
		return creatorLicense_img1;
	}

	public void setCreatorLicense_img1(String creatorLicense_img1) {
		this.creatorLicense_img1 = creatorLicense_img1;
	}

	public String getCreatorLicense_img2() {
		return creatorLicense_img2;
	}

	public void setCreatorLicense_img2(String creatorLicense_img2) {
		this.creatorLicense_img2 = creatorLicense_img2;
	}

	public String getCreatorLicense_img3() {
		return creatorLicense_img3;
	}

	public void setCreatorLicense_img3(String creatorLicense_img3) {
		this.creatorLicense_img3 = creatorLicense_img3;
	}

	public String getSns_addr() {
		return sns_addr;
	}

	public void setSns_addr(String sns_addr) {
		this.sns_addr = sns_addr;
	}

	public String getCreator_info() {
		return creator_info;
	}

	public void setCreator_info(String creator_info) {
		this.creator_info = creator_info;
	}
	
}
