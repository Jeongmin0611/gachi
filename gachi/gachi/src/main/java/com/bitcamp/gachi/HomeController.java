package com.bitcamp.gachi;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bitcamp.gachi.admin.AllVO;
import com.bitcamp.gachi.classPage.ClassPageDaoImp;
import com.bitcamp.gachi.mypage.OrderListVO;
import com.bitcamp.gachi.mypage.UserInfoDaoImp;

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
	//@ResponseBody //ajax 매핑 메소드는 view 리턴이 안 됨
	public ModelAndView home(HttpSession ses, HttpServletRequest req) {
		ClassPageDaoImp dao = sqlsession.getMapper(ClassPageDaoImp.class);
		List<AllVO> plist = dao.homeClassPopular();
		List<AllVO> nlist = dao.homeClassNew();

		UserInfoDaoImp uDao = sqlsession.getMapper(UserInfoDaoImp.class);
		
		ModelAndView mav = new ModelAndView();
		if(ses.getAttribute("logStatus")!=null) {//로그인 상태
			String userid=(String)ses.getAttribute(""
					+ "userid");
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
			//좋아요 상품
			List<OrderListVO> ggoodList = uDao.goodsWishList(userid);
			mav.addObject("cgoodList", cgoodList);
			mav.addObject("ggoodList", ggoodList);	
		}		
		mav.addObject("plist", plist);
		mav.addObject("nlist", nlist);
		mav.setViewName("home");
		return mav;
	}
}
