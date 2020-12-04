package com.bitcamp.gachi;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.bitcamp.gachi.admin.AllVO;
import com.bitcamp.gachi.classPage.ClassPageDaoImp;

@Controller
public class HomeController {
	public JdbcTemplate template;
	SqlSession sqlsession;
	public JdbcTemplate getTemplate() {
		return template;
	}

	@Autowired
	public void setTemplate(JdbcTemplate template) {
		this.template = template;
		Constants.template = template;
	}

	public SqlSession getSqlsession() {
		return sqlsession;
	}
	@Autowired
	public void setSqlsession(SqlSession sqlsession) {
		this.sqlsession = sqlsession;
	}

	////////////////////////////////////////////////
	@RequestMapping("/")
	public ModelAndView home() {
		ClassPageDaoImp dao = sqlsession.getMapper(ClassPageDaoImp.class);
		List<AllVO> plist = dao.homeClassPopular();
		List<AllVO> nlist = dao.homeClassNew();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("plist", plist);
		mav.addObject("nlist", nlist);
		mav.setViewName("home");
		return mav;
	}
}
