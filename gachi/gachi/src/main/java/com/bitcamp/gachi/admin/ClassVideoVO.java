package com.bitcamp.gachi.admin;

import java.util.List;

public class ClassVideoVO {
	private int totalRecord;
	private int totalPage;
	private int onePageRecord=10;
	private int startPageNum=1;
	private int onePageNumCount=5;
	private int nowPage=1;
	private int lastPageRecordCount=10;
	
	private String category;
	private String searchOption;
	private String dateOption;
	private String date1;
	private String date2;
	private String searchWord;
	
	private String class_state;
	
	
	
	private String code;
	private String class_name;
	private String section_code;
	private String video_code;
	private int unit;
	private int section_index;
	private String unit_content;
	private String video_name;
	private String video_filename;
	private double video_length;
	private String lengthStr;
	private String enroll_date;
	private String nickname;
	
	private String[] unitContent;
	private int[] unitArray;
	private int[] sectionIndex;
	private String[] videoCode;
	private String[] enrollDate;
	private double[] videoLength;
	private String[] videoName;
	private String[] videoFileName;
	private String[] sectionCode;
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
	public double getVideo_length() {
		return video_length;
	}
	public void setVideo_length(double video_length) {
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
	public String getClass_name() {
		return class_name;
	}
	public void setClass_name(String class_name) {
		this.class_name = class_name;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String[] getUnitContent() {
		return unitContent;
	}
	public void setUnitContent(String[] unitContent) {
		this.unitContent = unitContent;
	}
	public int[] getUnitArray() {
		return unitArray;
	}
	public void setUnitArray(int[] unitArray) {
		this.unitArray = unitArray;
	}
	public int[] getSectionIndex() {
		return sectionIndex;
	}
	public void setSectionIndex(int[] sectionIndex) {
		this.sectionIndex = sectionIndex;
	}
	public String[] getVideoCode() {
		return videoCode;
	}
	public void setVideoCode(String[] videoCode) {
		this.videoCode = videoCode;
	}
	public String[] getEnrollDate() {
		return enrollDate;
	}
	public void setEnrollDate(String[] enrollDate) {
		this.enrollDate = enrollDate;
	}
	public double[] getVideoLength() {
		return videoLength;
	}
	public void setVideoLength(double[] videoLength) {
		this.videoLength = videoLength;
	}
	public String[] getVideoFileName() {
		return videoFileName;
	}
	public void setVideoFileName(String[] videoFileName) {
		this.videoFileName = videoFileName;
	}
	public String[] getVideoName() {
		return videoName;
	}
	public void setVideoName(String[] videoName) {
		this.videoName = videoName;
	}
	public String[] getSectionCode() {
		return sectionCode;
	}
	public void setSectionCode(String[] sectionCode) {
		this.sectionCode = sectionCode;
	}
	public String getLengthStr() {
		return lengthStr;
	}
	public void setLengthStr(String lengthStr) {
		this.lengthStr = lengthStr;
	}
	public int getTotalRecord() {
		return totalRecord;
	}
	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
		
		totalPage=(int) Math.ceil((double)totalRecord/onePageRecord);
		
		//마지막 페이지에 보여줄 레코드 설정
		if(nowPage==totalPage &&totalRecord%onePageRecord!=0) {
			lastPageRecordCount=totalRecord%onePageRecord;
		}else {
			lastPageRecordCount=onePageRecord;
		}
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getOnePageRecord() {
		return onePageRecord;
	}
	public void setOnePageRecord(int onePageRecord) {
		this.onePageRecord = onePageRecord;
	}
	public int getStartPageNum() {
		return startPageNum;
	}
	public void setStartPageNum(int startPageNum) {
		this.startPageNum = startPageNum;
	}
	public int getOnePageNumCount() {
		return onePageNumCount;
	}
	public void setOnePageNumCount(int onePageNumCount) {
		this.onePageNumCount = onePageNumCount;
	}
	public int getNowPage() {
		return nowPage;
	}
	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
		
		//시작페이지 번호계산
		startPageNum=((nowPage-1)/onePageNumCount*onePageNumCount)+1;
	}
	public int getLastPageRecordCount() {
		return lastPageRecordCount;
	}
	public void setLastPageRecordCount(int lastPageRecordCount) {
		this.lastPageRecordCount = lastPageRecordCount;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	
	public String getSearchOption() {
		return searchOption;
	}
	public void setSearchOption(String searchOption) {
		this.searchOption = searchOption;
	}
	public String getDateOption() {
		return dateOption;
	}
	public void setDateOption(String dateOption) {
		this.dateOption = dateOption;
	}
	public String getDate1() {
		return date1;
	}
	public void setDate1(String date1) {
		this.date1 = date1;
	}
	public String getDate2() {
		return date2;
	}
	public void setDate2(String date2) {
		this.date2 = date2;
	}
	public String getSearchWord() {
		return searchWord;
	}
	public void setSearchWord(String searchWord) {
		this.searchWord = searchWord;
	}
	public String getClass_state() {
		return class_state;
	}
	public void setClass_state(String class_state) {
		this.class_state = class_state;
	}
	
	
}
