package com.bitcamp.gachi.classPage;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ClassPageController {
	
	@RequestMapping("/classPage")
	public String class1go() {
		return "classPage/classPage1";
	}
	@RequestMapping("/classPage2")
	public String class2go() {
		return "classPage/classPage2";
	}
	@RequestMapping("/classPage3")
	public String class3go() {
		return "classPage/classPage3";
	}
	@RequestMapping("/classMain")
	public String classMain() {
		return "classPage/classMain";
	}
	@RequestMapping("/oneClassPage")
	public String oneclasspage() {
		return "classPage/oneClassPage";
	}

}
