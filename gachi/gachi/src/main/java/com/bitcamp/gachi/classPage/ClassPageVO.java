
package com.bitcamp.gachi.classPage;

public class ClassPageVO {
	private int nowPage = 1; // 현재 페이지
	private int totalRecord; // 총 레코드
	private int totalPage; // 총 페이지 수
	private int onePageRecord = 9; // 한 페이지에 표시할 레코드
	private int onePageNumCount = 5; // 한 번에 표시할 페이지 번호 숫자
	private int startPageNum = 1; // 페이지 번호의 시작 페이지
	private int lastPageRecordCount = 9; // 마지막 페이지의 선택 레코드 수 onePageRecord 수

	private int startRow;// 한페이지의 시작글번호
	private int endRow;// 한 페이지의 마지막 글번호
	
	//검색어
	private String searchKey;
	private String searchWord;
	private String code;/*코드*/
	private String category; // 카테고리   
	private String real_price;/*실 가격*/
	private String selectval;
	private String enddate;
	private String class_img;
	private String class_name;
	private String nickname;
	private int good;
	private String signup;
	private int stack;
	
	private String interest;

	public String getInterest() {
		return interest;
	}

	public void setInterest(String interest) {
		this.interest = interest;
	}

	public String getSearchKey() {
		return searchKey;
	}

	public void setSearchKey(String searchKey) {
		this.searchKey = searchKey;
	}

	public String getSearchWord() {
		return searchWord;
	}

	public void setSearchWord(String searchWord) {
		this.searchWord = searchWord;
	}

	public int getStartRow() {
		return startRow;
	}

	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}

	public int getEndRow() {
		return endRow;
	}

	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}

	public int getNowPage() {
		return nowPage;
	}

	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
		startPageNum = (nowPage - 1) / onePageNumCount * onePageNumCount + 1;
	}

	public int getTotalRecord() {
		return totalRecord;
	}

	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
		// 총페이지 구하기
		totalPage = (int) Math.ceil((double) totalRecord / onePageRecord);

		// 마지막페이지에서 선택할 레코드 수
		if (nowPage == totalPage && totalRecord % onePageRecord != 0) {
			lastPageRecordCount = totalRecord % onePageRecord;
		} else {
			lastPageRecordCount = onePageRecord;
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

	public int getOnePageNumCount() {
		return onePageNumCount;
	}

	public void setOnePageNumCount(int onePageNumCount) {
		this.onePageNumCount = onePageNumCount;
	}

	public int getStartPageNum() {
		return startPageNum;
	}

	public void setStartPageNum(int startPageNum) {
		this.startPageNum = startPageNum;
	}

	public int getLastPageRecordCount() {
		return lastPageRecordCount;
	}

	public void setLastPageRecordCount(int lastPageRecordCount) {
		this.lastPageRecordCount = lastPageRecordCount;
	}

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

	public String getReal_price() {
		return real_price;
	}

	public void setReal_price(String real_price) {
		this.real_price = real_price;
	}

	public String getSelectval() {
		return selectval;
	}

	public void setSelectval(String selectval) {
		this.selectval = selectval;
	}

	public String getEnddate() {
		return enddate;
	}

	public void setEnddate(String enddate) {
		this.enddate = enddate;
	}

	public String getClass_img() {
		return class_img;
	}

	public void setClass_img(String class_img) {
		this.class_img = class_img;
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

	public int getGood() {
		return good;
	}
	public void setGood(int good) {
		this.good = good;
	}
	public String getSignup() {
		return signup;
	}

	public void setSignup(String signup) {
		this.signup = signup;
	}
	public int getStack() {
		return stack;
	}

	public void setStack(int stack) {
		this.stack = stack;
	}
}