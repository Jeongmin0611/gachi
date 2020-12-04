package com.bitcamp.gachi.mypage;

public class ClassVO {
	private String code; /* 코드 */
	private String userid; /* 아이디(이메일) */
	private String category; /* 카테고리명 */
	private String class_name; /* 클래스명 */
	private int prime_cost; /* 원가 */
	private int real_price; /* 판매가 */
	private int stack; /* 적립마일리지 */
	private String stage; /* 난이도 */
	private int class_term; /* 수강기간 */
	private String class_info; /* 클래스소개 */
	private int total_student; /* 누적수강생수 */
	private int good; /* 좋아요 */
	private int grade; /* 평점 */
	private String allow; /* 승인일 */
	private String signup; /* 신청일 */
	private String class_state; /* 상태(승인대기, 승인거절, 판매중, 판매종료) */
	private String class_img; /* 클래스사진 */
	
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
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
	public String getClass_name() {
		return class_name;
	}
	public void setClass_name(String class_name) {
		this.class_name = class_name;
	}
	public int getPrime_cost() {
		return prime_cost;
	}
	public void setPrime_cost(int prime_cost) {
		this.prime_cost = prime_cost;
	}
	public int getReal_price() {
		return real_price;
	}
	public void setReal_price(int real_price) {
		this.real_price = real_price;
	}
	public int getStack() {
		return stack;
	}
	public void setStack(int stack) {
		this.stack = stack;
	}
	public String getStage() {
		return stage;
	}
	public void setStage(String stage) {
		this.stage = stage;
	}
	public int getClass_term() {
		return class_term;
	}
	public void setClass_term(int class_term) {
		this.class_term = class_term;
	}
	public String getClass_info() {
		return class_info;
	}
	public void setClass_info(String class_info) {
		this.class_info = class_info;
	}
	public int getTotal_student() {
		return total_student;
	}
	public void setTotal_student(int total_student) {
		this.total_student = total_student;
	}
	public int getGood() {
		return good;
	}
	public void setGood(int good) {
		this.good = good;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	public String getAllow() {
		return allow;
	}
	public void setAllow(String allow) {
		this.allow = allow;
	}
	public String getSignup() {
		return signup;
	}
	public void setSignup(String signup) {
		this.signup = signup;
	}
	public String getClass_state() {
		return class_state;
	}
	public void setClass_state(String class_state) {
		this.class_state = class_state;
	}
	public String getClass_img() {
		return class_img;
	}
	public void setClass_img(String class_img) {
		this.class_img = class_img;
	}
}
