package com.bitcamp.gachi.register;


import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class RegisterController {
	SqlSession sqlSession;
	
	@RequestMapping(value="/registerInsert",method=RequestMethod.POST)
	public ModelAndView registerInsert(RegisterVO vo) {
		
		RegisterDaoImp dao=sqlSession.getMapper(RegisterDaoImp.class);
		ModelAndView result=dao.registerInsert(vo);
		
		ModelAndView mav=new ModelAndView();
		mav.setViewName("redirect:home");
		return mav;
	}
}

