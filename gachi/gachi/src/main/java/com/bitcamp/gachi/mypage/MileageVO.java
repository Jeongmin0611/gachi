package com.bitcamp.gachi.mypage;

public class MileageVO {
	private String mileage_type;
	private int mileage;
	private String breakdown;
	private String occurence_date;
	private String userid;
	public String getMileage_type() {
		return mileage_type;
	}
	public void setMileage_type(String mileage_type) {
		this.mileage_type = mileage_type;
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
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
}
