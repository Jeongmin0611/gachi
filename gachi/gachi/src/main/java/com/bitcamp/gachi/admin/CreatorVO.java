package com.bitcamp.gachi.admin;

public class CreatorVO {

	private int rownum;
	private String userid; //아이디(이메일)
	private String category; // 카테고리
	private String business_number; //사업자번호
	private String bankname; // 은행명
	private String account; //계좌번호 
	private String license_img1; // 자격증 이미지1
	private String license_img2; // 자격증 이미지2
	private String ilcense_img3; // 자격증 이미지3
	private String sns_addr; // sns 주소
	private String creator_info; // 소개글
	private int creator_state; // 승인상태 ( 0: 미승인 / 1:승인 : 2: 승인거절)
	private String picture;//크리에이터 사진	
	
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
	
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public int getCreator_state() {
		return creator_state;
	}
	public void setCreator_state(int creator_state) {
		this.creator_state = creator_state;
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
	public int getcreator_State() {
		return creator_state;
	}
	public void setcreator_State(int creator_state) {
		this.creator_state = creator_state;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	
}
