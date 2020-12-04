package com.bitcamp.gachi.store;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.bitcamp.gachi.admin.AllVO;

@Controller
public class StoreController {
	SqlSession sqlSession;
	
	public SqlSession getSqlSession() {
		return sqlSession;
	}
	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@RequestMapping("/storeList")
	public ModelAndView storeList(HttpServletRequest req) throws Exception{
		StoreDaoImp dao = sqlSession.getMapper(StoreDaoImp.class);
		String category=req.getParameter("category");
		String selectval=req.getParameter("selectval");
		
		List<AllVO> list=dao.storeAllRecord(category,selectval);		
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("store/storeList");
		return mav;
	}
	@RequestMapping("/storeView")
	public ModelAndView storeDetail(HttpServletRequest req) {
		StoreDaoImp dao = sqlSession.getMapper(StoreDaoImp.class);
		String code = req.getParameter("code");
		AllVO vo = dao.storeView(code);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("vo", vo);
		mav.setViewName("store/storeView");
		return mav;
	}
	@RequestMapping("/purchase")
	public String purchase() {
		return "store/purchase";
	}
}
