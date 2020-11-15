package com.bitcamp.gachi.creator;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CreatorController {
	@RequestMapping ("/creatorDashboard")
	public String creatorDashboard() {
		return "creator/creatorDashboard";
	}
}
