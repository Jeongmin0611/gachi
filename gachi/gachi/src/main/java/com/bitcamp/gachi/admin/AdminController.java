package com.bitcamp.gachi.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class AdminController {
	SqlSession sqlSession;
	
	public SqlSession getSqlSession() {
		return sqlSession;
	}
	
	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@RequestMapping ("/adminDashboard")
	public String adminDashboard() {
		return "admin/adminDashboard";
	}
	@RequestMapping("/adminCreator")
	public ModelAndView adminCreator() {
		CreatorDaoImp dao = sqlSession.getMapper(CreatorDaoImp.class);
		List<AllVO> list = dao.selectAllCreator();
		int countAllCreator = dao.countAllCreator();
		int countNowCreator =dao.countNowCreator();
		int countDeletedCreator = dao.countDeletedCreator();
		ModelAndView mav=new ModelAndView();
		mav.addObject("creatorList", list);
		mav.addObject("countAllCreator", countAllCreator);
		mav.addObject("countNowCreator", countNowCreator);
		mav.addObject("countDeletedCreator", countDeletedCreator);
		mav.setViewName("admin/adminCreator");
		return mav;
	}
	@RequestMapping("/adminCreatorView")
	public ModelAndView adminCreatorView(String userid) {
		
		CreatorDaoImp dao = sqlSession.getMapper(CreatorDaoImp.class);
		
		ModelAndView mav = new ModelAndView();
		AllVO vo = dao.selectCreator(userid);	
		mav.addObject("vo",vo);		
		mav.setViewName("admin/adminCreatorView");
		return mav;
	}
	
	@RequestMapping(value="/adminCreatorEditOk",method=RequestMethod.POST)
	public ModelAndView adminMemberEditOk(AllVO vo) {

		CreatorDaoImp dao = sqlSession.getMapper(CreatorDaoImp.class);
		
		int result = dao.creatorMemberUpdate(vo);
			result += dao.creatorMemberUpdate1(vo);
		ModelAndView mav = new ModelAndView();	
		
		if(result>1) {

			mav.setViewName("redirect:adminCreator");
			
		}else {
			mav.setViewName("admin/adminResult");	
		}		
		return mav;
	}
	
	@RequestMapping("/creatorMemberDelete")
	public ModelAndView creatorMemberDelete(String userid) {
		CreatorDaoImp dao = sqlSession.getMapper(CreatorDaoImp.class);
		int result = dao.creatorMemberDelete(userid);
		
		ModelAndView mav = new ModelAndView();
		
		if(result >0) {
			mav.setViewName("redirect:adminCreator");
		}else {
			mav.setViewName("gachi/adminResult");
		}
		return mav;
	}
	
	@RequestMapping("/adminClass")
	public ModelAndView adminClass(TestVO vo) {
		if(vo.getCategory()!=null) {
			System.out.println("cate==>"+vo.getCategory());
			System.out.println("option==>"+vo.getOption());
			System.out.println("state==>"+vo.getClass_state());
			System.out.println("word==>"+vo.getSearchWord());
		}
		ClassDaoImp dao=sqlSession.getMapper(ClassDaoImp.class);		
		List<ClassVO> list=dao.selectAllClass(vo);
		
		ModelAndView mav =new ModelAndView();
		mav.addObject("list",list);
		mav.setViewName("admin/adminClass");
		return mav;
	}
	@RequestMapping("/adminClassView")
	public String adminClassView() {
		return "admin/adminClassView";
	}
	
//	public String adminMember() {
//		
//		return "admin/adminMember";
//	}
	@RequestMapping("/adminMember")
	public ModelAndView adminMember() {
		MemberDaoImp dao = sqlSession.getMapper(MemberDaoImp.class);
		List<MemberVO> list = dao.selectAllMember(); // 전체 회원 리스트
		int countAllMember = dao.countAllMember(); // 전체 회원 명 수 (현재 회원 + 탈퇴 회원)
		int countNowMember = dao.countNowMember(); // 현재 회원 명 수
		int countDeletedMember = dao.countDeletedMember(); // 탈퇴 회원 명 수
		
		PagingVO pageVO = new PagingVO();
		
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("memberList",list);
		mav.addObject("pageVO",pageVO);
		mav.addObject("countAllMember", countAllMember);
		mav.addObject("countNowMember", countNowMember);
		mav.addObject("countDeletedMember", countDeletedMember);
		mav.setViewName("admin/adminMember");
		return mav;
	}
	@RequestMapping("/adminMemberView")
	public ModelAndView adminMemberView(String userid) {
		
		MemberDaoImp dao = sqlSession.getMapper(MemberDaoImp.class);
		
		MemberVO vo = dao.selectMember(userid);
		ModelAndView mav = new ModelAndView();	
		
		mav.addObject("vo",vo);		
		mav.setViewName("admin/adminMemberView");
		return mav;
	}
	@RequestMapping(value="/adminMemberEditOk",method=RequestMethod.POST)
	public ModelAndView adminMemberEditOk(MemberVO vo) {

		MemberDaoImp dao = sqlSession.getMapper(MemberDaoImp.class);
		
		int result = dao.MemberUpdate(vo);
		ModelAndView mav = new ModelAndView();	
		
		if(result>0) {

			mav.setViewName("redirect:adminMember");
			
		}else {
			mav.setViewName("admin/adminResult");	
		}		
		return mav;
	}
	@RequestMapping("/adminMemberDelete")
	public ModelAndView adminMemberDelete(String userid) {
		MemberDaoImp dao = sqlSession.getMapper(MemberDaoImp.class);
		int result = dao.adminMemberDelete(userid);
		
		ModelAndView mav = new ModelAndView();
		
		if(result >0) {
			mav.setViewName("redirect:adminMember");
		}else {
			mav.setViewName("gachi/adminResult");
		}
		return mav;
	}
	@RequestMapping("/adminNotice")
	public String adminNotice() {
		return "admin/adminNotice";
	}
	
	@RequestMapping("/adminNoticeView")
	public String adminNoticeView() {
		return "admin/adminNoticeView";
	}
	@RequestMapping("/adminNoticeWrite")
	public String adminNoticeWrite() {
		return "admin/adminNoticeWrite";
	}
	@RequestMapping("/adminEvent")
	public String adminEvent() {
		return "admin/adminEvent";
	}
	@RequestMapping("/adminEventView")
	public String adminEventView() {
		return "admin/adminEventView";
	}
	@RequestMapping("/adminEventWrite")
	public String adminEventWrite() {
		return "admin/adminEventWrite";
	}
	@RequestMapping("/admin1on1")
	public String admin1on1() {
		return "admin/admin1on1";
	}
	@RequestMapping("/admin1on1View")
	public String admin1on1View() {
		return "admin/admin1on1View";
	}
	@RequestMapping("/admin1on1Write")
	public String admin1on1Write() {
		return "admin/admin1on1Write";
	}
	@RequestMapping("/adminOrder")
	public String adminOrder() {
		return "admin/adminOrder";
	}
	@RequestMapping("/adminOrderView")
	public String adminOrderView() {
		return "admin/adminOrderView";
	}
	@RequestMapping("/adminStore")
	public String adminStore() {
		return "admin/adminStore";
	}
	@RequestMapping("/adminDelivery")
	public String adminDelivery() {
		return "admin/adminDelivery";
	}
	@RequestMapping("/adminGoods")
	public String adminGoodsList() {
		return "admin/adminGoods";
	}
	@RequestMapping("/adminGoodsView")
	public String adminGoodsView() {
		return "admin/adminGoodsView";
	}
	@RequestMapping("/adminGoodsEdit")
	public String adminGoodsEdit() {
		return "admin/adminGoodsEdit";
	}
	@RequestMapping("/adminGoodsWrite")
	public String adminGoodsEnroll() {
		return "admin/adminGoodsWrite";
	}
	@RequestMapping("/adminStatStore")
	public String adminStatStore() {
		return "admin/adminStatStore";
	}
	@RequestMapping("/adminStatClass")
	public String adminStatClass() {
		return "admin/adminStatClass";
	}
	@RequestMapping("/adminStatCreator")
	public String adminStatCreator() {
		return "admin/adminStatCreator";
	}
	@RequestMapping("/adminStatMember")
	public String adminStatMember() {
		return "admin/adminStatMember";
	}
	@RequestMapping("/adminSettle")
	public String adminSettle() {
		return "admin/adminSettle";
	}
	@RequestMapping("/adminReturn")
	public String adminReturn() {
		return "admin/adminReturn";
	}
	@RequestMapping("/adminVideo")
	public String adminVideo() {
		return "admin/adminVideo";
	}
	@RequestMapping("/adminReply")	
	public String adminReply() {
		return "admin/adminReply";
	}
	@RequestMapping("/adminClassReview")
	public String adminClassReview() {
		return "admin/adminClassReview";
	}
	@RequestMapping("/adminAnswer")
	public String adminAnswer() {
		return "admin/adminAnswer";
	}
}
