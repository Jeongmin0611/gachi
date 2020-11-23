
package com.bitcamp.gachi.admin;

public class PagingVO {
   private int nowPage=1;                
   private int totalRecord;
   private int totalPage;        
   private int onePageRecord=20;
   private int onePageNumCount=10;
   private int startPageNum=1;
   private int lastPageRecordCount=10;   
   private String searchKey;
   private String searchWord;
   
   public int getNowPage() {
      return nowPage;
   }
   public void setNowPage(int nowPage) {
      this.nowPage = nowPage;
      startPageNum=(nowPage-1)/onePageNumCount*onePageNumCount+1;
   }
   public int getTotalRecord() {
      return totalRecord;
   }
   public void setTotalRecord(int totalRecord) {
      this.totalRecord = totalRecord;
      //총페이지 구하기
      totalPage = (int)Math.ceil((double)totalRecord/onePageRecord);
      
      //마지막페이지에서 선택할 레코드 수
      if(nowPage==totalPage && totalRecord%onePageRecord!=0) {
         lastPageRecordCount = totalRecord%onePageRecord;
      }else {
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
}