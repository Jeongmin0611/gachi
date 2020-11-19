package com.bitcamp.gachi.creator;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CreatorController {
	@RequestMapping ("/creatorDashboard")
	public String creatorDashboard() {
		return "creator/creatorDashboard";
	}
	@RequestMapping ("/creatorStatClass")
	public String creatorStatClass() {
		return "creator/creatorStatClass";
	}
	@RequestMapping ("/creatorApproval")
	public String creatorApproval() {
		return "creator/creatorApproval";
	}
	@RequestMapping ("/creatorMyClass")
	public String creatorMyClass() {
		return "creator/creatorMyClass";
	}
	@RequestMapping ("/creatorMyClassWrite")
	public String creatorMyClassWrite() {
		return "creator/creatorMyClassWrite";
	}
	@RequestMapping("/creatorClassQuestion")
	public String creatorClassQuestion() {
		return "creator/creatorClassQuestion";
	}
	
	@RequestMapping ("/creatorGuide")
	public String creatorGuide() {
		return "creator/creatorGuide";
	}
	@RequestMapping("/creatorNotice")
	public String creatorNotice() {
		return "creator/creatorNotice";
	}	
	@RequestMapping("/creatorNoticeView")
	public String creatorNoticeView() {
		return "creator/creatorNoticeView";
	}	
	@RequestMapping("/creatorNoticeWrite")
	public String creatorNoticeWrite() {
		return "creator/creatorNoticeWrite";
	}	
	@RequestMapping("/creatorEdit")
	public String creatorEdit() {
		return "creator/creatorEdit";
	}
	
	@RequestMapping("/creatorSettle")
	public String creatorSettle() {
		return "creator/creatorSettle";
	}
	@RequestMapping("/creator1on1")
	public String creator1on1() {
		return "creator/creator1on1";
	}
	@RequestMapping("/creator1on1View")
	public String creator1on1View() {
		return "creator/creator1on1View";
	}
	@RequestMapping("/creator1on1Write")
	public String creator1on1Write() {
		return "creator/creator1on1Write";
	}
	@RequestMapping("/creatorVideo")
	public String creatorVideo(){
		return "creator/creatorVideo";
	}
	@RequestMapping("/creatorVideoRequest")
	public String creatorVideoEdit() {
		return "creator/creatorVideoRequest";
	} 
}
