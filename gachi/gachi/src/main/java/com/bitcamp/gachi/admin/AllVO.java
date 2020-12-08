package com.bitcamp.gachi.admin;

import java.sql.Date;

public class AllVO {
	
	//멤버
	private int rownum;
	private String userid; // 아이디(이메일)
	private String userpwd; // 비밀번호
	private String grade; // 회원등급 (1 일반 / 2 크리에이터 3 관리자)
	private String username; // 이름
	private String nickname; // 닉네임	
	private String birthdate; // 생년월일
	private String tel;
	private String gender; // 성별 (m 남 / f 여)
	private String zipcode;
	private String addr; // 주소
	private String detailaddr; // 상세주소
	private String profile; // 프로필 이미지 파일명
	private String signupdate; // 가입일
	private String interest; // 관심사
	private String deleted; // 회원 상태 (회원, 탈퇴)
	private String withdrawdate; // 탈퇴일 (null인 경우 탈퇴 X)
	
	//크리에이터
	private String category; // 카테고리
	private String business_number; //사업자번호
	private String bankname; // 은행명
	private String account; //계좌번호 
	private String license_img1; // 자격증 이미지1
	private String license_img2; // 자격증 이미지2
	private String ilcense_img3; // 자격증 이미지3
	private String sns_addr; // sns 주소
	private String creator_info; // 소개글
	private String creator_state; // 승인상태 ( 미승인 /승인 / 승인거절)
	private String picture;//크리에이터 사진
	
	//클래스
	private String class_name; /* 클래스명 */
	private int real_price; /* 판매가 */
	private String class_img; /* 클래스사진1 */
	
	//상품
	private String code;/*코드*/
	private String goods_name;/*상품명*/
	private String goods_img1;/*상품 사진1*/
	private String writedate;
	private int stock;//재고
	private int stack;//적립마일리지
	private int good;//좋아요
	private String goods_info;//상품내용
	
/*	
	//오더리스트
	private String order_code;
	private int full_price;
	private int discount;
	private int price;
	private String payment_type;
	private String card_type;
	private String orderdate;
	private String fix_state;
	private int shipping_fee;
	
	//클래스오더
	private String class_order_code;
	private String settlement;
	
	//굿즈오더
	private String goods_order_code;
	private int amount;
	private String state;
	private String etc;
	private String finished;
*/	
	
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
	
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public void setPicture(String picture) {
		this.picture = picture;
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
	public String getWithdrawdate() {
		return withdrawdate;
	}
	public void setWithdrawdate(String withdrawdate) {
		this.withdrawdate = withdrawdate;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
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
	public String getLicense_img1() {
		return license_img1;
	}
	public void setLicense_img1(String license_img1) {
		this.license_img1 = license_img1;
	}
	public String getLicense_img2() {
		return license_img2;
	}
	public void setLicense_img2(String license_img2) {
		this.license_img2 = license_img2;
	}
	public String getIlcense_img3() {
		return ilcense_img3;
	}
	public void setIlcense_img3(String ilcense_img3) {
		this.ilcense_img3 = ilcense_img3;
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
	public String getCreator_state() {
		return creator_state;
	}
	public void setCreator_state(String creator_state) {
		this.creator_state = creator_state;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicutre(String picture) {
		this.picture = picture;
	}
	//클래스
	public String getClass_name() {
		return class_name;
	}
	public void setClass_name(String class_name) {
		this.class_name = class_name;
	}
	public int getReal_price() {
		return real_price;
	}
	public void setReal_price(int real_price) {
		this.real_price = real_price;
	}
	public String getClass_img() {
		return class_img;
	}
	public void setClass_img(String class_img) {
		this.class_img = class_img;
	}	
	//상품
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getGoods_name() {
		return goods_name;
	}
	public void setGoods_name(String goods_name) {
		this.goods_name = goods_name;
	}
	public String getGoods_img1() {
		return goods_img1;
	}
	public void setGoods_img1(String goods_img1) {
		this.goods_img1 = goods_img1;
	}
	public String getWritedate() {
		return writedate;
	}
	public void setWritedate(String writedate) {
		this.writedate = writedate;
	}
	
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	public int getStack() {
		return stack;
	}
	public void setStack(int stack) {
		this.stack = stack;
	}
	public int getGood() {
		return good;
	}
	public void setGood(int good) {
		this.good = good;
	}
	public String getGoods_info() {
		return goods_info;
	}
	public void setGoods_info(String goods_info) {
		this.goods_info = goods_info;
	}
	
	
	
}
