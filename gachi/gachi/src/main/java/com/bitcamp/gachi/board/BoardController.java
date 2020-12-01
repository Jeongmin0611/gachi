package com.bitcamp.gachi.board;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.bitcamp.gachi.admin.AllVO;
import com.bitcamp.gachi.admin.CreatorDaoImp;
import com.bitcamp.gachi.admin.PagingVO;

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

	@RequestMapping("/all")
	public String all() {
		return "board/all";
	}
	@RequestMapping("/noticeBoard")
	public ModelAndView noticeBoard(PagingVO vo, HttpServletRequest req) {
		BoardDaoImp dao = sqlSession.getMapper(BoardDaoImp.class);
		List<NoticeBoardVO> list = dao.noticeBoardAllRecord(vo);
		
		String nowPage = req.getParameter("nowPage");
		if(nowPage!=null) {
			vo.setNowPage(Integer.parseInt(nowPage));
		}
		
		int totalRecord=dao.noticeBoardAllRecordCount(vo);
		vo.setTotalRecord(totalRecord);
		vo.setOnePageRecord(10);
		vo.setOnePageNumCount(5);
		vo.setLastPageRecordCount(10);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.addObject("pvo",vo);
		mav.setViewName("board/noticeBoard");
		return mav;
	}

	@RequestMapping("/noticeBoardView")
	public ModelAndView noticeBoardView(int no) {
		BoardDaoImp dao = sqlSession.getMapper(BoardDaoImp.class);
		NoticeBoardVO vo = dao.noticeBoardSelect(no);

		ModelAndView mav = new ModelAndView();
		mav.addObject("vo", vo);
		mav.setViewName("board/noticeBoardView");
		return mav;
	}

	// 이벤트 리스트
	@RequestMapping("/eventBoard")
	public ModelAndView eventBoard() {
		BoardDaoImp dao = sqlSession.getMapper(BoardDaoImp.class);
		List<EventBoardVO> list = dao.eventBoardAllRecord();
		
		
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("board/eventBoard");
		return mav;
	}

	@RequestMapping("/eventBoardView")
	public ModelAndView eventBoardView(int no, String event) {
		BoardDaoImp dao = sqlSession.getMapper(BoardDaoImp.class);
		EventBoardVO vo = dao.eventBoardSelect(no);
		vo.setEvent_category(event);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("vo", vo);
		mav.setViewName("board/eventBoardView");
		return mav;
	}

	@RequestMapping("/eventBoardEnd")
	public ModelAndView eventBoardEnd() {
		BoardDaoImp dao = sqlSession.getMapper(BoardDaoImp.class);
		List<EventBoardVO> list = dao.endEventBoardAllRecord();
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("board/eventBoardEnd");
		return mav;
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
	public String serviceCenterBoard_refund() {
		return "board/serviceCenterBoard_refund";
	}

	@RequestMapping("/serviceCenterBoard_class")
	public String serviceCenterBoard_class() {
		return "board/serviceCenterBoard_class";
	}

	@RequestMapping("/serviceCenterBoard_etc")
	public String serviceCenterBoard_etc() {
		return "board/serviceCenterBoard_etc";
	}

	@RequestMapping("/deliveryBoard")
	public String deliveryBoard() {
		return "board/deliveryBoard";
	}

	@RequestMapping("/introCreator")
	public ModelAndView introCreate(){
		CreatorDaoImp dao = sqlSession.getMapper(CreatorDaoImp.class);
		List<AllVO> list = dao.creatorBoardSelectAll();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("board/introCreator");
		return mav;
	}

	@RequestMapping("/introCreatorView")
	public ModelAndView introCreateView(String userid) {
		CreatorDaoImp dao = sqlSession.getMapper(CreatorDaoImp.class);
		AllVO vo = dao.creatorBoardViewSelect(userid);
		List<AllVO> list = dao.creatorBoardViewSelectClass(userid);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("vo", vo);
		mav.addObject("list", list);
		mav.setViewName("board/introCreatorView");
		return mav;
	}
	
	

}
