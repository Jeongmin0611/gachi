package com.bitcamp.gachi.store;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class StoreController {
	@RequestMapping("/storeMain")
	public String storeMain() {
		return "store/storeMain";
	}
	@RequestMapping("/storePage1")
	public String storePage1() {
		return "store/storePage1";
	}
	@RequestMapping("/storePage2")
	public String storePage2() {
		return "store/storePage2";
	}
	@RequestMapping("/storePage3")
	public String storePage3() {
		return "store/storePage3";
	}
}
