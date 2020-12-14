package com.bitcamp.gachi.creator;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bitcamp.gachi.admin.MemberDaoImp;
import com.bitcamp.gachi.admin.SettleDaoImp;
import com.bitcamp.gachi.admin.SettleVO;

@Controller
public class CreatorController {
	SqlSession sqlSession;
	
	public SqlSession getSqlSession() {
		return sqlSession;
	}
	
	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@RequestMapping ("/creatorDashboard")
	public ModelAndView creatorDashboard(HttpSession ses) {
		
		ModelAndView mav = new ModelAndView();
		String userid = (String)ses.getAttribute("userid");
		System.out.println("userid"+ userid);
		String startDate, endDate;
		SimpleDateFormat  yyyymmdd = new SimpleDateFormat("yyyy-MM-dd");
		String todate =  yyyymmdd.format(new Date());
		
		startDate = todate.substring(0, 8) + "01";
		endDate = todate;
		
		int monthArray[] = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
		
		List<String> dateArr = new ArrayList<String>();
		String tmp = startDate;
		while(true) {
			dateArr.add(tmp); // startDate
			System.out.println(tmp);
			if(tmp.equals(endDate)) break;
			
			int tmpDate = Integer.parseInt(tmp.substring(8,10)) + 1;
			
			if(tmpDate < 10) {
				tmp = tmp.substring(0,8) + "0" +tmpDate;
			} else {
				tmp = tmp.substring(0,8) + tmpDate;
			}
			
			int lastDay = monthArray[Integer.parseInt(tmp.substring(5, 7))-1];
			
			if(Integer.parseInt(tmp.substring(8, 10)) > lastDay) { // 1일 더했을 때, 그 달의 마지막 날짜보다 큰 값이 된다면,
				int tmpMonth = Integer.parseInt(tmp.substring(5, 7)) + 1; // 달을 바꿔줌.
				
				if(tmpMonth > 12) { // 년을 바꿔줌
					int tmpYear = Integer.parseInt(tmp.substring(0, 4))+1;
					tmp = tmpYear + "-01-01";
				} else {
					if(tmpMonth < 10) {
						tmp = tmp.substring(0, 4) + "-0" + tmpMonth + "-01";
					} else {
						tmp = tmp.substring(0, 4) + "-" + tmpMonth  + "-01";
					}
				}
			}
		}
		System.out.println("dateArr:" + dateArr);
		
		Map<String, Object> dbParam2 = new HashMap<String,Object>();
		dbParam2.put("list", dateArr);
		// sql 검색 값 셋팅
		Map<String, String> dbParam = new HashMap<String, String>();
		dbParam.put("startDate", startDate);
		dbParam.put("endDate", endDate);

		SettleDaoImp dao = sqlSession.getMapper(SettleDaoImp.class);
		List<Integer> result = dao.creatorPayment(dbParam2);
		System.out.println("result:" + result);
		dao = sqlSession.getMapper(SettleDaoImp.class);		
		
		Integer countWaitClass = dao.countWaitClass(dbParam);
		Integer totalPayment = dao.totalPayment(dbParam);
		Integer non_Payment = dao.non_Payment(dbParam);
		
		
		
		// label data 문자형으로 수정
		for(int i=0; i<dateArr.size(); i++) {
			dateArr.set(i, "\'" + dateArr.get(i) + "\'");
		}
		
		if(countWaitClass == null) countWaitClass = 0;
		if(totalPayment == null) totalPayment = 0;
		if(non_Payment == null) non_Payment = 0;

		
		mav.addObject("startDate", startDate);
		mav.addObject("endDate", endDate);
		mav.addObject("labelData", dateArr);
		mav.addObject("dashData", result);
		mav.addObject("countWaitClass", countWaitClass);
		mav.addObject("totalPayment", totalPayment);
		mav.addObject("non_Payment", non_Payment);
		
		mav.setViewName("admin/creatorDashboard");
		
		return mav;
	}

