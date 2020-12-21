package com.bitcamp.gachi.mypage;

public class ClassVideoVO {
	private String userid; /* 아이디(이메일) */
	private String course_code; /* 수강코드 */
	private String section_code; /* 목차코드 */
	private String code; /* 코드 */
	private int unit; /* 목차순서 */
	private String unit_content; /* 파트명 */
	private String[] unit_conArr;
	
	private int section_index; /* 영상순서 */
	private int[] countVideo;
	private String video_code; /* 동영상코드 */
	private String video_name; /* 영상제목 */
	private String video_filename; /* 파일명 */
	private int video_length; /* 영상길이 */
	private int playtime; /* 재생시간 */
	private String enroll_date; /* 등록일자 */
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getCourse_code() {
		return course_code;
	}
	public void setCourse_code(String course_code) {
		this.course_code = course_code;
	}
	public int getPlaytime() {
		return playtime;
	}
	public void setPlaytime(int playtime) {
		this.playtime = playtime;
	}
	public String getSection_code() {
		return section_code;
	}
	public void setSection_code(String section_code) {
		this.section_code = section_code;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
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
	public String[] getUnit_conArr() {
		return unit_conArr;
	}
	public void setUnit_conArr(String[] unit_conArr) {
		this.unit_conArr = unit_conArr;
	}
	public int getSection_index() {
		return section_index;
	}
	public void setSection_index(int section_index) {
		this.section_index = section_index;
	}
	public int[] getCountVideo() {
		return countVideo;
	}
	public void setCountVideo(int[] countVideo) {
		this.countVideo = countVideo;
	}
	public String getVideo_code() {
		return video_code;
	}
	public void setVideo_code(String video_code) {
		this.video_code = video_code;
	}
	public String getVideo_name() {
		return video_name;
	}
	public void setVideo_name(String video_name) {
		this.video_name = video_name;
	}
	public String getVideo_filename() {
		return video_filename;
	}
	public void setVideo_filename(String video_filename) {
		this.video_filename = video_filename;
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
}
