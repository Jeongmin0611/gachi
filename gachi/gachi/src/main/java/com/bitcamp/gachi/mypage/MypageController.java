package com.bitcamp.gachi.mypage;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bitcamp.gachi.register.RegisterVO;
import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;

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
		UserInfoDaoImp dao = sqlSession.getMapper(UserInfoDaoImp.class);
		String userid = (String)ses.getAttribute("userid");
		List<String> list = dao.orderList(userid);
		
		LinkedHashMap<String,List<OrderListVO>> map = new LinkedHashMap<String,List<OrderListVO>>();
		for(int i=0; i<list.size(); i++) {
			map.put(list.get(i)+"c", dao.classOrderView(list.get(i)));
			map.put(list.get(i)+"g", dao.goodsOrderView(list.get(i)));
		}
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.addObject("map", map);
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
		int result;
		if(vo.getUserpwd()==null || vo.getUserpwd()=="") {
			result = dao.userInfoEdit(vo);
		}else {
			result = dao.userInfoEditPwd(vo);
		}
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
		int mileage = (Integer)ses.getAttribute("mileage");
		ModelAndView mav = new ModelAndView();
		mav.addObject("userid", userid);
		mav.addObject("username", username);
		mav.addObject("mileage", mileage);
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
	//장바구니
	@RequestMapping("/userCart")
	public ModelAndView userCart(HttpSession ses) {
		UserInfoDaoImp dao = sqlSession.getMapper(UserInfoDaoImp.class);
		List<OrderListVO> cList = dao.classCartView((String)ses.getAttribute("userid"));
		List<OrderListVO> gList = dao.goodsCartView((String)ses.getAttribute("userid"));
		ModelAndView mav = new ModelAndView();

		mav.addObject("cList", cList);
		mav.addObject("gList", gList);	
		mav.setViewName("mypage/userCart");
		return mav;
	}
	//장바구니 삭제
	@RequestMapping("/userCartDelete")
	public ModelAndView userCartDelete(String code, HttpSession ses) {
		UserInfoDaoImp dao = sqlSession.getMapper(UserInfoDaoImp.class);
		int result = dao.cartDelete((String)ses.getAttribute("userid"), code);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:userCart");
		return mav;
	}
	//장바구니 전체삭제
	@RequestMapping("/userCartDeleteAll")
	public ModelAndView userCartDeleteAll(HttpSession ses) {
		UserInfoDaoImp dao = sqlSession.getMapper(UserInfoDaoImp.class);
		int result = dao.cartDeleteAll((String)ses.getAttribute("userid"));
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:userCart");
		return mav;
	}
	/* 주문신청서 */
	@RequestMapping(value="/orderSheet", method=RequestMethod.POST)
	public ModelAndView orderSheet(OrderVOList orderVOList) {
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("orderVOList", orderVOList.getOrderVOList());

		mav.setViewName("mypage/orderSheet");
		return mav;
	}
	//주문완료
	@RequestMapping(value="/orderConfirmed", method=RequestMethod.POST)
	public ModelAndView orderConfirmed(@RequestBody Map<String, Object> params) {
		
		System.out.println(params.get("imp_uid"));
		System.out.println(params.get("merchant_uid"));
		ModelAndView mav = new ModelAndView();
		mav.setViewName("mypage/orderConfirmed");
		return mav;
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
