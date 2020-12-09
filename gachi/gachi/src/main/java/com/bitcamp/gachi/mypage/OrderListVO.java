package com.bitcamp.gachi.mypage;

public class OrderListVO {
	private String code;
	private String class_img;
	private String goods_img1;
	private String category;
	private String order_code;
	private String class_order_code;
	private String goods_order_code;
	private String class_name;
	private String username;
	private String  goods_name;
	private int real_price;
	private int price;
	private int amount;
	private int stack;
	private String orderdate;
	
	private String[] orderClassCode;
	private String[] orderGoodsCode;
	
	private String userid;	
	
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
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
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getOrder_code() {
		return order_code;
	}
	public void setOrder_code(String order_code) {
		this.order_code = order_code;
	}
	public String getClass_order_code() {
		return class_order_code;
	}
	public void setClass_order_code(String class_order_code) {
		this.class_order_code = class_order_code;
	}
	public String getGoods_order_code() {
		return goods_order_code;
	}
	public void setGoods_order_code(String goods_order_code) {
		this.goods_order_code = goods_order_code;
	}
	public String getClass_name() {
		return class_name;
	}
	public void setClass_name(String class_name) {
		this.class_name = class_name;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getGoods_name() {
		return goods_name;
	}
	public void setGoods_name(String goods_name) {
		this.goods_name = goods_name;
	}
	public int getReal_price() {
		return real_price;
	}
	public void setReal_price(int real_price) {
		this.real_price = real_price;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public int getStack() {
		return stack;
	}
	public void setStack(int stack) {
		this.stack = stack;
	}
	public String getOrderdate() {
		return orderdate;
	}
	public void setOrderdate(String orderdate) {
		this.orderdate = orderdate;
	}
	public String[] getOrderClassCode() {
		return orderClassCode;
	}
	public void setOrderClassCode(String[] orderClassCode) {
		this.orderClassCode = orderClassCode;
	}
	public String[] getOrderGoodsCode() {
		return orderGoodsCode;
	}
	public void setOrderGoodsCode(String[] orderGoodsCode) {
		this.orderGoodsCode = orderGoodsCode;
	}
}
