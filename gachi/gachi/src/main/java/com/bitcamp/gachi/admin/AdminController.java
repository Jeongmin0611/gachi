package com.bitcamp.gachi.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {
	@RequestMapping ("/adminDashboard")
	public String adminDashboard() {
		return "admin/adminDashboard";
	}
	@RequestMapping ("/admin1on1")
	public String admin1on1() {
		return "admin/admin1on1";
	}
}
