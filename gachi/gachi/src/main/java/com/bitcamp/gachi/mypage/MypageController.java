package com.bitcamp.gachi.mypage;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.bitcamp.gachi.register.RegisterVO;

@Controller
public class MypageController {
	SqlSession sqlSession;
	
	public SqlSession getSqlSession() {
		return sqlSession;
	}
	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	//******마이페이지 메인-결제/주문내역확인*******
	@RequestMapping("/mypage")
	public ModelAndView Mypage(HttpSession ses) {
	//	UserInfoDaoImp dao = sqlSession.getMapper(UserInfoDaoImp.class);
		//List<OrderVO> list = dao.orderAllRecord((String)ses.getAttribute("userid"));
		
		ModelAndView mav = new ModelAndView();
		//mav.addObject("cList", cList);
		//mav.addObject("gList", gList);
		mav.setViewName("mypage/mypageMain");
		return mav;
	}
	//회원정보확인
	@RequestMapping("/userInfoView")
	public ModelAndView userInfoView(HttpSession ses) {
		UserInfoDaoImp dao = sqlSession.getMapper(UserInfoDaoImp.class);
		MemberVO vo = dao.userInfoView((String)ses.getAttribute("userid"));
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("vo", vo);
		mav.setViewName("mypage/userInfoView");
		return mav;
	}
	//회원정보수정-비밀번호입력
	@RequestMapping("/userInfoEditChk")
	public ModelAndView userInfoEditChk(HttpSession ses) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("userid",(String)ses.getAttribute("userid"));
		mav.setViewName("mypage/userInfoEditChk");
		return mav;
	}
	//회원정보수정-비밀번호확인
	@RequestMapping(value="/userInfoEditOk", method=RequestMethod.POST)
	public ModelAndView userInfoEditOk(MemberVO vo, HttpSession ses) {
		UserInfoDaoImp dao = sqlSession.getMapper(UserInfoDaoImp.class);
		int result = dao.userInfoPwdChk(vo);
		
		ModelAndView mav = new ModelAndView();
		if(result==0) { //비밀번호 틀리면
			mav.setViewName("mypage/userInfoPwdResult");
		}else if(result==1) { //비밀번호 맞으면
			MemberVO resultVO = dao.userInfoView((String)ses.getAttribute("userid"));
			mav.addObject("vo", resultVO);
			mav.setViewName("mypage/userInfoEditForm");
		}
		return mav;
	}
	//회원정보수정-성공여부
	@RequestMapping(value="/userInfoEditFormOk", method=RequestMethod.POST)
	public ModelAndView userInfoEditFormOk(MemberVO vo, HttpSession ses) {
		UserInfoDaoImp dao = sqlSession.getMapper(UserInfoDaoImp.class);
		int result = dao.userInfoEdit(vo);
		
		ModelAndView mav = new ModelAndView();
		if(result>0) { //업데이트 성공
			mav.setViewName("redirect:userInfoView");
		}else { //업데이트 실패
			mav.setViewName("mypage/userInfoEditResult");
		}
		return mav;
	}
	//회원탈퇴
	@RequestMapping("/userLeave")
	public ModelAndView userLeave(HttpSession ses) {
		UserInfoDaoImp dao = sqlSession.getMapper(UserInfoDaoImp.class);
		String userid = (String)ses.getAttribute("userid");
		String username = dao.userInfoView(userid).getUsername();
		ModelAndView mav = new ModelAndView();
		mav.addObject("userid", userid);
		mav.addObject("username", username);
		mav.setViewName("mypage/userLeave");
		return mav;
	}
	//회원탈퇴-비밀번호입력
	@RequestMapping("/userLeaveChk")
	public ModelAndView userLeaveChk(HttpSession ses) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("userid",(String)ses.getAttribute("userid"));
		mav.setViewName("mypage/userLeaveChk");
		return mav;
	}
	//회원탈퇴-비밀번호확인
	@RequestMapping(value="/userLeaveOk", method=RequestMethod.POST)
	public ModelAndView userLeaveOk(MemberVO vo, HttpSession ses) {
		UserInfoDaoImp dao = sqlSession.getMapper(UserInfoDaoImp.class);
		int result = dao.userInfoPwdChk(vo);
		
		ModelAndView mav = new ModelAndView();
		if(result==0) { //비밀번호 틀리면
			mav.setViewName("mypage/userInfoPwdResult");
		}else if(result==1) { //비밀번호 맞으면
			int LeaveResult = dao.userLeave(vo);
			if(LeaveResult>0) { //탈퇴 성공
				ses.invalidate();
				mav.setViewName("mypage/userLeaveConfirmed");
			}else { //탈퇴 실패
				mav.setViewName("mypage/userLeaveResult");
			}
		}
		return mav;
	}
	//회원탈퇴-성공
	@RequestMapping("/userLeaveConfirmed")
	public String userLeaveConfirmed() {
		return "mypage/userLeaveConfirmed";
	}
	@RequestMapping("/userCart")
	public String userCart() {
		return "mypage/userCart";
	}
	@RequestMapping("/orderSheet")
	public String orderSheet() {
		return "mypage/orderSheet";
	}
	@RequestMapping("/orderConfirmed")
	public String orderConfirmed() {
		return "mypage/orderConfirmed";
	}
	@RequestMapping("/myclassList")
	public String myclassList() {
		return "mypage/myclassList";
	}
	@RequestMapping("/myclassView")
	public String myclassView() {
		return "mypage/myclassView";
	}
	@RequestMapping("/myclassVideo")
	public String myclassVideo() {
		return "myclass/myclassVideo";
	}
	//마일리지
	@RequestMapping("/userMileage")
	public ModelAndView userMileage(HttpSession ses) {
		MileageDaoImp dao = sqlSession.getMapper(MileageDaoImp.class);
		String userid = (String)ses.getAttribute("userid");
		List<MileageVO> list = dao.mileageAllRecord(userid);
		
		int mileageAllSum = dao.mileageAllSum(userid);
		int mileagePosiSum = dao.mileagePosiSum(userid);
		int mileageNegaSum = dao.mileageNegaSum(userid);
		
		ses.setAttribute("mileage", mileageAllSum);
		ModelAndView mav = new ModelAndView();
		mav.addObject("list",list);
		mav.addObject("mileageAllSum", mileageAllSum);
		mav.addObject("mileagePosiSum", mileagePosiSum);
		mav.addObject("mileageNegaSum",mileageNegaSum);
		mav.setViewName("mypage/userMileage");
		return mav;
	}
	@RequestMapping("/userWishList")
	public String userWishList() {
		return "mypage/userWishList";
	}
	@RequestMapping("/myqnaClass")
	public String myqnaClass() {
		return "mypage/myqnaClass";
	}
	@RequestMapping("/myqnaStore")
	public String myqnaStore() {
		return "mypage/myqnaStore";
	}
	@RequestMapping("/myqna1on1")
	public String myqna1on1() {
		return "mypage/myqna1on1";
	}
	@RequestMapping("/myqnaEvent")
	public String myqnaEvent() {
		return "mypage/myqnaEvent";
	}
}
