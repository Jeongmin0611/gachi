package com.bitcamp.gachi.creator;

import java.io.File;
import java.io.IOException;
import java.text.DecimalFormat;
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

import com.bitcamp.gachi.admin.AllVO;
import com.bitcamp.gachi.admin.ClassDaoImp;
import com.bitcamp.gachi.admin.ClassVO;
import com.bitcamp.gachi.admin.ClassVideoVO;
import com.bitcamp.gachi.admin.CreatorDaoImp;
import com.bitcamp.gachi.admin.MemberDaoImp;
import com.bitcamp.gachi.admin.MemberVO;
import com.bitcamp.gachi.admin.QnaVO;
import com.bitcamp.gachi.admin.SettleDaoImp;
import com.bitcamp.gachi.admin.SettleVO;
import com.bitcamp.gachi.mypage.UserInfoDaoImp;

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
		System.out.println("method: GET");
		
		ModelAndView mav = new ModelAndView();
		String userid = (String)ses.getAttribute("userid"); // login creator userid
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
//		System.out.println("dateArr:" + dateArr);
		
		Map<String, Object> dbParam2 = new HashMap<String,Object>();
		dbParam2.put("userid", userid);
		dbParam2.put("startDate", startDate);
		dbParam2.put("endDate", endDate);
		// sql 검색 값 셋팅
		Map<String, Object> dbParam = new HashMap<String, Object>();
		dbParam.put("userid", userid);
		dbParam.put("list", dateArr);
		
		SettleDaoImp dao = sqlSession.getMapper(SettleDaoImp.class);
//		System.out.println("result:" + result);
		dao = sqlSession.getMapper(SettleDaoImp.class);		
		
		Integer countWaitClass = dao.countWaitClass(userid);
		System.out.println(countWaitClass);
		Integer totalPayment = dao.totalPayment(dbParam2);
		Integer non_Payment = dao.non_Payment(userid);
		List<Integer> result = dao.creatorPayment(dbParam);
		
		// label data 문자형으로 수정
		for(int i=0; i<dateArr.size(); i++) {
			dateArr.set(i, "\'" + dateArr.get(i) + "\'");
		}
		
		if(countWaitClass == null) countWaitClass = 0;
