package com.bitcamp.gachi.store;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class StoreController {
	@RequestMapping("/storeList")
	public String storeList() {
		return "store/storeList";
	}
	@RequestMapping("/storeView")
	public String storeDetail() {
		return "store/storeView";
	}
	@RequestMapping("/purchase")
	public String purchase() {
		return "store/purchase";
	}
}
