package com.bitcamp.gachi.board;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BoardController {
	
	@RequestMapping("/noticeBoard")
	public String noticeBoard() {
		return "board/noticeBoard";
	}
	@RequestMapping("/noticeBoardDetail")
	public String noticeBoardDetail() {
		return "board/noticeBoardDetail";
	}
	@RequestMapping("/eventBoard")
	public String eventBoard() {
		return "board/eventBoard";
	}
	@RequestMapping("/eventBoardDetail")
	public String eventBoardDetail() {
		return "board/eventBoardDetail";
	}
	@RequestMapping("/eventBoardEnd")
	public String eventBoardEnd() {
		return "board/eventBoardEnd";
	}
	
	@RequestMapping("/companyBoard")
	public String companyBoard() {
		
		return "board/companyBoard";
	}
	@RequestMapping("/serviceCenterBoard")
	public String serviceCenterBoard() {
		return "board/serviceCenterBoard";
	}
	@RequestMapping("/serviceCenterBoard_TopFAQ")
	public String serviceCenterBoard_TopFAQ() {
		return "board/serviceCenterBoard_TopFAQ";
	}
	@RequestMapping("/serviceCenterBoard_order")
	public String serviceCenterBoard_order() {
		return "board/serviceCenterBoard_order";
	}
	@RequestMapping("/serviceCenterBoard_refund")
	public String serviceCenterBoard_refund(){
		return "board/serviceCenterBoard_refund";
	}
	@RequestMapping("/serviceCenterBoard_class")
	public String serviceCenterBoard_class(){
		return "board/serviceCenterBoard_class";
	}
	@RequestMapping("/serviceCenterBoard_etc")
	public String serviceCenterBoard_etc(){
		return "board/serviceCenterBoard_etc";
	}
	
	
	@RequestMapping("/deliveryBoard")
	public String deliveryBoard(){
		return "board/deliveryBoard";
	}
	@RequestMapping("/introCreate")
	public String introCreate() {
		return "board/introCreate";
	}
	@RequestMapping("/introCreateDetail")
	public String introCreateDetail() {
		return "board/introCreateDetail";
	}
	
	
}
