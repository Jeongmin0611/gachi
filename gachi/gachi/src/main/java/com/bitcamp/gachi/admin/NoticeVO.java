package com.bitcamp.gachi.admin;

import org.springframework.web.multipart.MultipartFile;

public class NoticeVO {
	private int notice_num;
	private String subject;
	private String content;
	private String writer;
	private String writedate;
	private MultipartFile input_file;
	private String filename;
	private String target;
	private int hit;

	public int getNotice_num() {
		return notice_num;
	}
	public void setNotice_num(int notice_num) {
		this.notice_num = notice_num;
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
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getWritedate() {
		return writedate;
	}
	public void setWritedate(String writedate) {
		this.writedate = writedate;
	}
	public MultipartFile getInput_file() {
		return input_file;
	}
	public void setInput_file(MultipartFile input_file) {
		this.input_file = input_file;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getTarget() {
		return target;
	}
	public void setTarget(String target) {
		this.target = target;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	
	
}
