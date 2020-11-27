package com.bitcamp.gachi.mypage;

public class MileageVO {
	private String userid; /* 아이디 */
	private int mileage; /* 금액 */
	private String breakdown; /* 내역 */
	private String occurence_date; /* 날짜 */

	
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public int getMileage() {
		return mileage;
	}
	public void setMileage(int mileage) {
		this.mileage = mileage;
	}
	public String getBreakdown() {
		return breakdown;
	}
	public void setBreakdown(String breakdown) {
		this.breakdown = breakdown;
	}
	public String getOccurence_date() {
		return occurence_date;
	}
	public void setOccurence_date(String occurence_date) {
		this.occurence_date = occurence_date;
	}
	
}
