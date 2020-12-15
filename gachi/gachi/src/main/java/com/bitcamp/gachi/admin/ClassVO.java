package com.bitcamp.gachi.admin;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

public class ClassVO {

	private String code;
	private String userid;
	private String category;
	private String class_name;
	private int full_price;
	private int real_price;
	private String stage;
	private int class_term;
	private String class_info;
	private int total_student;
	private int good;
	private int grade;
	private Date allow;
	private Date signup;
	private String class_state;
	private String class_img;
	private String nickname;
	private List<String> imgList;
	private int unit;
	private String unit_content;
	private String section_code;
	private List<ClassVO> unitList;
	
	private int num;
	private String username;
	private String subject;
	private String content;
	private String writedate;
	private String ip;
	
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
	public int getFull_price() {
		return full_price;
	}
	public void setFull_price(int full_price) {
		this.full_price = full_price;
	}
	public int getReal_price() {
		return real_price;
	}
	public void setReal_price(int real_price) {
		this.real_price = real_price;
	}
	public String getStage() {
		return stage;
	}
	public void setStage(String stage) {
		this.stage = stage;
	}
	public Number getClass_term() {
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
	public Date getAllow() {
		return allow;
	}
	public void setAllow(Date allow) {
		this.allow = allow;
	}
	public Date getSignup() {
		return signup;
	}
	public void setSignup(Date signup) {
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
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public List<String> getImgList() {
		return imgList;
	}
	public void setImgList(List<String> imgList) {
		this.imgList = imgList;
	}
	public int getUnit() {
		return unit;
	}
	public void setUnit(int unit) {
		this.unit = unit;
	}
	public String getUnit_content() {
		return unit_content;
	}
	public void setUnit_content(String unit_content) {
		this.unit_content = unit_content;
	}
	public String getSection_code() {
		return section_code;
	}
	public void setSection_code(String section_code) {
		this.section_code = section_code;
	}
	public List<ClassVO> getUnitList() {
		return unitList;
	}
	public void setUnitList(List<ClassVO> unitList) {
		this.unitList = unitList;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWritedate() {
		return writedate;
	}
	public void setWritedate(String writedate) {
		this.writedate = writedate;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	
}