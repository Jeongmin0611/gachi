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
import org.springframework.web.util.UrlPathHelper;

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
	@ResponseBody
	public ModelAndView home(HttpSession ses, HttpServletRequest req) {
		ClassPageDaoImp dao = sqlsession.getMapper(ClassPageDaoImp.class);
		//String sql1 = sqlsession.getConfiguration().getMappedStatement("homeClassPopular").getBoundSql("").getSql();
		//System.out.println("sql1->"+sql1);
		//String sql2 = sqlsession.getConfiguration().getMappedStatement("homeClassNew").getBoundSql("").getSql();
		//System.out.println("sql1->"+sql2);
		
		List<AllVO> plist = dao.homeClassPopular();
		List<AllVO> nlist = dao.homeClassNew();
		List<AllVO> rlist;
		UserInfoDaoImp uDao = sqlsession.getMapper(UserInfoDaoImp.class);
		
		ModelAndView mav = new ModelAndView();
		
		String msg="";//좋아요 업데이트시 추가, 취소 알게 해주는 문자
		if(ses.getAttribute("logStatus")!=null) {//로그인 한 상태
			String userid=(String)ses.getAttribute("userid");
			if(req.getParameter("good_add")!=null) {//좋아요 추가
				msg="add";

				String goodCode = req.getParameter("good_add");
				int result= uDao.wishListAdd(userid, goodCode);
				System.out.println("result: "+result);
				uDao.goodClassUpdate(goodCode, msg);
			}
			if(req.getParameter("good_del")!=null) {//좋아요 취소
				msg="del";
				String goodCode = req.getParameter("good_del");
				uDao.wishListDel(userid, goodCode);	
				uDao.goodClassUpdate(goodCode, msg);			
			}
			//좋아요 클
			List<OrderListVO> cgoodList = uDao.classWishList(userid);			
			//醫뗭븘�슂 �긽�뭹
			List<OrderListVO> ggoodList = uDao.goodsWishList(userid);
			mav.addObject("cgoodList", cgoodList);
			mav.addObject("ggoodList", ggoodList);	
			//관심사 찾기
			if(dao.homeClassInterestFind(userid)!=null) {//관심사가 null이 아닐 때				
			
			String interest = dao.homeClassInterestFind(userid);
			//관심사, 구분
			String[] interestArr = interest.replace(" ","").split(",");
			String interest1="";
			String interest2="";
			String interest3="";
			
			switch(interestArr.length) {
			case 1:
				interest1 = interestArr[0];
				break;
			case 2:
				interest1 = interestArr[0];
				interest2 = interestArr[1];
				break;
			case 3:
				interest1 = interestArr[0];
				interest2 = interestArr[1];
				interest3 = interestArr[2];
				break;
			}
			rlist = dao.homeClassRecommandUser(interest1, interest2, interest3);	
			}else {//관심사가 null일 때
				rlist= dao.homeClassRecommand();
			}
		}else {//로그인 안 한 상태
			rlist = dao.homeClassRecommand();
		}		
		mav.addObject("plist", plist);
		mav.addObject("nlist", nlist);
		mav.addObject("rlist", rlist);
		mav.setViewName("home");
		return mav;
	}
	
	@RequestMapping("/good_add")
	@ResponseBody
	public String good_add(HttpSession ses, HttpServletRequest req) {//클래스
		String userid=(String)ses.getAttribute("userid");
		String msg="add";

		UserInfoDaoImp uDao = sqlsession.getMapper(UserInfoDaoImp.class);
		String goodCode = req.getParameter("good_add");
		char div= goodCode.charAt(0);//코드 앞이 c면 클래스, g면 상품
		uDao.wishListAdd(userid, goodCode);	
		if(div=='c') {
			uDao.goodClassUpdate(goodCode, msg);			
		}else if(div=='g') {
			uDao.goodStoreUpdate(goodCode, msg);
		}
		//호출 url
		UrlPathHelper urlPathHelper = new UrlPathHelper();  //결과: org.springframework.web.util.UrlPathHelper@4d33386c
		String originalURL = urlPathHelper.getOriginatingRequestUri(req); //결과: /gachi/good_add
		System.out.println(" originalURL= "+ originalURL);
		
		return originalURL;
	}
	
	@RequestMapping("/good_del")
	@ResponseBody
	public String good_del(HttpSession ses, HttpServletRequest req) {
		String userid=(String)ses.getAttribute("userid");
		String msg="del";
		
		UserInfoDaoImp uDao = sqlsession.getMapper(UserInfoDaoImp.class);
		String goodCode = req.getParameter("good_del");
		char div= goodCode.charAt(0);//코드 앞이 c면 클래스, g면 상품
		uDao.wishListDel(userid, goodCode);	
		if(div=='c') {
			uDao.goodClassUpdate(goodCode, msg);
		}else if(div=='g') {
			uDao.goodStoreUpdate(goodCode, msg);
		}
		UrlPathHelper urlPathHelper = new UrlPathHelper();  //결과: org.springframework.web.util.UrlPathHelper@4d33386c
		String originalURL = urlPathHelper.getOriginatingRequestUri(req); //결과: /gachi/good_add
		System.out.println(" originalURL= "+ originalURL);
		
		return originalURL;
	}
}
