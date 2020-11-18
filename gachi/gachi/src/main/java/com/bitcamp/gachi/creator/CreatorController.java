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
	@RequestMapping("/creatorSubnotice")
	public String creatorSubnotice() {
		return "creator/creatorSubnotice";
	}	
	@RequestMapping("/creatorEdit")
	public String creatorEdit() {
		return "creator/creatorEdit";
	}
}