//		if(result == null) result = 0;
		if(non_Payment == null) non_Payment = 0;

		
		mav.addObject("startDate", startDate);
		mav.addObject("endDate", endDate);
		mav.addObject("labelData", dateArr);
		mav.addObject("countWaitClass", countWaitClass);
		mav.addObject("totalPayment", totalPayment);
		mav.addObject("dashData", result);
		mav.addObject("non_Payment", non_Payment);
		
		mav.setViewName("creator/creatorDashboard");
		
		return mav;
	}

	@RequestMapping(value="/creatorDashboard", method=RequestMethod.POST)
	@ResponseBody
	public ModelAndView creatorDashboard(HttpSession ses,HttpServletRequest req, HttpServletResponse resp, @RequestParam(value="startDate", required=false) String startDate, @RequestParam String endDate) {
		System.out.println("method: POST");
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
		dbParam2.put("userid", userid);
		dbParam2.put("startDate", startDate);
		dbParam2.put("endDate", endDate);
		// sql 검색 값 셋팅
		Map<String, Object> dbParam = new HashMap<String, Object>();
		dbParam.put("userid", userid);
		dbParam.put("list", dateArr);
		
		SettleDaoImp dao = sqlSession.getMapper(SettleDaoImp.class);
//		System.out.println("result:" + result);
		dao = sqlSession.getMapper(SettleDaoImp.class);		
		
		Integer countWaitClass = dao.countWaitClass(userid);
		System.out.println(countWaitClass);
		Integer totalPayment = dao.totalPayment(dbParam2);
		Integer non_Payment = dao.non_Payment(userid);
		List<Integer> result = dao.creatorPayment(dbParam);
		
		// label data 문자형으로 수정
		for(int i=0; i<dateArr.size(); i++) {
			dateArr.set(i, "\'" + dateArr.get(i) + "\'");
		}
		
		
		if(countWaitClass == null) countWaitClass = 0;
//		if(totalPayment == null) totalPayment = 0;
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
				mav.setViewName("creator/creatorDashboard");
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
	public ModelAndView creatorStatClass(HttpSession ses) {

		ModelAndView mav = new ModelAndView();
		String userid = (String)ses.getAttribute("userid"); // login creator userid
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
//		System.out.println("dateArr:" + dateArr);
		
		Map<String, Object> dbParam2 = new HashMap<String,Object>();
		dbParam2.put("userid", userid);
		dbParam2.put("startDate", startDate);
		dbParam2.put("endDate", endDate);
		// sql 검색 값 셋팅
		Map<String, Object> dbParam = new HashMap<String, Object>();
		dbParam.put("userid", userid);
		dbParam.put("list", dateArr);
		
		SettleDaoImp dao = sqlSession.getMapper(SettleDaoImp.class);
//		System.out.println("result:" + result);
		dao = sqlSession.getMapper(SettleDaoImp.class);		
		List<Integer> result = dao.classTotalMember(dbParam);
		
		dao = sqlSession.getMapper(SettleDaoImp.class);
		List<Map<String, Integer>> genderResult = dao.StatClassForGender(dbParam2);
		
		// chart3 data
		dao = sqlSession.getMapper(SettleDaoImp.class);
		List<Map<String, Integer>> ageResult = dao.StatClassForAge(dbParam2);
		

		// ChartJs 전송 데이터
		List<String> genderPieLbl = new ArrayList<String>();
		List<String> genderPieData = new ArrayList<String>();
		
		List<String> agePieLbl = new ArrayList<String>();
		List<String> agePieData = new ArrayList<String>();
		
		
		for(int i=0; i< genderResult.size(); i++) {
			genderPieLbl.add("\'" + genderResult.get(i).get("GENDER_GB") + "\'");
			genderPieData.add(String.valueOf(genderResult.get(i).get("CNT")));
		}
		for(int i=0; i< ageResult.size(); i++) {
			agePieData.add(String.valueOf(ageResult.get(i).get("CNT")));
			agePieLbl.add("\'" + ageResult.get(i).get("AGE_GB") + "\'");
		}
		
		
		// label data 문자형으로 수정
		for(int i=0; i<dateArr.size(); i++) {
			dateArr.set(i, "\'" + dateArr.get(i) + "\'");
		}

		mav.addObject("startDate", startDate);
		mav.addObject("endDate", endDate);
		mav.addObject("labelData", dateArr);
		mav.addObject("dashData", result);
		mav.addObject("genderLabel", genderPieLbl);
		mav.addObject("genderData", genderPieData);
		mav.addObject("ageLabel", agePieLbl);
		mav.addObject("ageData", agePieData);
		
		mav.setViewName("creator/creatorStatClass");
		
		return mav;
	}

	@RequestMapping(value="/creatorStatClass", method=RequestMethod.POST)
	@ResponseBody
	public ModelAndView creatorStatClass(HttpSession ses,HttpServletRequest req, HttpServletResponse resp, @RequestParam(value="startDate", required=false) String startDate, @RequestParam String endDate) {
		System.out.println("method: POST");
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
		dbParam2.put("userid", userid);
		dbParam2.put("startDate", startDate);
		dbParam2.put("endDate", endDate);
		// sql 검색 값 셋팅
		Map<String, Object> dbParam = new HashMap<String, Object>();
		dbParam.put("userid", userid);
		dbParam.put("list", dateArr);
		
		SettleDaoImp dao = sqlSession.getMapper(SettleDaoImp.class);
//		System.out.println("result:" + result);
		dao = sqlSession.getMapper(SettleDaoImp.class);		
		
		List<Integer> result = dao.classTotalMember(dbParam);
		
		dao = sqlSession.getMapper(SettleDaoImp.class);
		List<Map<String, Integer>> genderResult = dao.StatClassForGender(dbParam2);
		
		// chart3 data
		dao = sqlSession.getMapper(SettleDaoImp.class);
		List<Map<String, Integer>> ageResult = dao.StatClassForAge(dbParam2);
		

		// ChartJs 전송 데이터
		List<String> genderPieLbl = new ArrayList<String>();
		List<String> genderPieData = new ArrayList<String>();
		
		List<String> agePieLbl = new ArrayList<String>();
		List<String> agePieData = new ArrayList<String>();
		
		
		for(int i=0; i< genderResult.size(); i++) {
			genderPieLbl.add("\'" + genderResult.get(i).get("GENDER_GB") + "\'");
			genderPieData.add(String.valueOf(genderResult.get(i).get("CNT")));
		}
		for(int i=0; i< ageResult.size(); i++) {
			agePieData.add(String.valueOf(ageResult.get(i).get("CNT")));
			agePieLbl.add("\'" + ageResult.get(i).get("AGE_GB") + "\'");
		}
		// label data 문자형으로 수정
		for(int i=0; i<dateArr.size(); i++) {
			dateArr.set(i, "\'" + dateArr.get(i) + "\'");
		}
		
		if(startDate != null && endDate != null) {
			
			mav.addObject("startDate", startDate);
			mav.addObject("endDate", endDate);
			mav.addObject("labelData", dateArr);
			mav.addObject("dashData", result);
			mav.addObject("genderLabel", genderPieLbl);
			mav.addObject("genderData", genderPieData);
			mav.addObject("ageLabel", agePieLbl);
			mav.addObject("ageData", agePieData);

			System.out.println("ajax success");
			try {
				//resp.getWriter().write("{\"result\":\"success\"}");
				mav.setViewName("creator/creatorStatClass");
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
	
	@RequestMapping("/creatorAnswer")
	public ModelAndView creatorAnswer(@RequestParam(value="now", required=false) String now) {
		int nowPage = 1;
		if(now != null && now.length() > 0){
			nowPage = Integer.parseInt(now);
		}
		int startNum = 20 * (nowPage - 1) + 1;
		int endNum = 20 * nowPage;
		
		
		SettleDaoImp dao = sqlSession.getMapper(SettleDaoImp.class);

		
		SimpleDateFormat  yyyymmdd = new SimpleDateFormat("yyyy-MM-dd");
		String todate =  yyyymmdd.format(new Date());
		String startDate = todate.substring(0, 8) + "01";
		String endDate = todate;
		
		Map<String, String> dbParam = new HashMap<String, String>();
		dbParam.put("startDate", startDate);
		dbParam.put("endDate", endDate);
		dbParam.put("category", null);
		dbParam.put("search", null);
		dbParam.put("startNum", startNum+"");
		dbParam.put("endNum", endNum+"");
		
//		dao = sqlSession.getMapper(ClassDaoImp.class);
				
		int cntRecords = dao.creatorCntAllQna(dbParam);
		
		int lastPage = 1;
		if(cntRecords % 20 == 0) {
			lastPage = cntRecords / 20;
		} else {
			lastPage = cntRecords / 20 + 1;
		}
		
		List<QnaVO> list = dao.creatorAllQna(dbParam);
		ModelAndView mav =new ModelAndView();
		
		mav.addObject("startDate", startDate);
		mav.addObject("endDate", endDate);
		
		mav.addObject("method", "get");
		mav.addObject("list",list);
		mav.addObject("cntData", list.size());
		mav.addObject("lastPage", lastPage);
		mav.addObject("nowPage", nowPage);
		
		mav.addObject("startDate", startDate);
		mav.addObject("endDate", endDate);
		mav.addObject("category", null);
		mav.addObject("search", null);

		mav.setViewName("creator/creatorAnswer");
	
		return mav;
	}
	
	@RequestMapping(value="/creatorAnswer", method=RequestMethod.POST)
	@ResponseBody
	public ModelAndView creatorAnswer(HttpServletRequest req, HttpServletResponse resp, @RequestParam(value="startDate", required=false) String startDate, @RequestParam(value="endDate", required=false) String endDate,
																@RequestParam(value="category", required=false) String category, 
																@RequestParam(value="search", required=false) String search,
																@RequestParam(value="now", required=false) String now) {
		int nowPage = 1;
		if(now != null && now.length() > 0){
			nowPage = Integer.parseInt(now);
		}
		int startNum = 20 * (nowPage - 1) + 1;
		int endNum = 20 * nowPage;
		
		ModelAndView mav =new ModelAndView();
		SettleDaoImp dao = sqlSession.getMapper(SettleDaoImp.class);
//		SettleDaoImp sdao = sqlSession.getMapper(SettleDaoImp.class);

		if(startDate==null || endDate == null) {
			
			SimpleDateFormat  yyyymmdd = new SimpleDateFormat("yyyy-MM-dd");
			String todate =  yyyymmdd.format(new Date());
			
			startDate = todate.substring(0, 8) + "01";
			endDate = todate;
		} 
		
		if(category.length() <= 0) category = null;
		if(search.length() <= 0) search = null;

		
		Map<String, String> dbParam = new HashMap<String, String>();
		dbParam.put("startDate", startDate);
		dbParam.put("endDate", endDate);
		dbParam.put("category", category);
		dbParam.put("search", search);
		dbParam.put("startNum", startNum+"");
		dbParam.put("endNum", endNum+"");
		
		dao = sqlSession.getMapper(SettleDaoImp.class);
				
		int cntRecords = dao.creatorCntAllQna(dbParam);
		
		int lastPage = 1;
		if(cntRecords % 20 == 0) {
			lastPage = cntRecords / 20;
		} else {
			lastPage = cntRecords / 20 + 1;
		}
		
		List<QnaVO> list = dao.creatorAllQna(dbParam);
		
		
		if(startDate != null && endDate != null && list != null) {
			
			mav.addObject("method", "post");
			mav.addObject("list",list);
			mav.addObject("nowPage", nowPage);
			mav.addObject("cntData", list.size());
			mav.addObject("lastPage", lastPage);
			
			mav.addObject("startDate", startDate);
			mav.addObject("endDate", endDate);
			mav.addObject("category", category);
			mav.addObject("search", search);

			try {
				//resp.getWriter().write("{\"result\":\"success\"}");
				mav.setViewName("creator/creatorAnswer");
				System.out.println("ajax success start");
				System.out.println("list--post"+list);
				System.out.println("list+"+list.size());
				System.out.println("startDate"+startDate);
				System.out.println("endDate"+endDate);
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
	
	@RequestMapping("/creatorAnswerView")
	public ModelAndView creatorAnswerView(int num) {
		SettleDaoImp dao = sqlSession.getMapper(SettleDaoImp.class);
		
		QnaVO list = dao.creatorAnswerView(num);
		ModelAndView mav = new ModelAndView();	
		
		mav.addObject("list",list);		
		mav.setViewName("creator/creatorAnswerView");
		return mav;
	}
	
	@RequestMapping(value="/creatorAnswerOk",method=RequestMethod.POST)
	public ModelAndView creatorAnswerOk(@RequestParam String num, HttpSession ses, @RequestParam String answer) {
		String creator = (String)ses.getAttribute("userid");
		ModelAndView mav = new ModelAndView();
		SettleDaoImp dao = sqlSession.getMapper(SettleDaoImp.class);
		
		Map<String, String> dbParam = new HashMap<String, String>();
		dbParam.put("num", num);
		dbParam.put("answer", answer);
		dbParam.put("writer", creator);
		
		int result = dao.UpdateAnswer(dbParam);
			mav.setViewName("redirect:creatorAnswer?num="+num);	
		
		return mav;
	}
	
	@RequestMapping ("/creatorApproval")
	public String creatorApproval() {
		return "creator/creatorApproval";
	}
	@RequestMapping(value="/creatorMyClass",method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView creatorMyClass(@RequestParam(value="now", required=false) String now,
			@RequestParam(value="category", required=false) String category,
			@RequestParam(value="class_state", required=false) String class_state,
			@RequestParam(value="dateOption", required=false) String dateOption,
			@RequestParam(value="search", required=false) String search,
			@RequestParam(value="startDate", required=false) String startDate,
			@RequestParam(value="endDate", required=false) String endDate,
			HttpServletRequest req, HttpServletResponse resp){
		
		
		System.out.println("POST 드가자");
		int nowPage = 1;
		if(now != null && now.length() > 0){
			nowPage = Integer.parseInt(now);
		}
		int startNum = 10 * (nowPage - 1) + 1;
		int endNum = 10 * nowPage;
		
		ModelAndView mav =new ModelAndView();
		CreatorDaoImp dao = sqlSession.getMapper(CreatorDaoImp.class);
		
		if(startDate==null || endDate == null) {
			System.out.println("startMonth is null");
			
			SimpleDateFormat  yyyymmdd = new SimpleDateFormat("yyyy-MM-dd");
			String todate =  yyyymmdd.format(new Date());
			
			startDate = todate.substring(0, 8) + "01";
			endDate = todate;
		} 
		
		if(category.length() <= 0) category = null;
		if(class_state.length() <= 0) class_state = null;
		if(dateOption.length() <= 0) dateOption = null;
		if(search.length() <= 0) search = null;

		
		Map<String, String> dbParam = new HashMap<String, String>();
		dbParam.put("startDate", startDate);
		dbParam.put("endDate", endDate);
		dbParam.put("category", category);
		dbParam.put("dateOption", dateOption);
		dbParam.put("search", search);
		dbParam.put("class_state", class_state);
		dbParam.put("startNum", startNum+"");
		dbParam.put("endNum", endNum+"");
		
		String userid=(String)req.getSession().getAttribute("userid");
		dbParam.put("userid",userid);
		
		int cntRecords = dao.selectcreClassAllCount(dbParam);
		
		int lastPage = 1;
		if(cntRecords % 10 == 0) {
			lastPage = cntRecords / 10;
		} else {
			lastPage = cntRecords / 10 + 1;
		}
		;
		List<ClassVO> result = dao.selectcreClassList(dbParam);
		
		
		if(startDate != null && endDate != null && result != null) {
			
			mav.addObject("method", "post");
			mav.addObject("result",result);
			mav.addObject("nowPage", nowPage);
			mav.addObject("cntData", result.size());
			mav.addObject("lastPage", lastPage);
			
			mav.addObject("startDate", startDate);
			mav.addObject("endDate", endDate);
			mav.addObject("category", category);
			mav.addObject("class_state", class_state);
			mav.addObject("dateOption", dateOption);
			mav.addObject("search", search);
			
			System.out.println("startDate>>>>>"+startDate);
			System.out.println("endDate>>>>>"+endDate);
			System.out.println("category>>>>>"+category);
			System.out.println("class_state>>>>>"+class_state);
			System.out.println("dateOption>>>>>"+dateOption);
			System.out.println("search>>>>>"+search);
	
			try {
				//resp.getWriter().write("{\"result\":\"success\"}");
				mav.setViewName("creator/creatorMyClass");
				System.out.println("ajax success start");
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
	@RequestMapping("/creatorMyClass")
	public ModelAndView creatorMyClass(@RequestParam(value="now", required=false) String now,
			HttpServletRequest req) {
		int nowPage = 1;
		if(now != null && now.length() > 0){
			nowPage = Integer.parseInt(now);
		}
		int startNum = 10 * (nowPage - 1) + 1;
		int endNum = 10 * nowPage;
		
		ModelAndView mav =new ModelAndView();
		
		SimpleDateFormat  yyyymmdd = new SimpleDateFormat("yyyy-MM-dd");
		String todate =  yyyymmdd.format(new Date());
		String startDate = todate.substring(0, 8) + "01";
		String endDate = todate;
		
		Map<String, String> dbParam = new HashMap<String, String>();
		dbParam.put("startDate", startDate);
		dbParam.put("endDate", endDate);
		dbParam.put("dateOption", null);
		dbParam.put("category", null);
		dbParam.put("search", null);
		dbParam.put("class_state", null);
		dbParam.put("startNum", startNum+"");
		dbParam.put("endNum", endNum+"");
		
		CreatorDaoImp dao=sqlSession.getMapper(CreatorDaoImp.class);		
				
		String userid=(String)req.getSession().getAttribute("userid");
		dbParam.put("userid",userid);
		
		int cntRecords = dao.selectcreClassAllCount(dbParam);
		
		int lastPage = 1;
		if(cntRecords % 10 == 0) {
			lastPage = cntRecords / 10;
		} else {
			lastPage = cntRecords / 10 + 1;
		}
		;
		List<ClassVO> result = dao.selectcreClassList(dbParam);

		mav.addObject("method", "get");
		mav.addObject("result",result);
		mav.addObject("cntData", result.size());
		mav.addObject("lastPage", lastPage);
		mav.addObject("nowPage", nowPage);
		
		mav.addObject("startDate", startDate);
		mav.addObject("endDate", endDate);
		mav.addObject("dateOption",null);
		mav.addObject("category",null);
		mav.addObject("search",null);
		mav.addObject("class_state",null);



//		mav.addObject("data", result);
		mav.setViewName("creator/creatorMyClass");
	
		return mav;
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
	public ModelAndView creatorEdit(HttpSession ses) {
		
		String userid = (String)ses.getAttribute("userid");
		ModelAndView mav = new ModelAndView();
		
		CreatorDaoImp dao = sqlSession.getMapper(CreatorDaoImp.class);
		AllVO vo = dao.selectCreatorlist(userid);
		
		mav.addObject("vo",vo);		
		mav.setViewName("creator/creatorEdit");	
		
		return mav;
	}
	@RequestMapping(value="/creatorEditOk",method=RequestMethod.POST)
	public ModelAndView creatorEditOk(HttpSession ses,AllVO vo) {
		String userid = (String)ses.getAttribute("userid");

		CreatorDaoImp dao = sqlSession.getMapper(CreatorDaoImp.class);	
		
		int result = dao.UpdateCreatorlist(vo);	
		int result1 = dao.UpdateCreatorlist1(vo);
		ModelAndView mav = new ModelAndView();	
		
		mav.addObject("result", result);
		mav.addObject("result1", result1);
		mav.setViewName("creator/creatorEditOk");
		
	return mav;
	}
	
	/* 회원탈퇴 */
	@RequestMapping("/creatorLeave")
	public ModelAndView creatorLeave(HttpSession ses) {
		CreatorDaoImp dao = sqlSession.getMapper(CreatorDaoImp.class);
		String userid = (String)ses.getAttribute("userid");
		String username = dao.creatorInfoView(userid).getUsername();
		ModelAndView mav = new ModelAndView();
		mav.addObject("userid", userid);
		mav.addObject("username", username);
		mav.setViewName("creator/creatorLeave");
		return mav;
	}
	/* 회원탈퇴-비밀번호입력 */
	@RequestMapping("/creatorLeaveChk")
	public ModelAndView creatorLeaveChk(HttpSession ses) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("userid",(String)ses.getAttribute("userid"));
		mav.setViewName("creator/creatorLeaveChk");
		return mav;
	}
	/* 회원탈퇴-비밀번호확인 */
	@RequestMapping(value="/creatorLeaveOk", method=RequestMethod.POST)
	public ModelAndView creatorLeaveOk(MemberVO vo, HttpSession ses) {
		CreatorDaoImp dao = sqlSession.getMapper(CreatorDaoImp.class);
		int result = dao.creatorInfoPwdChk(vo);
		
		ModelAndView mav = new ModelAndView();
		if(result==0) { //비밀번호 틀리면
			mav.setViewName("mypage/userInfoPwdResult");
		}else if(result==1) { //비밀번호 맞으면
			int LeaveResult = dao.creatorLeave(vo);
			if(LeaveResult>0) { //탈퇴 성공
				ses.invalidate();
				mav.setViewName("creator/creatorLeaveConfirmed");
			}else { //탈퇴 실패
				mav.setViewName("creator/creatorLeaveResult");
			}
		}
		return mav;
	}
	/* 회원탈퇴-성공 */
	@RequestMapping("/creatorConfirmed")
	public String creatorConfirmed() {
		return "creator/creatorConfirmed";
	}
	
	@RequestMapping("/creatorSettle")
	public ModelAndView creatorSettle(HttpSession ses,@RequestParam(value="now", required=false) String now) {
		String userid = (String)ses.getAttribute("userid");

		
		int nowPage = 1;
		if(now != null && now.length() > 0){
			nowPage = Integer.parseInt(now);
		}
		int startNum = 20 * (nowPage - 1) + 1;
		int endNum = 20 * nowPage;
		
		SettleDaoImp dao = sqlSession.getMapper(SettleDaoImp.class);
		ModelAndView mav = new ModelAndView();
		
		SimpleDateFormat  yyyymmdd = new SimpleDateFormat("yyyy-MM-dd");
		String todate =  yyyymmdd.format(new Date());
		String startDate = todate.substring(0, 8) + "01";
		String endDate = todate;
	
		Map<String, String> dbParam = new HashMap<String, String>();
		dbParam.put("userid", userid);
		dbParam.put("startDate", startDate);
		dbParam.put("endDate", endDate);
		dbParam.put("category", null);
		dbParam.put("class_name", null);
		dbParam.put("startNum", startNum+"");
		dbParam.put("endNum", endNum+"");
		
		int cntRecords = dao.CreatorCntAllSettle(dbParam); //移댁슫�듃
		
		int lastPage = 1;
		if(cntRecords % 20 == 0) {
			lastPage = cntRecords / 20;
		} else {
			lastPage = cntRecords / 20 + 1;
		}

		List<SettleVO> list = dao.CreatorAllSettle(dbParam); // 전체 리스트
		dao = sqlSession.getMapper(SettleDaoImp.class);
		for(SettleVO tmp : list) {
			System.out.println(tmp.getClass_order_code());
		}
		
		Integer creatorAllSales = dao.creatorAllSales(dbParam);
		Integer creatorSalesN = dao.creatorSalesN(dbParam);
		Integer creatorSalesY = dao.creatorSalesY(dbParam);
		
		if(creatorAllSales == null) creatorAllSales = 0;
		if(creatorSalesN == null) creatorSalesN = 0;
		if(creatorSalesY == null) creatorSalesY = 0;
		

		
		
		mav.addObject("method", "get");
		mav.addObject("lastPage", lastPage);
		mav.addObject("nowPage", nowPage);
		
		mav.addObject("startDate", startDate);
		mav.addObject("endDate", endDate);
		mav.addObject("category", null);
		mav.addObject("class_name", null);
		mav.addObject("data", list);
		mav.addObject("creatorAllSales", creatorAllSales);
		mav.addObject("creatorSalesN", creatorSalesN);
		mav.addObject("creatorSalesY", creatorSalesY);
		mav.setViewName("creator/creatorSettle");
		
		return mav;
	}
	
	@RequestMapping(value="/creatorSettle", method=RequestMethod.POST)
	@ResponseBody
	public ModelAndView creatorSettle(HttpSession ses,@RequestParam(value="now", required=false) String now, HttpServletRequest req, HttpServletResponse resp, @RequestParam(value="startDate", required=false) String startDate, @RequestParam(value="endDate", required=false) String endDate,  @RequestParam(value="category", required=false) String category, @RequestParam(value="class_name", required=false) String class_name) {
		String userid = (String)ses.getAttribute("userid");
		
		int nowPage = 1;
		if(now != null && now.length() > 0){
			nowPage = Integer.parseInt(now);
			System.out.println(nowPage);
		}
		int startNum = 20 * (nowPage - 1) + 1;
		int endNum = 20 * nowPage;

		SettleDaoImp dao = sqlSession.getMapper(SettleDaoImp.class);
		ModelAndView mav = new ModelAndView();

		if(startDate==null || endDate == null) {
			System.out.println("startMonth is null");
			
			SimpleDateFormat  yyyymmdd = new SimpleDateFormat("yyyy-MM-dd");
			String todate =  yyyymmdd.format(new Date());
			
			startDate = todate.substring(0, 8) + "01";
			endDate = todate;
		} 
		
		if(category.length() <= 0) category = null;
		if(class_name.length() <= 0) class_name = null;

		Map<String, String> dbParam = new HashMap<String, String>();
		dbParam.put("userid", userid);
		dbParam.put("startDate", startDate);
		dbParam.put("endDate", endDate);
		dbParam.put("category", category);
		dbParam.put("class_name", class_name);
		dbParam.put("startNum", startNum + "");
		dbParam.put("endNum", endNum +"");
		
		int cntRecords = dao.CreatorCntAllSettle(dbParam);
		
		int lastPage = 1;
		if(cntRecords % 20 == 0) {
			lastPage = cntRecords / 20;
		} else {
			lastPage = cntRecords / 20 + 1;
		}
		List<SettleVO> list = dao.CreatorAllSettle(dbParam); // 전체 리스트
		dao = sqlSession.getMapper(SettleDaoImp.class);
		for(SettleVO tmp : list) {
			System.out.println(tmp.getClass_order_code());
		}
		
		Integer creatorAllSales = dao.creatorAllSales(dbParam);
		Integer creatorSalesN = dao.creatorSalesN(dbParam);
		Integer creatorSalesY = dao.creatorSalesY(dbParam);
		
		if(creatorAllSales == null) creatorAllSales = 0;
		if(creatorSalesN == null) creatorSalesN = 0;
		if(creatorSalesY == null) creatorSalesY = 0;
		
				
		
		if(startDate != null && endDate != null && list != null) {
			
			mav.addObject("method", "post");
			mav.addObject("nowPage", nowPage);
			mav.addObject("cntData", list.size());
			mav.addObject("lastPage", lastPage);
			
			mav.addObject("startDate", startDate);
			mav.addObject("endDate", endDate);
			mav.addObject("category", category);
			mav.addObject("class_name", class_name);
			mav.addObject("data", list);
			mav.addObject("creatorAllSales", creatorAllSales);
			mav.addObject("creatorSalesN", creatorSalesN);
			mav.addObject("creatorSalesY", creatorSalesY);

			try {
				//resp.getWriter().write("{\"result\":\"success\"}");
				mav.setViewName("creator/creatorSettle");
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
	@RequestMapping(value="/creatorVideo", method=RequestMethod.POST)
	@ResponseBody
	public ModelAndView creatorVideo(HttpServletRequest req, HttpServletResponse resp, 
			@RequestParam(value="startDate", required=false) String startDate, 
			@RequestParam(value="endDate", required=false) String endDate,
			@RequestParam(value="category", required=false) String category,
			@RequestParam(value="searchWord", required=false) String searchWord,
			@RequestParam(value="now", required=false) String now){
		
		int nowPage = 1;
		if(now != null && now.length() > 0){
			nowPage = Integer.parseInt(now);
		}
		int startNum = 10 * (nowPage - 1) + 1;
		int endNum = 10 * nowPage;
		
		ModelAndView mav =new ModelAndView();
		ClassDaoImp dao = sqlSession.getMapper(ClassDaoImp.class);
//		SettleDaoImp sdao = sqlSession.getMapper(SettleDaoImp.class);
		
		if(startDate==null || endDate == null) {
			System.out.println("startMonth is null");
			
			SimpleDateFormat  yyyymmdd = new SimpleDateFormat("yyyy-MM-dd");
			String todate =  yyyymmdd.format(new Date());
			
			startDate = todate.substring(0, 8) + "01";
			endDate = todate;
		} 
		
		if(category.length() <= 0) category = null;
		if(searchWord.length() <= 0) searchWord = null;		
		Map<String, String> dbParam = new HashMap<String, String>();
		dbParam.put("startDate", startDate);
		dbParam.put("endDate", endDate);
		dbParam.put("category", category);
		dbParam.put("searchWord", searchWord);
		dbParam.put("startNum", startNum+"");
		dbParam.put("endNum", endNum+"");
		
		dao = sqlSession.getMapper(ClassDaoImp.class);
				
		int cntRecords = dao.getVideoRecordCount(dbParam);
		
		int lastPage = 1;
		if(cntRecords % 10 == 0) {
			lastPage = cntRecords / 10;
		} else {
			lastPage = cntRecords / 10 + 1;
		}
		;
		List<ClassVideoVO> vlist = dao.getClassVideoList(dbParam);
		
		
		if(startDate != null && endDate != null && vlist != null) {
			
			mav.addObject("method", "post");
			mav.addObject("vlist",vlist);
			mav.addObject("nowPage", nowPage);
			mav.addObject("cntData", vlist.size());
			mav.addObject("lastPage", lastPage);
			
			mav.addObject("startDate", startDate);
			mav.addObject("endDate", endDate);
			mav.addObject("category", category);
			mav.addObject("searchWord", searchWord);
//			mav.addObject("data", result);
			
			System.out.println("category_____"+category);
			System.out.println("searchWord________"+searchWord);
	
			try {
				//resp.getWriter().write("{\"result\":\"success\"}");
				mav.setViewName("admin/adminVideo");
				System.out.println("ajax success start");
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

		System.out.println("startDate"+startDate);
		System.out.println("startDate"+endDate);
		return null;
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
	public ModelAndView creatorVideo(@RequestParam(value="now", required=false) String now,
			HttpSession session){
		int nowPage = 1;
		if(now != null && now.length() > 0){
			nowPage = Integer.parseInt(now);
		}
		int startNum = 10 * (nowPage - 1) + 1;
		int endNum = 10 * nowPage;
		
		ModelAndView mav =new ModelAndView();
		
		SimpleDateFormat  yyyymmdd = new SimpleDateFormat("yyyy-MM-dd");
		String todate =  yyyymmdd.format(new Date());
		String startDate = todate.substring(0, 8) + "01";
		String endDate = todate;
		
		Map<String, String> dbParam = new HashMap<String, String>();
		dbParam.put("startDate", startDate);
		dbParam.put("endDate", endDate);
		dbParam.put("category", null);
		dbParam.put("searchWord", null);
		dbParam.put("startNum", startNum+"");
		dbParam.put("endNum", endNum+"");
		
		CreatorDaoImp dao = sqlSession.getMapper(CreatorDaoImp.class);		
		
		String userid=String.valueOf(session.getAttribute("userid"));
		dbParam.put("userid", userid);
		
		
		
		int cntRecords = dao.creVideoAllRecordCount(dbParam);		
		int lastPage = 1;
		if(cntRecords % 10 == 0) {
			lastPage = cntRecords / 10;
		} else {
			lastPage = cntRecords / 10 + 1;
		}
		;
		List<ClassVideoVO> vlist = dao.creVideoList(dbParam);
		
		
		mav.addObject("startDate", startDate);
		mav.addObject("endDate", endDate);
		
		mav.addObject("method", "get");
		mav.addObject("vlist",vlist);
		mav.addObject("cntData", vlist.size());
		mav.addObject("lastPage", lastPage);
		mav.addObject("nowPage", nowPage);
		
		mav.addObject("startDate", startDate);
		mav.addObject("endDate", endDate);
		mav.addObject("category", null);
		mav.addObject("searchWord", null);
		
		
		
		
		
		
//		mav.addObject("data", result);
		mav.setViewName("creator/creatorVideo");
	
		return mav;
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
	
	@RequestMapping("/creatorVideoView")
	public ModelAndView creatorVideoView(HttpServletRequest req) {
		String code=req.getParameter("code");
		String filename=req.getParameter("video_filename");
		System.out.println("filename==>"+filename);
		String path=req.getSession().getServletContext().getRealPath("/upload/class_video");
		File file =new File(path, filename);
		//String fullPath="/upload/class_video/"+filename;
		ModelAndView mav=new ModelAndView();
		if(file.exists()){
			long fileSize=file.length();
			System.out.println("fileSize==>"+fileSize);
			String sizeStr=null;
			if(fileSize!=0){
				sizeStr=byteCalculation(fileSize);
				System.out.println("sizeStr==>"+sizeStr);
			}
			mav.addObject("filesize",sizeStr);
		}
		ClassDaoImp dao=sqlSession.getMapper(ClassDaoImp.class);
		String category=dao.selectVideoCategory(code);
		String className=dao.selectVideoClassName(code);
		List<ClassVideoVO> videoList=dao.selectClassVideoList(code);
		List<ClassVideoVO> unitList=dao.selectSection(code);
		
		mav.addObject("videoList", videoList);
		mav.addObject("unitList", unitList);
		mav.addObject("category",category);
		mav.addObject("className",className);
		mav.addObject("filename",filename);
		mav.addObject("code",code);
		mav.setViewName("creator/creatorVideoView");
		return mav;
	}
	 public String byteCalculation(Long bytes) {
         String retFormat = null;
         Double size=bytes.doubleValue();
         String[] s = { "bytes", "KB", "MB", "GB", "TB", "PB" };
         if (bytes != 0) {
               int idx = (int) Math.floor(Math.log(size) / Math.log(1024));
               DecimalFormat df = new DecimalFormat("#,###.##");
               double ret = ((size / Math.pow(1024, Math.floor(idx))));
               retFormat = df.format(ret) + " " + s[idx];
          } else {
               retFormat += " " + s[0];
          }

          return retFormat;
	 }
	 @RequestMapping("/creatorGetClassList")
	@ResponseBody
	public List<ClassVO> adminGetClassList(HttpServletRequest req){
		CreatorDaoImp dao=sqlSession.getMapper(CreatorDaoImp.class);
		String userid=(String)req.getSession().getAttribute("userid");
		String category=req.getParameter("value");
		
		Map<String,String> map= new HashMap<String, String>();
		map.put("userid",userid);
		map.put("category",category);
		List<ClassVO> list=dao.getcreClassList(map);
		return list;
	}
}