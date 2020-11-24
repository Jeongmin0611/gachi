package com.bitcamp.gachi.mypage;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

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
	@RequestMapping("/mypage")
	public String Mypage() {
		return "mypage/mypageMain";
	}
	@RequestMapping("/userInfo")
	public String userInfo() {
		return "mypage/userInfo";
	}
	@RequestMapping("/userInfoEdit")
	public String userInfoEdit() {
		return "mypage/userInfoEdit";
	}
	@RequestMapping("/userInfoEditForm")
	public String userInfoEditForm() {
		return "mypage/userInfoEditForm";
	}
	@RequestMapping("/userLeave")
	public String userLeave() {
		return "mypage/userLeave";
	}
	@RequestMapping("/userLeaveChk")
	public String userLeaveChk() {
		return "mypage/userLeaveChk";
	}
	@RequestMapping("/userLeaveOk")
	public String userLeaveOk() {
		return "mypage/userLeaveOk";
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
	@RequestMapping("/userMileage")
	public ModelAndView userMileage() {
		MileageDaoImp dao = sqlSession.getMapper(MileageDaoImp.class);
		List<MileageVO> list = dao.mileageAllRecord();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list",list);
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
