package com.bitcamp.gachi.classPage;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.bitcamp.gachi.admin.AllVO;
import com.bitcamp.gachi.mypage.OrderListVO;
import com.bitcamp.gachi.mypage.UserInfoDaoImp;

@Controller
public class ClassPageController {
	SqlSession sqlSession;	
	public SqlSession getSqlSession() {
		return sqlSession;
	}
	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@RequestMapping("/classView")
	public ModelAndView classMain(HttpServletRequest req, HttpSession ses) {
		ClassPageDaoImp dao = sqlSession.getMapper(ClassPageDaoImp.class);
		String code = req.getParameter("code");
		AllVO vo = dao.classView(code);
		
		UserInfoDaoImp uDao = sqlSession.getMapper(UserInfoDaoImp.class);
		
		ModelAndView mav = new ModelAndView();
		if(ses.getAttribute("logStatus")!=null) {//로그인 상태
			String userid=(String)ses.getAttribute("userid");
			if(req.getParameter("good_add")!=null) {//좋아요 추가
				String good = req.getParameter("good_add");
				uDao.wishListAdd(userid, good);			
			}
			if(req.getParameter("good_del")!=null) {//좋아요 삭제
				String good = req.getParameter("good_del");
				uDao.wishListDel(userid, good);			
			}
			//좋아요 클래스
			OrderListVO goodVo = uDao.wishOneRecord(userid, code);
			mav.addObject("goodVo", goodVo);	
		}
		
		mav.addObject("vo", vo);
		mav.setViewName("classPage/classView");
		return mav;
	}
	@RequestMapping("/classList")
	public ModelAndView classList(HttpServletRequest req, HttpSession ses) {
		ClassPageDaoImp dao = sqlSession.getMapper(ClassPageDaoImp.class);
		String category = req.getParameter("category");
		String selectval = req.getParameter("selectval");
		List<AllVO> list = dao.classPageAllRecord(category, selectval);
		
		UserInfoDaoImp uDao = sqlSession.getMapper(UserInfoDaoImp.class);
		
		ModelAndView mav = new ModelAndView();
		if(ses.getAttribute("logStatus")!=null) {//로그인 상태
			String userid=(String)ses.getAttribute("userid");
			if(req.getParameter("good_add")!=null) {//좋아요 추가
				String good = req.getParameter("good_add");
				uDao.wishListAdd(userid, good);			
			}
			if(req.getParameter("good_del")!=null) {//좋아요 삭제
				String good = req.getParameter("good_del");
				uDao.wishListDel(userid, good);			
			}
			//좋아요 클래스
			List<OrderListVO> cgoodList = uDao.classWishList(userid);
			mav.addObject("cgoodList", cgoodList);	
		}
		mav.addObject("list", list);
		mav.setViewName("classPage/classList");
		return mav;
	}

}
