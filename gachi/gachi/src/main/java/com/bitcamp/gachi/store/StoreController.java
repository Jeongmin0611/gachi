package com.bitcamp.gachi.store;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class StoreController {
	@RequestMapping("/storeMain")
	public String storeMain() {
		return "store/storeMain";
	}
	@RequestMapping("/storeDetail")
	public String storeDetail() {
		return "store/storeDetail";
	}
}
