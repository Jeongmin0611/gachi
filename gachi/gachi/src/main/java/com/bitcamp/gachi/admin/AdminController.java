package com.bitcamp.gachi.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {
	@RequestMapping ("/adminDashboard")
	public String adminDashboard() {
		return "admin/adminDashboard";
	}
	@RequestMapping("/adminCreator")
	public String adminCreator() {
		return "admin/adminCreator";
	}
	@RequestMapping("/adminClass")
	public String adminClass() {
		return "admin/adminClass";
	}
	@RequestMapping("/adminMember")
	public String adminMember() {
		return "admin/adminMember";
	}
	@RequestMapping("/adminNotice")
	public String adminNotice() {
		return "admin/adminNotice";
	}
	@RequestMapping("/adminNoticeWrite")
	public String adminNoticeWrite() {
		return "admin/adminNoticeWrite";
	}
	@RequestMapping("/adminEvent")
	public String adminEvent() {
		return "admin/adminEvent";
	}
	@RequestMapping("/admin1on1")
	public String admin1on1() {
		return "admin/admin1on1";
	}
	@RequestMapping("/adminOrder")
	public String adminOrder() {
		return "admin/adminOrder";
	}
	@RequestMapping("/adminStore")
	public String adminStore() {
		return "admin/adminStore";
	}
	@RequestMapping("/adminDelivery")
	public String adminDelivery() {
		return "admin/adminDelivery";
	}
	@RequestMapping("/adminGoodsList")
	public String adminGoodsList() {
		return "admin/adminGoodsList";
	}
	@RequestMapping("/adminGoodsEnroll")
	public String adminGoodsEnroll() {
		return "admin/adminGoodsEnroll";
	}
	@RequestMapping("/adminStatStore")
	public String adminStatStore() {
		return "admin/adminStatStore";
	}
	@RequestMapping("/adminStatClass")
	public String adminStatClass() {
		return "admin/adminStatClass";
	}
	@RequestMapping("/adminStatCreator")
	public String adminStatCreator() {
		return "admin/adminStatCreator";
	}
	@RequestMapping("/adminStatMember")
	public String adminStatMember() {
		return "admin/adminStatMember";
	}
	@RequestMapping("/adminSettle")
	public String adminSettle() {
		return "admin/adminSettle";
	}

}
