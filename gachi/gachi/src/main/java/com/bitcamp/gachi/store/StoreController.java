package com.bitcamp.gachi.store;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bitcamp.gachi.admin.AllVO;

import com.bitcamp.gachi.admin.ClassDaoImp;
import com.bitcamp.gachi.admin.PagingVO;

import com.bitcamp.gachi.admin.QnaVO;
import com.bitcamp.gachi.classPage.ClassPageDaoImp;
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
		
		String category=req.getParameter("category");

		String selectval=req.getParameter("selectval");
		//현재 페이지
		String nowPageTxt= req.getParameter("nowPage");
		if(nowPageTxt!=null) {//페이지 번호를 request한 경우
			vo.setNowPage(Integer.parseInt(nowPageTxt));
			}
		if(category==null) {
			int totalRecord = dao.storeListAllRecordCount(vo);
				vo.setTotalRecord(totalRecord);

			}
		if(category!=null) {
			int totalRecord = dao.storeListCategoryRecordCount(vo);
				vo.setTotalRecord(totalRecord);
			}
		System.out.println("2121="+vo.getWritedate());
		List<AllVO> list=dao.storeAllRecord(vo);
		System.out.println("1212="+list);

		UserInfoDaoImp uDao = sqlSession.getMapper(UserInfoDaoImp.class);
		
		String msg="";//좋아요 업데이트시 취소, 선택 알게 해주는 문자
		if(ses.getAttribute("logStatus")!=null) {//로그인 상태
			String userid=(String)ses.getAttribute("userid");
			if(req.getParameter("good_add")!=null) {//좋아요 추가
				msg="add";
				String goodCode = req.getParameter("good_add");
				uDao.wishListAdd(userid, goodCode);
				uDao.goodStoreUpdate(goodCode, msg);		
			}
			if(req.getParameter("good_del")!=null) {//좋아요 삭제
				msg="del";
				String goodCode = req.getParameter("good_del");
				uDao.wishListDel(userid, goodCode);	
				uDao.goodStoreUpdate(goodCode, msg);		
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
		ClassPageDaoImp cdao = sqlSession.getMapper(ClassPageDaoImp.class);
		List<AllVO> reviewList = dao.reviewList(code);
		List<QnaVO> qnaList = cdao.qnaList(code);
		UserInfoDaoImp uDao = sqlSession.getMapper(UserInfoDaoImp.class);
		
		//스토어 bxslide이미지 , 구분
		String[] bxImg= {};
		if(vo.getGoods_img2()!=null) {
			String store_img2 = vo.getGoods_img2();
			System.out.println("store_img2: "+store_img2);
			if(store_img2!=null) {
				bxImg = store_img2.replace(" ","").split(",");
				System.out.println("배열길이: "+bxImg.length);
			}
		}
		ModelAndView mav = new ModelAndView();
		
		int orderCheck=0;
		String msg="";
		if(ses.getAttribute("logStatus")!=null) {//로그인 상태
			String userid=(String)ses.getAttribute("userid");
			if(req.getParameter("good_add")!=null) {//좋아요 추가
				msg="add";
				String goodCode = req.getParameter("good_add");
				uDao.wishListAdd(userid, goodCode);
				uDao.goodStoreUpdate(goodCode, msg);		
			}
			if(req.getParameter("good_del")!=null) {//좋아요 삭제
				msg="del";
				String goodCode = req.getParameter("good_del");
				uDao.wishListDel(userid, goodCode);	
				uDao.goodStoreUpdate(goodCode, msg);		
			}	
			//좋아요 상품
			OrderListVO goodVo = uDao.wishOneRecord(userid, code);
			mav.addObject("goodVo", goodVo);	
			
			//구매여부 확인. 결과값이 1인 경우 구매한 상품
			orderCheck = dao.orderCheck(code, userid);
		}
		mav.addObject("orderCheck", orderCheck);
		mav.addObject("bxImg", bxImg);
		mav.addObject("reviewList", reviewList);
		mav.addObject("qnaList", qnaList);
		mav.addObject("vo", vo);
		mav.setViewName("store/storeView");
		return mav;
	}
	@RequestMapping("/purchase")
	public String purchase() {
		return "store/purchase";
	}
	//스토어 수강평 작성
	@RequestMapping(value="/storeReviewFormOk", method=RequestMethod.POST)
	public String qnaFormOk(AllVO vo, HttpSession ses, HttpServletRequest req, PagingVO pvo) {
		vo.setIp(req.getRemoteAddr());
		vo.setUserid((String) ses.getAttribute("userid"));
		vo.setSubject(req.getParameter("subject"));
		vo.setContent(req.getParameter("content"));
		vo.setGrade(req.getParameter("grade"));

		String code = req.getParameter("code");
		vo.setCode(code);
		System.out.println("code= "+code);
		StoreDaoImp dao = sqlSession.getMapper(StoreDaoImp.class);
		dao.insertReview(vo);
//			return "redirect:classView?code="+code+"&nowPage="+pvo.getNowPage();
		return "redirect:classView";
	}
	//스토어 수강평 수정
	@RequestMapping(value="/storeReviewUpdateFormOk", method=RequestMethod.POST)
	@ResponseBody
	public void reviewUpdateFormOk(AllVO vo, HttpSession ses, HttpServletRequest req, PagingVO pvo) {
		String userid = (String)ses.getAttribute("userid");
		vo.setUserid(userid);
		vo.setSubject(req.getParameter("subject"));
		vo.setContent(req.getParameter("content"));
		vo.setGrade(req.getParameter("grade"));
		vo.setNum(Integer.parseInt(req.getParameter("num")));

		StoreDaoImp dao = sqlSession.getMapper(StoreDaoImp.class);
		dao.updateReview(vo);
	}
}
