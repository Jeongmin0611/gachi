package com.bitcamp.gachi.mypage;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MypageController {
	@RequestMapping("/mypage")
	public String Mypage() {
		return "mypage/mypageMain";
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
	@RequestMapping("/cart")
	public String cart() {
		return "mypage/cart";
	}
	@RequestMapping("/orderSheet")
	public String orderSheet() {
		return "mypage/orderSheet";
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
}
