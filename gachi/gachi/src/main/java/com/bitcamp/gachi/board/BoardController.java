package com.bitcamp.gachi.board;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
		vo.setOnePageRecord(10);
		//현재 페이지
		String nowPageTxt = req.getParameter("nowPage");
		if(nowPageTxt!=null) {//페이지 번호를 request한 경우
			vo.setNowPage(Integer.parseInt(nowPageTxt));			
		}
		//검색어, 검색키
		String searchWord = req.getParameter("searchWord");
		if(!(searchWord==null||searchWord.equals(""))) {//검색어가 있을 때
			String searchKey = req.getParameter("searchKey");
			vo.setSearchKey(searchKey);
			vo.setSearchWord(searchWord);
		}
		
		int totalRecord=dao.noticeBoardAllRecordCount(vo);
		vo.setTotalRecord(totalRecord);
		
		List<NoticeBoardVO> list = dao.noticeBoardAllRecord(vo);
		
		String nowPage = req.getParameter("nowPage");
		if(nowPage!=null) {
			vo.setNowPage(Integer.parseInt(nowPage));
		}
		
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.addObject("pvo",vo);
		mav.setViewName("board/noticeBoard");
		return mav;
	}

	@RequestMapping("/noticeBoardView")
	public ModelAndView noticeBoardView(int no, HttpServletRequest req, PagingVO pvo) {
		BoardDaoImp dao = sqlSession.getMapper(BoardDaoImp.class);
		NoticeBoardVO vo = dao.noticeBoardSelect(no);
		
		String searchWord = req.getParameter("searchWord");
		if(!(searchWord==null||searchWord.equals(""))) {//검색어가 있을 때
			pvo.setSearchKey(req.getParameter("searchKey"));
			pvo.setSearchWord(searchWord);
		}
		String nowPage=req.getParameter("nowPage");
		pvo.setNowPage(Integer.parseInt(nowPage));
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("vo", vo);
		mav.addObject("pvo", pvo);
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
		List<EventBoardVO> list = dao.replyAllRecord(no);
		vo.setEvent_category(event);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("vo", vo);
		mav.addObject("list", list);
		mav.setViewName("board/eventBoardView");
		return mav;
	}

	//이벤트 댓글
	@RequestMapping(value= "/eventReplyFormOk", method=RequestMethod.POST)
	public ModelAndView eventReplyFormOk(EventBoardVO vo, HttpServletRequest req, HttpSession ses) {
		vo.setIp(req.getRemoteAddr());
		vo.setUserid((String) ses.getAttribute("userid"));
		
		BoardDaoImp dao = sqlSession.getMapper(BoardDaoImp.class);
		int result = dao.insertReply(vo);
		System.out.println("result= "+result);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:eventBoardView");
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
