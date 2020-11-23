package com.bitcamp.gachi.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.annotation.RequestScope;

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
	@RequestMapping("/adminCreatorView")
	public String adminCreatorView() {
		return "admin/adminCreatorView";
	}
	@RequestMapping("/adminClass")
	public String adminClass() {
		return "admin/adminClass";
	}
	@RequestMapping("/adminClassView")
	public String adminClassView() {
		return "admin/adminClassView";
	}
	@RequestMapping("/adminMember")
	public String adminMember() {
		return "admin/adminMember";
	}
	@RequestMapping("/adminMemberView")
	public String adminMemberView() {
		return "admin/adminMemberView";
	}
	@RequestMapping("/adminMemberEdit")
	public String adminMemberEdit() {
		return "admin/adminMemberEdit";
	}
	@RequestMapping("/adminNotice")
	public String adminNotice() {
		return "admin/adminNotice";
	}
	
	@RequestMapping("/adminNoticeView")
	public String adminNoticeView() {
		return "admin/adminNoticeView";
	}
	@RequestMapping("/adminNoticeWrite")
	public String adminNoticeWrite() {
		return "admin/adminNoticeWrite";
	}
	@RequestMapping("/adminEvent")
	public String adminEvent() {
		return "admin/adminEvent";
	}
	@RequestMapping("/adminEventView")
	public String adminEventView() {
		return "admin/adminEventView";
	}
	@RequestMapping("/adminEventWrite")
	public String adminEventWrite() {
		return "admin/adminEventWrite";
	}
	@RequestMapping("/admin1on1")
	public String admin1on1() {
		return "admin/admin1on1";
	}
	@RequestMapping("/admin1on1View")
	public String admin1on1View() {
		return "admin/admin1on1View";
	}
	@RequestMapping("/admin1on1Write")
	public String admin1on1Write() {
		return "admin/admin1on1Write";
	}
	@RequestMapping("/adminOrder")
	public String adminOrder() {
		return "admin/adminOrder";
	}
	@RequestMapping("/adminOrderView")
	public String adminOrderView() {
		return "admin/adminOrderView";
	}
	@RequestMapping("/adminStore")
	public String adminStore() {
		return "admin/adminStore";
	}
	@RequestMapping("/adminDelivery")
	public String adminDelivery() {
		return "admin/adminDelivery";
	}
	@RequestMapping("/adminGoods")
	public String adminGoodsList() {
		return "admin/adminGoods";
	}
	@RequestMapping("/adminGoodsView")
	public String adminGoodsView() {
		return "admin/adminGoodsView";
	}
	@RequestMapping("/adminGoodsEdit")
	public String adminGoodsEdit() {
		return "admin/adminGoodsEdit";
	}
	@RequestMapping("/adminGoodsWrite")
	public String adminGoodsEnroll() {
		return "admin/adminGoodsWrite";
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
	@RequestMapping("/adminReturn")
	public String adminReturn() {
		return "admin/adminReturn";
	}

}
