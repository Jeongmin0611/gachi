package com.bitcamp.gachi;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
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
	//@ResponseBody //ajax 留ㅽ븨 硫붿냼�뱶�뒗 view 由ы꽩�씠 �븞 �맖
	public ModelAndView home(HttpSession ses, HttpServletRequest req) {
		ClassPageDaoImp dao = sqlsession.getMapper(ClassPageDaoImp.class);
		List<AllVO> plist = dao.homeClassPopular();
		List<AllVO> nlist = dao.homeClassNew();

		UserInfoDaoImp uDao = sqlsession.getMapper(UserInfoDaoImp.class);
		
		ModelAndView mav = new ModelAndView();

		if(ses.getAttribute("logStatus")!=null) {//濡쒓렇�씤 �긽�깭
			String userid=(String)ses.getAttribute("userid");
			if(req.getParameter("good_add")!=null) {//醫뗭븘�슂 異붽�

				String good = req.getParameter("good_add");
				uDao.wishListAdd(userid, good);			
			}
			if(req.getParameter("good_del")!=null) {//醫뗭븘�슂 �궘�젣
				String good = req.getParameter("good_del");
				uDao.wishListDel(userid, good);			
			}
			//醫뗭븘�슂 �겢�옒�뒪
			List<OrderListVO> cgoodList = uDao.classWishList(userid);			
			//醫뗭븘�슂 �긽�뭹
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
