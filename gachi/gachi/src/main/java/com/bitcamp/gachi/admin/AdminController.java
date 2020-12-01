package com.bitcamp.gachi.admin;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
		System.out.println(vo.getUsername());
		return mav;
	}
	
	@RequestMapping(value="/adminCreatorEditOk",method=RequestMethod.POST)
	public ModelAndView adminMemberEditOk(AllVO vo) {

		CreatorDaoImp dao = sqlSession.getMapper(CreatorDaoImp.class);
		int result = dao.creatorMemberUpdate(vo);
		ModelAndView mav = new ModelAndView();	
		
			mav.addObject("result", result);
			mav.setViewName("admin/adminCreatorEditOk");
			
		return mav;
	}
	
	@RequestMapping("/adminCreatorLeaveEditOk")
	public ModelAndView adminCrearotLeaveEditOk(String userid) {

		CreatorDaoImp dao = sqlSession.getMapper(CreatorDaoImp.class);	
		int result = dao.creatorleaveMemberUpdate(userid);
		
		ModelAndView mav = new ModelAndView();

		mav.addObject("result", result);
		mav.setViewName("admin/adminCreatorLeaveEditOk");
		
	return mav;
	}
	@RequestMapping("/creatorMemberDelete")
	public ModelAndView creatorMemberDelete(String userid) {
		MemberDaoImp dao = sqlSession.getMapper(MemberDaoImp.class);
		int result = dao.adminMemberDelete(userid);
		
		ModelAndView mav = new ModelAndView();
		if(result >0) {
			mav.addObject("result", result);
			mav.setViewName("redirect:adminCreator");
		}else {
			mav.setViewName("gachi/adminResult");
		}
		return mav;
	}
	
	@RequestMapping("/adminClass")
	public ModelAndView adminClass(TestVO vo,HttpServletRequest req) {
		System.out.println(vo.getCategory());
		System.out.println(vo.getOption());
		System.out.println(vo.getClass_state());
		ClassDaoImp dao=sqlSession.getMapper(ClassDaoImp.class);	
		
		System.out.println("date1===> "+vo.getDate1()+"date2===> "+vo.getDate2());
		String nowPageRequest=req.getParameter("nowPage");
		if(nowPageRequest!=null) {
			vo.setNowPage(Integer.parseInt(nowPageRequest));
		}
		int totalRecord=dao.getAllRecordCount(vo);
		vo.setTotalRecord(totalRecord);
		
		
		
		
		List<ClassVO> list=dao.getClassList(vo);
		
		ModelAndView mav =new ModelAndView();
		mav.addObject("list",list);
		mav.addObject("pvo",vo);
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
		
		mav.addObject("result", result);
		mav.setViewName("admin/adminMemberEditOk");
		
	return mav;
	}
	
	@RequestMapping("/adminMemberLeaveEditOk")
	public ModelAndView adminMemberLeaveEditOk(String userid) {

		MemberDaoImp dao = sqlSession.getMapper(MemberDaoImp.class);	
		int result = dao.leaveMemberUpdate(userid);
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("result", result);
		mav.setViewName("admin/adminMemberLeaveEditOk");
		
	return mav;
	}

	@RequestMapping("/adminMemberDelete")
	public ModelAndView adminMemberDelete(String userid) {
		MemberDaoImp dao = sqlSession.getMapper(MemberDaoImp.class);
		int result = dao.adminMemberDelete(userid);
		
		ModelAndView mav = new ModelAndView();
		
		if(result >0) {
			mav.addObject("result", result);
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
	
//	@RequestMapping(value="/adminStatStore")
//	public String adminStatStore() {
//	
//		return "admin/adminStatStore";
//	}
	
	@RequestMapping(value="/adminStatStore",method=RequestMethod.GET)
	public ModelAndView adminStatStore(@RequestParam(value="startMonth", required=false) String startMonth, @RequestParam(value="endMonth", required=false) String endMonth) {
		ModelAndView mav = new ModelAndView();
		
		if(startMonth==null || endMonth == null) {
			SimpleDateFormat  yyyymm = new SimpleDateFormat("yyyy-MM");
			String todate =  yyyymm.format(new Date());
			if(Integer.parseInt(todate.substring(5, 7))-1 <= 0) {
				startMonth = (Integer.parseInt(todate.substring(0,3))-1) + "-" + (Integer.parseInt(todate.substring(5, 7))+12-1);
			}
			startMonth = todate.substring(0, 4) +  "-" + (Integer.parseInt(todate.substring(5, 7))-1);
			endMonth = todate;
			
			mav.addObject("startMonth", startMonth);
			mav.addObject("endMonth", endMonth);
		}
		
		int dataSize = 0;
		if((Integer.parseInt(endMonth.substring(0, 4))) == (Integer.parseInt(startMonth.substring(0, 4)))) { // 2019-11 2020-02
			dataSize = Integer.parseInt(endMonth.substring(5,7)) - Integer.parseInt(startMonth.substring(5,7));
		} else{
			dataSize = (Integer.parseInt(endMonth.substring(0,4)) - Integer.parseInt(startMonth.substring(0,4)))*12;
			dataSize += Integer.parseInt(endMonth.substring(5,7)); 
			dataSize -= Integer.parseInt(startMonth.substring(5,7)); 
		}
		
		
		System.out.println("startMonth:" + startMonth);
		System.out.println("endMonth:" + endMonth);
		
		mav.setViewName("admin/adminStatStore");
		return mav;
	}
	@RequestMapping("/adminStatClass")
	public String adminStatClass() {
		return "admin/adminStatClass";
	}
	@RequestMapping("/adminStatCreator")
	public String adminStatCreator() {
		return "admin/adminStatCreator";
	}
//	@RequestMapping("/adminStatMember")
//	public String adminStatMember() {
//		return "admin/adminStatMember";
//	}
	@RequestMapping("/adminStatMember")
	
	public ModelAndView adminStatMember() {
		ModelAndView mav = new ModelAndView();
		System.out.println("controller");
		System.out.println("startMonth is null");
			
		String startMonth, endMonth;
		SimpleDateFormat  yyyymm = new SimpleDateFormat("yyyy-MM");
		String todate =  yyyymm.format(new Date());
		if(Integer.parseInt(todate.substring(5, 7))-1 <= 0) {
			startMonth = (Integer.parseInt(todate.substring(0,3))-1) + "-" + (Integer.parseInt(todate.substring(5, 7))+12-1);
		}
			startMonth = todate.substring(0, 4) +  "-" + (Integer.parseInt(todate.substring(5, 7))-1);
			endMonth = todate;
		
			mav.addObject("startMonth", startMonth);
			mav.addObject("endMonth", endMonth);
		
//		
		System.out.println("startMonth:" + startMonth);
		System.out.println("endMonth:" + endMonth);
//		mav.addObject("dataSize", dataSize);
//		mav.addObject("newMember", newMember);
		mav.setViewName("admin/adminStatMember");
		return mav;
	}
	
	@RequestMapping(value="/adminStatMember",method=RequestMethod.POST)
	@ResponseBody
	public ModelAndView adminStatMember(HttpServletRequest req, HttpServletResponse resp, @RequestParam(value="startMonth", required=false) String startMonth, @RequestParam(value="endMonth", required=false) String endMonth) {
		ModelAndView mav = new ModelAndView();
		System.out.println("controller11");
		if(startMonth==null || endMonth == null) {
			System.out.println("startMonth is null");
			
			SimpleDateFormat  yyyymm = new SimpleDateFormat("yyyy-MM");
			String todate =  yyyymm.format(new Date());
			if(Integer.parseInt(todate.substring(5, 7))-1 <= 0) {
				startMonth = (Integer.parseInt(todate.substring(0,3))-1) + "-" + (Integer.parseInt(todate.substring(5, 7))+12-1);
			}
			startMonth = todate.substring(0, 4) +  "-" + (Integer.parseInt(todate.substring(5, 7))-1);
			endMonth = todate;
		} 
		
		
		
		int dataSize = 0;
		if((Integer.parseInt(endMonth.substring(0, 4))) == (Integer.parseInt(startMonth.substring(0, 4)))) { // 2019-11 2020-02
			dataSize = Integer.parseInt(endMonth.substring(5,7)) - Integer.parseInt(startMonth.substring(5,7));
		} else{
			dataSize = (Integer.parseInt(endMonth.substring(0,4)) - Integer.parseInt(startMonth.substring(0,4)))*12;
			dataSize += Integer.parseInt(endMonth.substring(5,7)); 
			dataSize -= Integer.parseInt(startMonth.substring(5,7));
			
		}
		dataSize += 1;
		System.out.println(dataSize);
		
		List<String> dbParam2 = new ArrayList<String>();
		for(int i=0; i<dataSize; i++) {
			String tmp;
			if(Integer.parseInt(startMonth.substring(5, 7)) + i > 12) {
				tmp = Integer.parseInt(startMonth.substring(0,4))+1 + "-" + (Integer.parseInt(startMonth.substring(5, 7)) - 12 + i);
				System.out.println("tmp1:" + tmp);
			} else {
				tmp = Integer.parseInt(startMonth.substring(0,4)) + "-" + (Integer.parseInt(startMonth.substring(5, 7)) + i);
				System.out.println("tmp2:" + tmp);
			}
			dbParam2.add(tmp);
		}
		
		Map<String, List> dbParam = new HashMap<String, List>();
		dbParam.put("list", dbParam2);
		
		MemberDaoImp dao = sqlSession.getMapper(MemberDaoImp.class);
		List<Integer> newMember = dao.dashForMember(dbParam); // return type

		System.out.println(newMember.size());
		for(int i=0; i<newMember.size(); i++) {
			System.out.println(newMember.get(i));
		}
		
		if(startMonth != null && endMonth != null) {
			
			
			mav.addObject("dashData", newMember);
			mav.addObject("labelData", dbParam2);
			mav.addObject("startMonth", startMonth);
			mav.addObject("endMonth", endMonth);
			
			System.out.println("ajax success");
			System.out.println("labelData =="+dbParam2);
			try {
				//resp.getWriter().write("{\"result\":\"success\"}");
				mav.setViewName("admin/adminStatMember");
				return mav;
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else {
			System.out.println("ajax failed.");
			try{
				resp.getWriter().write("{\"result\":\"fail\"}");
			} catch (IOException e) {
                e.printStackTrace();
            }
		}
		System.out.println("startMonth:" + startMonth);
		System.out.println("endMonth:" + endMonth);
//		mav.addObject("dataSize", dataSize);
//		mav.addObject("newMember", newMember);
//		mav.setViewName("admin/adminStatMember");
		return null;
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
