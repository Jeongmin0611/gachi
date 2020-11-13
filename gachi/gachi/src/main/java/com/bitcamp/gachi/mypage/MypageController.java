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
}
