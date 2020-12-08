package com.bitcamp.gachi.admin;

public class GoodsVO {

	
	
	private String code;
	private String category; //카테고리
	private String goods_name; //상품명 
	private int prime_cost; //원가
	private int real_price; //판매가
	private int stock; //재고
	private int stack; //적립마일리지
	private String writedate; //등록일
	private String startdate; //판매시작일
	private String enddate; // 판매종료일
	private int sale_count; //누적판매수 
	private String sale_state; //판매상태 
	private String goods_info; //상품설명 
	private int good; //좋아요 갯수 
	private int grade; // 평점
	private String goods_img1; //상품이미지 
	private String goods_img2; //상품이미지 
	private String goods_img3; //상품이미지 
	private String goods_img4; //상품이미지 
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
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
	public int getSale_count() {
		return sale_count;
	}
	public void setSale_count(int sale_count) {
		this.sale_count = sale_count;
	}
	public String getSale_state() {
		return sale_state;
	}
	public void setSale_state(String sale_state) {
		this.sale_state = sale_state;
	}
	public String getGoods_info() {
		return goods_info;
	}
	public void setGoods_info(String goods_info) {
		this.goods_info = goods_info;
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
	@Override
	public String toString() {
		return "GoodsVO [code=" + code + ", category=" + category + ", goods_name=" + goods_name + ", prime_cost="
				+ prime_cost + ", real_price=" + real_price + ", stock=" + stock + ", stack=" + stack + ", writedate="
				+ writedate + ", startdate=" + startdate + ", enddate=" + enddate + ", sale_count=" + sale_count
				+ ", sale_state=" + sale_state + ", goods_info=" + goods_info + ", good=" + good + ", grade=" + grade
				+ ", goods_img1=" + goods_img1 + ", goods_img2=" + goods_img2 + ", goods_img3=" + goods_img3
				+ ", goods_img4=" + goods_img4 + "]";
	}
	
	
}
