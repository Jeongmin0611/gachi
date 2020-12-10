package com.bitcamp.gachi.admin;

import java.util.ArrayList;
import java.util.List;

public class ClassVideoVO {
	private String code;
	private String section_code;
	private String video_code;
	private int unit;
	private int section_index;
	private String unit_content;
	private String video_name;
	private String video_filename;
	private int video_length;
	private String enroll_date;

	private List<ClassVideoVO> videoVOList;
	
	public ClassVideoVO() {
		
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getVideo_code() {
		return video_code;
	}
	public void setVideo_code(String video_code) {
		this.video_code = video_code;
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
	public String getVideo_name() {
		return video_name;
	}
	public void setVideo_name(String video_name) {
		this.video_name = video_name;
	}
	public int getVideo_length() {
		return video_length;
	}
	public void setVideo_length(int video_length) {
		this.video_length = video_length;
	}
	public String getEnroll_date() {
		return enroll_date;
	}
	public void setEnroll_date(String enroll_date) {
		this.enroll_date = enroll_date;
	}
	public String getVideo_filename() {
		return video_filename;
	}
	public void setVideo_filename(String video_filename) {
		this.video_filename = video_filename;
	}
	public List<ClassVideoVO> getVideoVOList() {
		return videoVOList;
	}
	public void setVideoVOList(List<ClassVideoVO> videoVOList) {
		this.videoVOList = videoVOList;
	}
	public String getSection_code() {
		return section_code;
	}
	public void setSection_code(String section_code) {
		this.section_code = section_code;
	}
	public int getSection_index() {
		return section_index;
	}
	public void setSection_index(int section_index) {
		this.section_index = section_index;
	}
	
	
}
