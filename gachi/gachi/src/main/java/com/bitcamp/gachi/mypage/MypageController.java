package com.bitcamp.gachi.mypage;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bitcamp.gachi.register.RegisterVO;
import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;

@Controller
public class MypageController {
	SqlSession sqlSession;
	
	public SqlSession getSqlSession() {
		return sqlSession;
	}
	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	/* *****마이페이지 메인-결제/주문내역확인****** */
	@RequestMapping("/mypage")
	public ModelAndView Mypage(HttpSession ses) {
		UserInfoDaoImp dao = sqlSession.getMapper(UserInfoDaoImp.class);
		String userid = (String)ses.getAttribute("userid");
		List<String> list = dao.orderList(userid);
		
		LinkedHashMap<String,List<OrderListVO>> map = new LinkedHashMap<String,List<OrderListVO>>();
		for(int i=0; i<list.size(); i++) {
			map.put(list.get(i)+"c", dao.classOrderView(list.get(i)));
			map.put(list.get(i)+"g", dao.goodsOrderView(list.get(i)));
		}
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.addObject("map", map);
		mav.setViewName("mypage/mypageMain");
		return mav;
	}
	/* 마이페이지 메인- 전체/클래스/상품 */
	@RequestMapping(value="/mypage", method=RequestMethod.POST)
	public ModelAndView Mypage(HttpSession ses, String option, String startDate, String endDate) {
		UserInfoDaoImp dao = sqlSession.getMapper(UserInfoDaoImp.class);
		String userid = (String)ses.getAttribute("userid");
		List<String> list = dao.orderListDate(userid, startDate, endDate);
		LinkedHashMap<String,List<OrderListVO>> map = null;
		if(option.equals("all")) {
			map  = new LinkedHashMap<String,List<OrderListVO>>();
			for(int i=0; i<list.size(); i++) {
				map.put(list.get(i)+"c", dao.classOrderView(list.get(i)));
				map.put(list.get(i)+"g", dao.goodsOrderView(list.get(i)));
			}
		}else if(option.equals("class")) {
			map  = new LinkedHashMap<String,List<OrderListVO>>();
			for(int i=0; i<list.size(); i++) {
				map.put(list.get(i)+"c", dao.classOrderView(list.get(i)));
			}
		}else if(option.equals("goods")) {
			map  = new LinkedHashMap<String,List<OrderListVO>>();
			for(int i=0; i<list.size(); i++) {
				map.put(list.get(i)+"g", dao.goodsOrderView(list.get(i)));
			}
		}
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.addObject("map", map);
		mav.addObject("option", option);
		mav.addObject("startDate", startDate);
		mav.addObject("endDate", endDate);
		mav.setViewName("mypage/mypageMain");
		return mav;
	}
	/* 구매확정 */
	@RequestMapping(value="/userOrderFix", method=RequestMethod.POST)
	public ModelAndView userOrderFix(String goods_order_code) {
		System.out.println(goods_order_code);
		UserInfoDaoImp dao = sqlSession.getMapper(UserInfoDaoImp.class);
		int result = dao.userOrderFix(goods_order_code);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("result", result);
		mav.setViewName("mypage/userOrderFix");
		return mav;
	}
	/* 회원정보확인 */
	@RequestMapping("/userInfoView")
	public ModelAndView userInfoView(HttpSession ses) {
		UserInfoDaoImp dao = sqlSession.getMapper(UserInfoDaoImp.class);
		MemberVO vo = dao.userInfoView((String)ses.getAttribute("userid"));
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("vo", vo);
		mav.setViewName("mypage/userInfoView");
		return mav;
	}
	/* 회원정보수정-비밀번호입력 */
	@RequestMapping("/userInfoEditChk")
	public ModelAndView userInfoEditChk(HttpSession ses) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("userid",(String)ses.getAttribute("userid"));
		mav.setViewName("mypage/userInfoEditChk");
		return mav;
	}
	/* 회원정보수정-비밀번호확인 */
	@RequestMapping(value="/userInfoEditOk", method=RequestMethod.POST)
	public ModelAndView userInfoEditOk(MemberVO vo, HttpSession ses) {
		UserInfoDaoImp dao = sqlSession.getMapper(UserInfoDaoImp.class);
		int result = dao.userInfoPwdChk(vo);
		
		ModelAndView mav = new ModelAndView();
		if(result==0) { //비밀번호 틀리면
			mav.setViewName("mypage/userInfoPwdResult");
		}else if(result==1) { //비밀번호 맞으면
			MemberVO resultVO = dao.userInfoView((String)ses.getAttribute("userid"));
			mav.addObject("vo", resultVO);
			mav.setViewName("mypage/userInfoEditForm");
		}
		return mav;
	}
	/* 회원정보수정-성공여부 */
	@RequestMapping(value="/userInfoEditFormOk", method=RequestMethod.POST)
	public ModelAndView userInfoEditFormOk(MemberVO vo, HttpSession ses) {
		UserInfoDaoImp dao = sqlSession.getMapper(UserInfoDaoImp.class);
		int result;
		if(vo.getUserpwd()==null || vo.getUserpwd()=="") {
			result = dao.userInfoEdit(vo);
		}else {
			result = dao.userInfoEditPwd(vo);
		}
		ModelAndView mav = new ModelAndView();
		if(result>0) { //업데이트 성공
			mav.setViewName("redirect:userInfoView");
		}else { //업데이트 실패
			mav.setViewName("mypage/userInfoEditResult");
		}
		return mav;
	}
	/* 회원탈퇴 */
	@RequestMapping("/userLeave")
	public ModelAndView userLeave(HttpSession ses) {
		UserInfoDaoImp dao = sqlSession.getMapper(UserInfoDaoImp.class);
		String userid = (String)ses.getAttribute("userid");
		String username = dao.userInfoView(userid).getUsername();
		int mileage = (Integer)ses.getAttribute("mileage");
		ModelAndView mav = new ModelAndView();
		mav.addObject("userid", userid);
		mav.addObject("username", username);
		mav.addObject("mileage", mileage);
		mav.setViewName("mypage/userLeave");
		return mav;
	}
	/* 회원탈퇴-비밀번호입력 */
	@RequestMapping("/userLeaveChk")
	public ModelAndView userLeaveChk(HttpSession ses) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("userid",(String)ses.getAttribute("userid"));
		mav.setViewName("mypage/userLeaveChk");
		return mav;
	}
	/* 회원탈퇴-비밀번호확인 */
	@RequestMapping(value="/userLeaveOk", method=RequestMethod.POST)
	public ModelAndView userLeaveOk(MemberVO vo, HttpSession ses) {
		UserInfoDaoImp dao = sqlSession.getMapper(UserInfoDaoImp.class);
		int result = dao.userInfoPwdChk(vo);
		
		ModelAndView mav = new ModelAndView();
		if(result==0) { //비밀번호 틀리면
			mav.setViewName("mypage/userInfoPwdResult");
		}else if(result==1) { //비밀번호 맞으면
			int LeaveResult = dao.userLeave(vo);
			if(LeaveResult>0) { //탈퇴 성공
				ses.invalidate();
				mav.setViewName("mypage/userLeaveConfirmed");
			}else { //탈퇴 실패
				mav.setViewName("mypage/userLeaveResult");
			}
		}
		return mav;
	}
	/* 회원탈퇴-성공 */
	@RequestMapping("/userLeaveConfirmed")
	public String userLeaveConfirmed() {
		return "mypage/userLeaveConfirmed";
	}
	/* 장바구니 */
	@RequestMapping("/userCart")
	public ModelAndView userCart(HttpSession ses) {
		UserInfoDaoImp dao = sqlSession.getMapper(UserInfoDaoImp.class);
		List<OrderListVO> cList = dao.classCartView((String)ses.getAttribute("userid"));
		List<OrderListVO> gList = dao.goodsCartView((String)ses.getAttribute("userid"));
		ModelAndView mav = new ModelAndView();

		mav.addObject("cList", cList);
		mav.addObject("gList", gList);	
		mav.setViewName("mypage/userCart");
		return mav;
	}
	/* 장바구니 삭제 */
	@RequestMapping("/userCartDelete")
	public ModelAndView userCartDelete(String code, HttpSession ses) {
		UserInfoDaoImp dao = sqlSession.getMapper(UserInfoDaoImp.class);
		int result = dao.cartDelete((String)ses.getAttribute("userid"), code);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:userCart");
		return mav;
	}
	/* 장바구니 전체삭제 */
	@RequestMapping("/userCartDeleteAll")
	public ModelAndView userCartDeleteAll(HttpSession ses) {
		UserInfoDaoImp dao = sqlSession.getMapper(UserInfoDaoImp.class);
		int result = dao.cartDeleteAll((String)ses.getAttribute("userid"));
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:userCart");
		return mav;
	}
	/* 주문신청서 */
	@RequestMapping(value="/orderSheet", method=RequestMethod.POST)
	public ModelAndView orderSheet(OrderListVO oVO, HttpSession ses) {
		UserInfoDaoImp dao = sqlSession.getMapper(UserInfoDaoImp.class);
		MemberVO vo = dao.userInfoView((String)ses.getAttribute("userid"));
		
		ModelAndView mav = new ModelAndView();
		
		List<OrderListVO> cList = new ArrayList();
		for(int i=0; i<oVO.getOrderClassCode().length; i++) {
			String code = oVO.getOrderClassCode()[i];
			cList.add(dao.classOrderList(code));
		}
		List<OrderListVO> gList = new ArrayList();
		for(int i=0; i<oVO.getOrderGoodsCode().length; i++) {
			String code = oVO.getOrderGoodsCode()[i];
			gList.add(dao.goodsOrderList(code));
		}
		mav.addObject("cList", cList);
		mav.addObject("gList", gList);
		mav.addObject("vo", vo);
		
		mav.setViewName("mypage/orderSheet");
		return mav;
	}
	/* 주문내역 넣기 */
	@RequestMapping(value="/orderChk", method=RequestMethod.POST)
	public @ResponseBody void orderChk(@RequestBody Map<String, String> order) {
		//System.out.println(order);
		
		UserInfoDaoImp dao = sqlSession.getMapper(UserInfoDaoImp.class);
		OrderVO vo = new OrderVO();
		vo.setOrder_code((String)order.get("order_code"));
		vo.setUserid((String)order.get("userid"));
		vo.setFull_price(Integer.parseInt(order.get("full_price")));
		vo.setShipping_fee(Integer.parseInt(order.get("shipping_fee")));
		vo.setDiscount(Integer.parseInt(order.get("discount")));
		vo.setPrice(Integer.parseInt(order.get("price")));
		vo.setPayment_type("html5_inicis");
		vo.setCard_type((String)order.get("card_type"));
		vo.setZipcode((String)order.get("zipcode"));
		vo.setAddr((String)order.get("addr"));
		vo.setDetailaddr((String)order.get("detailaddr"));
		vo.setEtc((String)order.get("etc"));
		int result = dao.orderInsert(vo);
	}
	/* 주문완료 페이지 */
	@RequestMapping(value="/orderConfirmed", method=RequestMethod.POST)
	public ModelAndView orderConfirmed(OrderListVO vo) {
		UserInfoDaoImp dao = sqlSession.getMapper(UserInfoDaoImp.class);
		//System.out.println(vo.getOrder_code());
		System.out.println(vo.getOrderClassCode()[0]);
		for(int i=0;i<vo.getOrderClassCode().length;i++) {
			vo.setCode(vo.getOrderClassCode()[i]);
			int result = dao.classOrderInsert(vo);
		}
		//System.out.println(vo.getOrderGoodsCode());
		for(int i=0;i<vo.getOrderGoodsCode().length;i++) {
			vo.setCode(vo.getOrderGoodsCode()[i]);
			int result = dao.goodsOrderInsert(vo);
		}
		ModelAndView mav = new ModelAndView();
		List<OrderVO> list = dao.orderView(vo.getOrder_code());
		mav.addObject("vo", list.get(0));
		mav.setViewName("mypage/orderConfirmed");
		return mav;
	}
	/* 내학습표(클래스 목록) */
	@RequestMapping("/myclassList")
	public ModelAndView myclassList(HttpSession ses) {
		UserInfoDaoImp dao = sqlSession.getMapper(UserInfoDaoImp.class);
		List<OrderListVO> list = dao.myclassList((String)ses.getAttribute("userid"));
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("mypage/myclassList");
		return mav;
	}
	/* 내학습표(클래스 상세 페이지) */
	@RequestMapping("/myclassView")
	public ModelAndView myclassView(String code, HttpSession ses) {
		UserInfoDaoImp dao = sqlSession.getMapper(UserInfoDaoImp.class);
		OrderListVO vo = dao.myclassView((String)ses.getAttribute("userid"), code);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("vo", vo);
		mav.setViewName("mypage/myclassView");
		return mav;
	}
	@RequestMapping("/myclassVideo")
	public String myclassVideo() {
		return "myclass/myclassVideo";
	}
	/* 마일리지 */
	@RequestMapping("/userMileage")
	public ModelAndView userMileage(HttpSession ses) {
		MileageDaoImp dao = sqlSession.getMapper(MileageDaoImp.class);
		String userid = (String)ses.getAttribute("userid");
		List<MileageVO> list = dao.mileageAllRecord(userid);
		
		int mileageAllSum = dao.mileageAllSum(userid);
		int mileagePosiSum = dao.mileagePosiSum(userid);
		int mileageNegaSum = dao.mileageNegaSum(userid);
		
		ses.setAttribute("mileage", mileageAllSum);
		ModelAndView mav = new ModelAndView();
		mav.addObject("list",list);
		mav.addObject("mileageAllSum", mileageAllSum);
		mav.addObject("mileagePosiSum", mileagePosiSum);
		mav.addObject("mileageNegaSum",mileageNegaSum);
		mav.setViewName("mypage/userMileage");
		return mav;
	}
	/* 좋아요 */
	@RequestMapping("/userWishList")
	public ModelAndView userWishList(HttpSession ses) {
		UserInfoDaoImp dao = sqlSession.getMapper(UserInfoDaoImp.class);
		List<OrderListVO> cList = dao.classWishList((String)ses.getAttribute("userid"));
		List<OrderListVO> gList = dao.goodsWishList((String)ses.getAttribute("userid"));
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("cList", cList);
		mav.addObject("gList", gList);
		mav.setViewName("mypage/userWishList");
		return mav;
	}
	/* 내 학습표 - 질문/답변 */
	@RequestMapping("/myclassQna")
	public String myclassQna() {
		return "mypage/myclassQna";
	}
	/* 내 학습표- 수강평 */
	@RequestMapping("/myclassReview")
	public String myclassReview() {
		return "mypage/myclassReview";
	}
	/* 상품문의 */
	@RequestMapping("/mypageStoreQna")
	public String mypageStoreQna() {
		return "mypage/mypageStoreQna";
	}
	/* 상품리뷰 */
	@RequestMapping("/mypageStoreReview")
	public String mypageStoreReview() {
		return "mypage/mypageStoreReview";
	}
	/* 1대1문의 */
	@RequestMapping("/mypage1on1")
	public String mypage1on1() {
		return "mypage/mypage1on1";
	}
	/* 이벤트 댓글 */
	@RequestMapping("/mypageEvent")
	public String mypageEvent() {
		return "mypage/mypageEvent";
	}
}
