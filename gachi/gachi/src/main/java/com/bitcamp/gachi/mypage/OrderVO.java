package com.bitcamp.gachi.mypage;

public class OrderVO {
	private String order_code; /* 주문코드 */
	private String userid; /* 아이디(이메일) */
	private int full_price; /* 총금액 */
	private int discount; /* 할인액 */
	private int shipping_fee; /* 배송비 */
	private int price; /* 실결제금액 */
	
	private String payment_type; /* 결제수단 */
	private String card_type; /* 카드이름 */
	private String orderdate; /* 주문일시 */
	private String fix_state; /* 완료여부 */
	
	private String class_order_code; /* 클래스주문코드 */
	private String goods_order_code; /* 상품주문코드 */
	private String code; /* 코드 */
	private String class_name;
	private String goods_name;
	private String settlement; /* 정산여부 */
	
	private int amount; /* 수량 */
	private String state; /* 진행상태 */
	private String zipcode; /* 우편번호 */
	private String addr; /* 주소 */
	private String detailaddr; /* 상세주소 */
	private String etc; /* 배송요청사항 */
	private String finished; /* 구매확정여부 */
	public String getOrder_code() {
		return order_code;
	}
	public void setOrder_code(String order_code) {
		this.order_code = order_code;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public int getFull_price() {
		return full_price;
	}
	public void setFull_price(int full_price) {
		this.full_price = full_price;
	}
	public int getDiscount() {
		return discount;
	}
	public void setDiscount(int discount) {
		this.discount = discount;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getPayment_type() {
		return payment_type;
	}
	public void setPayment_type(String payment_type) {
		this.payment_type = payment_type;
	}
	public String getCard_type() {
		return card_type;
	}
	public void setCard_type(String card_type) {
		this.card_type = card_type;
	}
	public String getOrderdate() {
		return orderdate;
	}
	public void setOrderdate(String orderdate) {
		this.orderdate = orderdate;
	}
	public String getFix_state() {
		return fix_state;
	}
	public void setFix_state(String fix_state) {
		this.fix_state = fix_state;
	}
	public int getShipping_fee() {
		return shipping_fee;
	}
	public void setShipping_fee(int shipping_fee) {
		this.shipping_fee = shipping_fee;
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
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
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
	public String getSettlement() {
		return settlement;
	}
	public void setSettlement(String settlement) {
		this.settlement = settlement;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
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
	public String getEtc() {
		return etc;
	}
	public void setEtc(String etc) {
		this.etc = etc;
	}
	public String getFinished() {
		return finished;
	}
	public void setFinished(String finished) {
		this.finished = finished;
	}
	
}
