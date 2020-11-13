package com.bitcamp.gachi.board;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BoardController {
	
	@RequestMapping("/noticeBoard")
	public String noticeBoard() {
		return "board/noticeBoard";
	}
	@RequestMapping("/eventBoard")
	public String eventBoard() {
		return "board/eventBoard";
	}
	
	@RequestMapping("/companyBoard")
	public String companyBoard() {
		
		return "board/companyBoard";
	}
	@RequestMapping("/serviceCenterBoard")
	public String serviceCenterBoard() {
		return "board/serviceCenterBoard";
	}
	@RequestMapping("/deliveryBoard")
	public String deliveryBoard(){
		return "board/deliveryBoard";
	}
	@RequestMapping("/introCreate")
	public String introCreate() {
		return "board/introCreate";
	}
}
