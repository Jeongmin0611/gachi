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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	public ModelAndView eventBoard(PagingVO vo, HttpServletRequest req) {
		BoardDaoImp dao = sqlSession.getMapper(BoardDaoImp.class);
		vo.setOnePageRecord(9);
		//현재 페이지
		String nowPageTxt= req.getParameter("nowPage");
		if(nowPageTxt!=null) {//페이지 번호를 request한 경우
			vo.setNowPage(Integer.parseInt(nowPageTxt));
		}
		int totalRecord = dao.eventBoardAllRecordCount(vo);
		vo.setTotalRecord(totalRecord);
		
		List<EventBoardVO> list = dao.eventBoardAllRecord(vo);
		
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.addObject("pvo", vo);
		mav.setViewName("board/eventBoard");
		return mav;
	}

	@RequestMapping("/eventBoardView")
	public ModelAndView eventBoardView(HttpServletRequest req, PagingVO pvo) {
		BoardDaoImp dao = sqlSession.getMapper(BoardDaoImp.class);
		int event_num = Integer.parseInt((String) req.getParameter("event_num"));
		String event = req.getParameter("event");
		EventBoardVO vo = dao.eventBoardSelect(event_num);
		List<EventBoardVO> list = dao.replyAllRecord(event_num);
		vo.setEvent_category(event);

		String nowPage=req.getParameter("nowPage");
		pvo.setNowPage(Integer.parseInt(nowPage));

		ModelAndView mav = new ModelAndView();
		mav.addObject("vo", vo);
		mav.addObject("pvo", pvo);
		mav.addObject("list", list);
		mav.setViewName("board/eventBoardView");
		return mav;
	}

	//이벤트 댓글 리스트
	@RequestMapping(value= "/eventReplyFormOk", method=RequestMethod.POST)
	public ModelAndView eventReplyFormOk(EventBoardVO vo, HttpServletRequest req, HttpSession ses, PagingVO pvo) {
		vo.setIp(req.getRemoteAddr());
		vo.setUserid((String) ses.getAttribute("userid"));
		
		BoardDaoImp dao = sqlSession.getMapper(BoardDaoImp.class);
		dao.insertReply(vo);
		int event_num=vo.getEvent_num();
		String event=req.getParameter("event");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:eventBoardView?event_num="+event_num+"&event="+event+"&nowPage="+pvo.getNowPage());
		return mav;
	}
	//이벤트 댓글 삭제
	@RequestMapping(value="/eventReplyDel")
	public ModelAndView eventReplyDel(HttpSession ses, HttpServletRequest req, RedirectAttributes rttr, PagingVO pvo) {
		EventBoardVO vo= new EventBoardVO();
		String userid = (String) ses.getAttribute("userid");
		System.out.println("userid");
		BoardDaoImp dao = sqlSession.getMapper(BoardDaoImp.class);
		int event_num=Integer.parseInt(req.getParameter("no"));
		int reply_num=Integer.parseInt((String)req.getParameter("reply_num"));
		vo.setReply_num(reply_num);
		vo.setEvent_num(event_num);
		vo.setUserid(userid);
		int result = dao.replyDel(vo);
		
		ModelAndView mav = new ModelAndView();
		if(result>0) {
			rttr.addAttribute("event_num",vo.getEvent_num());
			rttr.addAttribute("nowPage", pvo.getNowPage());
			mav.setViewName("redirect:eventBoardView");
		}else {//댓글 삭제 실패시 글 
			mav.addObject("msg", "댓글 삭제");
			mav.setViewName("/result");
		}
		return mav;
	}
	@RequestMapping("/result")
	public String result() {
		return "board/result";
	}
	
	
	@RequestMapping("/eventBoardEnd")
	public ModelAndView eventBoardEnd(PagingVO vo, HttpServletRequest req) {		
		BoardDaoImp dao = sqlSession.getMapper(BoardDaoImp.class);
		vo.setOnePageRecord(9);
		//현재 페이지
		String nowPageTxt=req.getParameter("nowPage");
		if(nowPageTxt!=null) {//페이지 번호를 request한 경우
			vo.setNowPage(Integer.parseInt(nowPageTxt));
		}
		int totalRecord = dao.endEventBoardAllRecordCount(vo);
		vo.setTotalRecord(totalRecord);
		
		List<EventBoardVO> list = dao.endEventBoardAllRecord(vo);
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.addObject("pvo", vo);
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
	public ModelAndView introCreate(PagingVO vo, HttpServletRequest req){
		CreatorDaoImp dao = sqlSession.getMapper(CreatorDaoImp.class);
		vo.setOnePageRecord(9);
		//현재 페이지
		String nowPageTxt = req.getParameter("nowPage");
		if(nowPageTxt!=null) {//페이지 번호를 request한 경우
			vo.setNowPage(Integer.parseInt(nowPageTxt));
		}
		//검색어, 검색키
		String searchWord = req.getParameter("searchWord");
		if(!(searchWord==null||searchWord.equals(""))) {//검색어가 있을 때
			String searchKey= req.getParameter("searchKey");
			vo.setSearchKey(searchKey);
			vo.setSearchWord(searchWord);
		}
		int totalRecord=dao.introCreatorSelectAllCount(vo);
		vo.setTotalRecord(totalRecord);
		
		List<AllVO> list = dao.creatorBoardSelectAll(vo);
		String nowPage = req.getParameter("nowPage");
		if(nowPage!=null) {
			vo.setNowPage(Integer.parseInt(nowPage));
		}
		
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.addObject("pvo", vo);
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
