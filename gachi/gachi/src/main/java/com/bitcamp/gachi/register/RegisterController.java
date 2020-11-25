package com.bitcamp.gachi.register;


import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


	@Controller
	public class RegisterController {
		SqlSession sqlSession;
		
		public SqlSession getSqlSession() {
			return sqlSession;
		}
		@Autowired
		public void setSqlSession(SqlSession sqlSession) {
			this.sqlSession = sqlSession;
		}
		@RequestMapping(value="/registerInsert",method=RequestMethod.POST)
		public ModelAndView registerInsert(RegisterVO vo) {
			System.out.println();
			RegisterDaoImp dao=sqlSession.getMapper(RegisterDaoImp.class);
			int result=dao.registerInsert(vo);
		
			ModelAndView mav=new ModelAndView();
			mav.setViewName("redirect:home");
			return mav;
	}
		@RequestMapping(value="/memberLogin",method=RequestMethod.POST)
		public ModelAndView login1(RegisterVO vo,HttpSession ses) {
			System.out.println(vo.getUserid());
			RegisterDaoImp dao=sqlSession.getMapper(RegisterDaoImp.class);
			RegisterVO resultVO=dao.memberLogin(vo);
			ModelAndView mav=new ModelAndView();
			if(resultVO==null) {
				System.out.println("로그인실패");
				mav.setViewName("redirect:/");
			}else{
				System.out.println("로그인성공");
				ses.setAttribute("userid", resultVO.getUserid());
				ses.setAttribute("nickname", resultVO.getNickname());
				ses.setAttribute("logStatus","Y");
				ses.setAttribute("userSort","U");
				mav.setViewName("redirect:/");
				
			}
			return mav;
		}
		@RequestMapping(value="/creatorLogin",method=RequestMethod.POST)
		public ModelAndView login2(RegisterVO vo,HttpSession ses) {

			RegisterDaoImp dao=sqlSession.getMapper(RegisterDaoImp.class);
			RegisterVO resultVO=dao.creatorLogin(vo);
			ModelAndView mav=new ModelAndView();
			if(resultVO==null) {
				mav.setViewName("redirect:/");
			}else {
				ses.setAttribute("userid", resultVO.getUserid());
				ses.setAttribute("nickname", resultVO.getNickname());
				ses.setAttribute("logStatus","Y");
				ses.setAttribute("userSort","C");
				mav.setViewName("redirect:/");
			}
			return mav;
		}
		@RequestMapping(value="/adminLogin",method=RequestMethod.POST)
		public ModelAndView login3(RegisterVO vo,HttpSession ses) {
			
			RegisterDaoImp dao=sqlSession.getMapper(RegisterDaoImp.class);
			RegisterVO resultVO=dao.adminLogin(vo);
			ModelAndView mav=new ModelAndView();
			System.out.println(vo.getUserid3());
			System.out.println(resultVO);
			if(resultVO==null) {
				System.out.println("관리자로그인실패");
				mav.setViewName("redirect:/");
			}else {
				System.out.println("관리자로그인성공");
				ses.setAttribute("userid", resultVO.getUserid());
				ses.setAttribute("nickname", resultVO.getNickname());
				ses.setAttribute("logStatus","Y");
				ses.setAttribute("userSort","A");
				mav.setViewName("redirect:/");
			}
			return mav;
			
		}
		@RequestMapping("/logout")
		public String logout(HttpSession s) {
			s.invalidate();
			return "home";
		}
}

