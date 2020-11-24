package com.bitcamp.gachi.board;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BoardController {
	SqlSession sqlSession;
	
	public SqlSession getSqlSession() {
		return sqlSession;
	}
	
	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@RequestMapping("/noticeBoard")
	public ModelAndView noticeBoard() {
		BoardDaoImp dao = sqlSession.getMapper(BoardDaoImp.class);
		List<NoticeBoardVO> list = dao.noticeBoardAllRecord();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("board/noticeBoard");
		return mav;
	}
	@RequestMapping("/noticeBoardDetail")
	public ModelAndView noticeBoardDetail(int no) {
		BoardDaoImp dao = sqlSession.getMapper(BoardDaoImp.class);
		NoticeBoardVO vo = dao.noticeBoardSelect(no);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("vo", vo);
		mav.setViewName("board/noticeBoardDetail");
		return mav;
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