	@RequestMapping(value="/creatorDashboard", method=RequestMethod.POST)
	@ResponseBody
	public ModelAndView creatorDashboard(HttpSession ses,HttpServletRequest req, HttpServletResponse resp, @RequestParam(value="startDate", required=false) String startDate, @RequestParam String endDate) {
		ModelAndView mav = new ModelAndView();
		String userid = (String)ses.getAttribute("userid");
		if(startDate==null || endDate == null) {
			System.out.println("startMonth is null");
			
			SimpleDateFormat  yyyymmdd = new SimpleDateFormat("yyyy-MM-dd");
			String todate =  yyyymmdd.format(new Date());
			
			startDate = todate.substring(0, 8) + "01";
			endDate = todate;
		} 
		int monthArray[] = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
		
		List<String> dateArr = new ArrayList<String>();
		String tmp = startDate;
		while(true) {
			dateArr.add(tmp); // startDate
			System.out.println(tmp);
			if(tmp.equals(endDate)) break;
			
			int tmpDate = Integer.parseInt(tmp.substring(8,10)) + 1;
			
			if(tmpDate < 10) {
				tmp = tmp.substring(0,8) + "0" +tmpDate;
			} else {
				tmp = tmp.substring(0,8) + tmpDate;
			}
			
			int lastDay = monthArray[Integer.parseInt(tmp.substring(5, 7))-1];
			
			if(Integer.parseInt(tmp.substring(8, 10)) > lastDay) { // 1일 더했을 때, 그 달의 마지막 날짜보다 큰 값이 된다면,
				int tmpMonth = Integer.parseInt(tmp.substring(5, 7)) + 1; // 달을 바꿔줌.
				
				if(tmpMonth > 12) { // 년을 바꿔줌
					int tmpYear = Integer.parseInt(tmp.substring(0, 4))+1;
					tmp = tmpYear + "-01-01";
				} else {
					if(tmpMonth < 10) {
						tmp = tmp.substring(0, 4) + "-0" + tmpMonth + "-01";
					} else {
						tmp = tmp.substring(0, 4) + "-" + tmpMonth  + "-01";
					}
				}
			}
		}
		
		Map<String, Object> dbParam2 = new HashMap<String,Object>();
		dbParam2.put("list", dateArr);
		// sql 검색 값 셋팅
		Map<String, String> dbParam = new HashMap<String, String>();
		dbParam.put("startDate", startDate);
		dbParam.put("endDate", endDate);

		SettleDaoImp dao = sqlSession.getMapper(SettleDaoImp.class);
		List<Integer> result = dao.creatorPayment(dbParam2);
		dao = sqlSession.getMapper(SettleDaoImp.class);
		
		
		Integer countWaitClass = dao.countWaitClass(dbParam);
		Integer totalPayment = dao.totalPayment(dbParam);
		Integer non_Payment = dao.non_Payment(dbParam);
		
		
		// label data 문자형으로 수정
		for(int i=0; i<dateArr.size(); i++) {
			dateArr.set(i, "\'" + dateArr.get(i) + "\'");
		}
		
		if(countWaitClass == null) countWaitClass = 0;
		if(totalPayment == null) totalPayment = 0;
		if(non_Payment == null) non_Payment = 0;
				
		if(startDate != null && endDate != null) {
			
			mav.addObject("startDate", startDate);
			mav.addObject("endDate", endDate);
			mav.addObject("labelData", dateArr);
			mav.addObject("dashData", result);
			mav.addObject("countWaitClass", countWaitClass);
			mav.addObject("totalPayment", totalPayment);
			mav.addObject("non_Payment", non_Payment);
			

			System.out.println("ajax success");
			try {
				//resp.getWriter().write("{\"result\":\"success\"}");
				mav.setViewName("admin/creatorDashboard");
				return mav;
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else {
			System.out.println("ajax failed.");
			try{
				resp.getWriter().write("{\"result\":\"fail\"}");
			} catch (IOException e) {
	            e.printStackTrace();
	        }
		}

		return null;
		
	}
	
	
	@RequestMapping ("/creatorStatClass")
	public String creatorStatClass() {
		return "creator/creatorStatClass";
	}
	@RequestMapping ("/creatorApproval")
	public String creatorApproval() {
		return "creator/creatorApproval";
	}
	@RequestMapping ("/creatorMyClass")
	public String creatorMyClass() {
		return "creator/creatorMyClass";
	}
	@RequestMapping ("/creatorMyClassWrite")
	public String creatorMyClassWrite() {
		return "creator/creatorMyClassWrite";
	}
	@RequestMapping("/creatorClassQuestion")
	public String creatorClassQuestion() {
		return "creator/creatorClassQuestion";
	}
	
	@RequestMapping ("/creatorGuide")
	public String creatorGuide() {
		return "creator/creatorGuide";
	}
	@RequestMapping("/creatorNotice")
	public String creatorNotice() {
		return "creator/creatorNotice";
	}	
	@RequestMapping("/creatorNoticeView")
	public String creatorNoticeView() {
		return "creator/creatorNoticeView";
	}	
	@RequestMapping("/creatorNoticeWrite")
	public String creatorNoticeWrite() {
		return "creator/creatorNoticeWrite";
	}	
	@RequestMapping("/creatorEdit")
	public String creatorEdit() {
		return "creator/creatorEdit";
	}
	
	@RequestMapping("/creatorSettle")
	public String creatorSettle() {
		return "creator/creatorSettle";
	}
	@RequestMapping("/creator1on1")
	public String creator1on1() {
		return "creator/creator1on1";
	}
	@RequestMapping("/creator1on1View")
	public String creator1on1View() {
		return "creator/creator1on1View";
	}
	@RequestMapping("/creator1on1Write")
	public String creator1on1Write() {
		return "creator/creator1on1Write";
	}
	@RequestMapping("/creatorVideo")
	public String creatorVideo(){
		return "creator/creatorVideo";
	}
	@RequestMapping("/creatorVideoRequest")
	public String creatorVideoEdit() {
		return "creator/creatorVideoRequest";
	}
	@RequestMapping("/testdb")
	public ModelAndView testdb() {
		TestDaoImp dao=sqlSession.getMapper(TestDaoImp.class);
		List<TestVO> list=dao.selectMember();
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("list",list);
		mav.setViewName("creator/testdb");
		return mav;
	}
	@RequestMapping("/creatorVideoWrite")
	public String creatorVideoWrite() {
		return "creator/creatorVideoWrite";
	}
}
