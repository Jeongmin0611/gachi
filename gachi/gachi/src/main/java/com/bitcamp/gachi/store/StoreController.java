package com.bitcamp.gachi.store;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.mapping.ParameterMap;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.bitcamp.gachi.admin.AllVO;
import com.bitcamp.gachi.mypage.OrderListVO;
import com.bitcamp.gachi.mypage.UserInfoDaoImp;

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
	public ModelAndView storeList(HttpServletRequest req, HttpSession ses,StorePageVO vo) throws Exception{
		StoreDaoImp dao = sqlSession.getMapper(StoreDaoImp.class);
		ModelAndView mav = new ModelAndView();
		String nowPageTxt= req.getParameter("nowPage");
		if(nowPageTxt!=null) {//페이지 번호를 request한 경우
			vo.setNowPage(Integer.parseInt(nowPageTxt));
		}
		int totalRecord = dao.storeListAllRecordCount(vo);
		vo.setTotalRecord(totalRecord);
		
		String category=req.getParameter("category");
		String selectval=req.getParameter("selectval");
		
		
		String sql = sqlSession.getConfiguration().getMappedStatement("storeAllRecord").getBoundSql(vo).getSql();
		System.out.println("sql->"+sql);
		List<AllVO> list=dao.storeAllRecord(vo);		

		UserInfoDaoImp uDao = sqlSession.getMapper(UserInfoDaoImp.class);
		
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
			//좋아요 상품
			List<OrderListVO> ggoodList = uDao.goodsWishList(userid);
			mav.addObject("ggoodList", ggoodList);	
		}
		mav.addObject("list", list);
		mav.addObject("pvo", vo);
		mav.setViewName("store/storeList");
		return mav;
	}

	@RequestMapping("/storeView")
	public ModelAndView storeDetail(HttpServletRequest req, HttpSession ses) {
		StoreDaoImp dao = sqlSession.getMapper(StoreDaoImp.class);
		String code = req.getParameter("code");
		AllVO vo = dao.storeView(code);

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
			//좋아요 상품
			OrderListVO goodVo = uDao.wishOneRecord(userid, code);
			mav.addObject("goodVo", goodVo);	
		}
		mav.addObject("vo", vo);
		mav.setViewName("store/storeView");
		return mav;
	}
	@RequestMapping("/purchase")
	public String purchase() {
		return "store/purchase";
	}
}
