package com.bitcamp.gachi.mypage;

public class AllGoodsVO {
	private String code; /* 코드 */
	private String class_order_code;
	private String userid; /* 아이디(이메일) */
	private String category; /* 카테고리 */
	private String class_name; /* 클래스명 */
	private String goods_name; /* 상품명 */
	
	private int prime_cost; /* 원가 */
	private int real_price; /* 판매가 */
	private int stock; /* 재고 */
	private int stack; /* 적립마일리지 */
	
	private String stage; /* 난이도 */
	private int class_term; /* 수강기간 */
	private String class_info; /* 클래스 소개 */
	private String goods_info; /* 상품상세정보 */
	
	private int total_student; /* 누적수강생수 */
	private int sale_count; /* 누적판매수 */
	private int good; /* 좋아요 */
	private int grade; /* 평점 */
	
	private String signup; /* 신청일 */
	private String allow; /* 승인일 */
	private String writedate; /* 등록일 */
	private String startdate; /* 판매시작일 */
	private String enddate; /* 판매종료일 */
	
	private String class_state; /* 상태(미승인, 승인거절, 판매중, 판매종료) */
	private String sale_state; /* 상태(판매중지, 판매중, 판매종료) */

	private String class_img; /* 클래스 사진 */
	private String goods_img1; /* 상품이미지1 */ 
	private String goods_img2; /* 상품이미지2 */ 
	private String goods_img3; /* 상품이미지3 */ 
	private String goods_img4; /* 상품이미지4 */ 
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getClass_order_code() {
		return class_order_code;
	}
	public void setClass_order_code(String class_order_code) {
		this.class_order_code = class_order_code;
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
	public String getGoods_name() {
		return goods_name;
	}
	public void setGoods_name(String goods_name) {
		this.goods_name = goods_name;
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
	public String getGoods_info() {
		return goods_info;
	}
	public void setGoods_info(String goods_info) {
		this.goods_info = goods_info;
	}
	public int getTotal_student() {
		return total_student;
	}
	public void setTotal_student(int total_student) {
		this.total_student = total_student;
	}
	public int getSale_count() {
		return sale_count;
	}
	public void setSale_count(int sale_count) {
		this.sale_count = sale_count;
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
	public String getWritedate() {
		return writedate;
	}
	public void setWritedate(String writedate) {
		this.writedate = writedate;
	}
	public String getStartdate() {
		return startdate;
	}
	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}
	public String getEnddate() {
		return enddate;
	}
	public void setEnddate(String enddate) {
		this.enddate = enddate;
	}
	public String getClass_state() {
		return class_state;
	}
	public void setClass_state(String class_state) {
		this.class_state = class_state;
	}
	public String getSale_state() {
		return sale_state;
	}
	public void setSale_state(String sale_state) {
		this.sale_state = sale_state;
	}
	public String getClass_img() {
		return class_img;
	}
	public void setClass_img(String class_img) {
		this.class_img = class_img;
	}
	public String getGoods_img1() {
		return goods_img1;
	}
	public void setGoods_img1(String goods_img1) {
		this.goods_img1 = goods_img1;
	}
	public String getGoods_img2() {
		return goods_img2;
	}
	public void setGoods_img2(String goods_img2) {
		this.goods_img2 = goods_img2;
	}
	public String getGoods_img3() {
		return goods_img3;
	}
	public void setGoods_img3(String goods_img3) {
		this.goods_img3 = goods_img3;
	}
	public String getGoods_img4() {
		return goods_img4;
	}
	public void setGoods_img4(String goods_img4) {
		this.goods_img4 = goods_img4;
	}
	
}
