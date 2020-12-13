package com.bitcamp.gachi.admin;

public class SettleVO {
	
	// 정상 관리 용 필드
	private int rownum;
	private String order_code; // 주문코드
	private String class_order_code; // 클래스 주문 코드
	private String goods_order_code; // 상품 주문 코
	private String userid; // 아이디(이메일) - 구매자 아이디 X, 클래스 담당 크리에이터 이메일
	private String username;
	private String tel; //구매자 연락처 
	private String category; //카테고리
	private int real_price; // 클래스 판매가
	private String payday; // 정산 지급일
	private String settlement; // 정산 여부
	private String delivery; //운송장번호
	private String state; //배송단계 
	
	private String goods_name; //상품이름
	private String code; //상품코드 
	private String finished; //구매확정여부
	private String orderdate; // 구매일 
	
	private String class_name; //클래스명 
	private String fix_state; // 구매확정여부
	
	private String mileage; //마일리지
	
	public int getRownum() {
		return rownum;
	}
	public void setRownum(int rownum) {
		this.rownum = rownum;
	}
	public String getOrder_code() {
		return order_code;
	}
	public void setOrder_code(String order_code) {
		this.order_code = order_code;
	}
	public String getGoods_order_code() {
		return goods_order_code;
	}
	public void setGoods_order_code(String goods_order_code) {
		this.goods_order_code = goods_order_code;
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
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public int getReal_price() {
		return real_price;
	}
	public void setReal_price(int real_price) {
		this.real_price = real_price;
	}
	public String getPayday() {
		return payday;
	}
	public void setPayday(String payday) {
		this.payday = payday;
	}
	public String getSettlement() {
		return settlement;
	}
	public void setSettlement(String settlement) {
		this.settlement = settlement;
	}
	public String getGoods_name() {
		return goods_name;
	}
	public void setGoods_name(String goods_name) {
		this.goods_name = goods_name;
	}
	public String getFinished() {
		return finished;
	}
	public void setFinished(String finished) {
		this.finished = finished;
	}
	public String getOrderdate() {
		return orderdate;
	}
	public void setOrderdate(String orderdate) {
		this.orderdate = orderdate;
	}
	public String getClass_name() {
		return class_name;
	}
	public void setClass_name(String class_name) {
		this.class_name = class_name;
	}
	public String getFix_state() {
		return fix_state;
	}
	public void setFix_state(String fix_state) {
		this.fix_state = fix_state;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getMileage() {
		return mileage;
	}
	public void setMileage(String mileage) {
		this.mileage = mileage;
	}
	public String getDelivery() {
		return delivery;
	}
	public void setDelivery(String delivery) {
		this.delivery = delivery;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	
}
