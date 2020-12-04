package com.bitcamp.gachi.admin;

public class NoticePageVO {
	private int totalRecord;
	private int totalPage;
	private int onePageRecord=10;
	private int startPageNum=1;
	private int onePageNumCount=5;
	private int nowPage=1;
	private int lastPageRecordCount=10;
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
		
		startPageNum=((nowPage-1)/onePageNumCount*onePageNumCount)+1;
	}
	public int getLastPageRecordCount() {
		return lastPageRecordCount;
	}
	public void setLastPageRecordCount(int lastPageRecordCount) {
		this.lastPageRecordCount = lastPageRecordCount;
	}
	
	
}
