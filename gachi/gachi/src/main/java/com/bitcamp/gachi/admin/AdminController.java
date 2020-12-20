package com.bitcamp.gachi.admin;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.JsonObject;


@Controller
public class AdminController {
	SqlSession sqlSession;
	
	public SqlSession getSqlSession() {
		return sqlSession;
	}
	
	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@RequestMapping ("/adminDashboard")
	public ModelAndView adminDashboard() {
		ModelAndView mav = new ModelAndView();
		
		String startMonth, endMonth;
		SimpleDateFormat  yyyymm = new SimpleDateFormat("yyyy-MM");
		String todate =  yyyymm.format(new Date());
		if(Integer.parseInt(todate.substring(5, 7))-1 <= 0) {
			startMonth = (Integer.parseInt(todate.substring(0,3))-1) + "-" + (Integer.parseInt(todate.substring(5, 7))+12-1);
		}
			startMonth = todate.substring(0, 4) +  "-" + (Integer.parseInt(todate.substring(5, 7))-1);
			endMonth = todate;
			
		int dataSize = 0;
			if((Integer.parseInt(endMonth.substring(0, 4))) == (Integer.parseInt(startMonth.substring(0, 4)))) { // 2019-11 2020-02
				dataSize = Integer.parseInt(endMonth.substring(5,7)) - Integer.parseInt(startMonth.substring(5,7));
			} else{
				dataSize = (Integer.parseInt(endMonth.substring(0,4)) - Integer.parseInt(startMonth.substring(0,4)))*12;
				dataSize += Integer.parseInt(endMonth.substring(5,7)); 
				dataSize -= Integer.parseInt(startMonth.substring(5,7));
				
			}
			dataSize += 1;
			System.out.println(dataSize);
			
			List<String> dbParam2 = new ArrayList<String>();
			for(int i=0; i<dataSize; i++) {
				String tmp;
				if(Integer.parseInt(startMonth.substring(5, 7)) + i > 12) {
					tmp = Integer.parseInt(startMonth.substring(0,4))+1 + "-" + (Integer.parseInt(startMonth.substring(5, 7)) - 12 + i);
					System.out.println("tmp1:" + tmp);
				} else {
					tmp = Integer.parseInt(startMonth.substring(0,4)) + "-" + (Integer.parseInt(startMonth.substring(5, 7)) + i);
					System.out.println("tmp2:" + tmp);
				}
				if(tmp.length()<7) tmp = tmp.substring(0,4)+ "-0" + tmp.substring(5,6);
				dbParam2.add(tmp);
			}
			
			// dbParam definition
			Map<String, List> dbParam = new HashMap<String, List>();
			dbParam.put("list", dbParam2);
			
			// chart1 data
			MemberDaoImp dao = sqlSession.getMapper(MemberDaoImp.class);
			SettleDaoImp dao1 = sqlSession.getMapper(SettleDaoImp.class);
				
			List<Integer> newMember = dao.dashForMember(dbParam); // return type
			List<Integer> dashClassChart = dao1.dashClassChart(dbParam);
			List<Integer> dashStoreChart = dao1.dashStoreChart(dbParam);
			List<Integer> dashAllChart = dao1.dashAllChart(dbParam);

				
			// dbParam for member chart 
			Map<String, String> dashmember_cnt = new HashMap<String, String>();
			Map<String, String> dbParam1 = new HashMap<String, String>();
			dashmember_cnt.put("startMonth", startMonth.toString());
			dashmember_cnt.put("endMonth", endMonth.toString());
			dbParam1.put("startMonth", startMonth.toString());
			dbParam1.put("endMonth", endMonth.toString());
		
			
			
			//chart1 member 
			dao = sqlSession.getMapper(MemberDaoImp.class);
			dao1 = sqlSession.getMapper(SettleDaoImp.class);

//			List<Map<String, Integer>> dashMember = dao.dashboardMember(dashmember_cnt);
//			List<Map<String, Integer>> dashAllMember = dao.dashboardAllMember(dashmember_cnt);
//			List<Map<String, Integer>> dashCreator = dao.dashboardCreator(dashmember_cnt);
			int  dashMember = dao.dashboardMember(dashmember_cnt);
			int  dashAllMember = dao.dashboardAllMember(dashmember_cnt);
			int dashCreator = dao.dashboardCreator(dashmember_cnt);	
	
			List<SettleVO> result = dao1.managePaymentClass_Dash(dbParam1);
			
			Integer Allpayment = dao1.paymentAll_Dash(dbParam1);
			Integer AllPaymentClass = dao1.paymentClassAll_Dash(dbParam1);
			Integer AllPaymentStore = dao1.paymentStoreAll_Dash(dbParam1);
			// ChartJs �쟾�넚 �뜲�씠�꽣
//			List<String> dashMemberData = new ArrayList<String>();
//			List<String> dashAllMemberData = new ArrayList<String>();
//			List<String> dashCreatorData = new ArrayList<String>();
			
//			for(int i=0; i<dashMember.size(); i++) {
//			     dashMemberData.add(String.valueOf(dashMember.get(i).get("CNT")));
//			}
//			for(int i=0; i<dashCreator.size();i++) {
//				dashCreatorData.add(String.valueOf(dashCreator.get(i).get("CNT")));
//			}
//			for(int i=0; i<dashAllMember.size();i++) {
//				 dashAllMemberData.add(String.valueOf(dashAllMember.get(i).get("CNT")));
//			}
			for(int i=0; i<dataSize; i++) {
				String tmp = dbParam2.get(i);
//					System.out.println(tmp);
				dbParam2.set(i, "\'" + tmp +"\'");
//					System.out.println(dbParam2.get(i));
			}
			for(int i=0; i<dashClassChart.size(); i++) {
				System.out.println(dashClassChart.get(i));
			}
			for(int i=0; i<dashStoreChart.size(); i++) {
				System.out.println(dashStoreChart.get(i));
			}
			for(int i=0; i<dashAllChart.size(); i++) {
				System.out.println(dashAllChart.get(i));
			}
			
//			mav.addObject("dashMemberData", dashMemberData);
//			mav.addObject("dashAllMemberData",dashAllMemberData);
//			mav.addObject("dashCreatorData", dashCreatorData);
			mav.addObject("dashMemberData", dashMember);
			mav.addObject("dashAllMemberData", dashAllMember);
			mav.addObject("dashCreatorData", dashCreator);
			mav.addObject("AllPaymentClass", AllPaymentClass);
			mav.addObject("AllPaymentStore", AllPaymentStore);
			mav.addObject("Allpayment", Allpayment);
			
			mav.addObject("dashAllChart", dashAllChart);
			mav.addObject("dashClassChart", dashClassChart);
			mav.addObject("dashStoreChart", dashStoreChart);
			mav.addObject("labelData", dbParam2);
			mav.addObject("dataSize", dataSize);
			mav.addObject("startMonth", startMonth);
			mav.addObject("endMonth", endMonth);
			
			mav.addObject("dataSize", 2);
			mav.setViewName("admin/adminDashboard");
			
		return mav;			
		
	}
	
	@RequestMapping(value="/adminDashboard",method=RequestMethod.POST)
	@ResponseBody
	public ModelAndView adminDashboard(HttpServletRequest req, HttpServletResponse resp, @RequestParam(value="startMonth", required=false) String startMonth, @RequestParam(value="endMonth", required=false) String endMonth) {
		ModelAndView mav = new ModelAndView();
		
		
		if(startMonth==null || endMonth == null) {
			System.out.println("startMonth is null");
			
			SimpleDateFormat  yyyymm = new SimpleDateFormat("yyyy-MM");
			String todate =  yyyymm.format(new Date());
			if(Integer.parseInt(todate.substring(5, 7))-1 <= 0) {
				startMonth = (Integer.parseInt(todate.substring(0,3))-1) + "-" + (Integer.parseInt(todate.substring(5, 7))+12-1);
			}
			startMonth = todate.substring(0, 4) +  "-" + (Integer.parseInt(todate.substring(5, 7))-1);
			endMonth = todate;
		} 
		
		int dataSize = 0;
		if((Integer.parseInt(endMonth.substring(0, 4))) == (Integer.parseInt(startMonth.substring(0, 4)))) { // 2019-11 2020-02
			dataSize = Integer.parseInt(endMonth.substring(5,7)) - Integer.parseInt(startMonth.substring(5,7));
		} else{
			dataSize = (Integer.parseInt(endMonth.substring(0,4)) - Integer.parseInt(startMonth.substring(0,4)))*12;
			dataSize += Integer.parseInt(endMonth.substring(5,7)); 
			dataSize -= Integer.parseInt(startMonth.substring(5,7));
			
		}
		dataSize += 1;
		System.out.println(dataSize);
		
		List<String> dbParam2 = new ArrayList<String>();
		for(int i=0; i<dataSize; i++) {
			String tmp;
			if(Integer.parseInt(startMonth.substring(5, 7)) + i > 12) {
				tmp = Integer.parseInt(startMonth.substring(0,4))+1 + "-" + (Integer.parseInt(startMonth.substring(5, 7)) - 12 + i);
				System.out.println("tmp1:" + tmp);
			} else {
				tmp = Integer.parseInt(startMonth.substring(0,4)) + "-" + (Integer.parseInt(startMonth.substring(5, 7)) + i);
				System.out.println("tmp2:" + tmp);
			}
			if(tmp.length()<7) tmp = tmp.substring(0,4)+ "-0" + tmp.substring(5,6);
			dbParam2.add(tmp);
		}
		
		// dbParam definition
		Map<String, List> dbParam = new HashMap<String, List>();
		dbParam.put("list", dbParam2);
		
		// chart1 data
		MemberDaoImp dao = sqlSession.getMapper(MemberDaoImp.class);
		SettleDaoImp dao1 = sqlSession.getMapper(SettleDaoImp.class);
		
		dao = sqlSession.getMapper(MemberDaoImp.class);
		dao1 =sqlSession.getMapper(SettleDaoImp.class);
		
		List<Integer> newMember = dao.dashForMember(dbParam); // return type
		List<Integer> dashClassChart = dao1.dashClassChart(dbParam);
		List<Integer> dashStoreChart = dao1.dashStoreChart(dbParam);
		List<Integer> dashAllChart = dao1.dashAllChart(dbParam);

		
		// dbParam for member chart 
		Map<String, String> dashmember_cnt = new HashMap<String, String>();
		Map<String, String> dbParam1 = new HashMap<String, String>();
		dashmember_cnt.put("startMonth", startMonth.toString());
		dashmember_cnt.put("endMonth", endMonth.toString());
		dbParam1.put("startMonth", startMonth.toString());
		dbParam1.put("endMonth", endMonth.toString());
		//chart1 member 
		
//		List<Map<String, Integer>> dashMember = dao.dashboardMember(dashmember_cnt);
//		List<Map<String, Integer>> dashAllMember = dao.dashboardAllMember(dashmember_cnt);
//		List<Map<String, Integer>> dashCreator = dao.dashboardCreator(dashmember_cnt);
		int  dashMember = dao.dashboardMember(dashmember_cnt);
		int  dashAllMember = dao.dashboardAllMember(dashmember_cnt);
		int  dashCreator = dao.dashboardCreator(dashmember_cnt);

		// ChartJs �쟾�넚 �뜲�씠�꽣
//		List<String> dashMemberData = new ArrayList<String>();
//		List<String> dashAllMemberData = new ArrayList<String>();
//		List<String> dashCreatorData = new ArrayList<String>();
		
		List<SettleVO> result = dao1.managePaymentClass_Dash(dbParam1);
		
		Integer Allpayment = dao1.paymentAll_Dash(dbParam1);
		Integer AllPaymentClass = dao1.paymentClassAll_Dash(dbParam1);
		Integer AllPaymentStore = dao1.paymentStoreAll_Dash(dbParam1);
//		for(int i=0; i<dashMember.size(); i++) {
//		     dashMemberData.add(String.valueOf(dashMember.get(i).get("CNT")));
//		}
//		for(int i=0; i<dashCreator.size();i++) {
//			dashCreatorData.add(String.valueOf(dashCreator.get(i).get("CNT")));
//		}
//		for(int i=0; i<dashAllMember.size();i++) {
//			 dashAllMemberData.add(String.valueOf(dashAllMember.get(i).get("CNT")));
//		}
		if(startMonth != null && endMonth != null) {
			for(int i=0; i<dataSize; i++) {
				String tmp = dbParam2.get(i);

				dbParam2.set(i, "\'" + tmp +"\'");

			}
			for(int i=0; i<dashClassChart.size(); i++) {
				System.out.println(dashClassChart.get(i));
			}
			for(int i=0; i<dashStoreChart.size(); i++) {
				System.out.println(dashStoreChart.get(i));
			}
			for(int i=0; i<dashAllChart.size(); i++) {
				System.out.println(dashAllChart.get(i));
			}
			
//			mav.addObject("dashMemberData", dashMemberData);
//			mav.addObject("dashAllMemberData",dashAllMemberData);
//			mav.addObject("dashCreatorData",dashCreatorData);
			mav.addObject("dashMemberData", dashMember);
			mav.addObject("dashAllMemberData", dashAllMember);
			mav.addObject("dashCreatorData", dashCreator);
			mav.addObject("Allpayment", Allpayment);
			mav.addObject("AllPaymentClass", AllPaymentClass);
			mav.addObject("AllPaymentStore", AllPaymentStore);
			mav.addObject("labelData", dbParam2);
			mav.addObject("dashClassChart", dashClassChart);
			mav.addObject("dashStoreChart", dashStoreChart);
			mav.addObject("dashAllChart", dashAllChart);

			mav.addObject("dataSize", dataSize);
			mav.addObject("startMonth", startMonth);
			mav.addObject("endMonth", endMonth);
			
			System.out.println("ajax success");
			

			try {
				mav.setViewName("admin/adminDashboard");
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
	@RequestMapping("/adminCreator")
	public ModelAndView adminCreator(@RequestParam(value="now", required=false) String now) {
		
		
		int nowPage = 1;
		if(now != null && now.length() > 0){
			nowPage = Integer.parseInt(now);
		}
		int startNum = 20 * (nowPage - 1) + 1;
		int endNum = 20 * nowPage;
		CreatorDaoImp dao = sqlSession.getMapper(CreatorDaoImp.class);

		Map<String, String> dbParam = new HashMap<String, String>();
		dbParam.put("status", null);
		dbParam.put("search", null);
		dbParam.put("startNum", startNum+"");
		dbParam.put("endNum", endNum+"");
		
		int cntRecords = dao.selectCntAllCreator(dbParam);
		
		int lastPage = 1;
		if(cntRecords % 20 == 0) {
			lastPage = cntRecords / 20;
		} else {
			lastPage = cntRecords / 20 + 1;
		}
		System.out.println("cntRecords:" + cntRecords);
		System.out.println("lastPage:" + lastPage);

		List<AllVO> list = dao.pagingAllCreator(dbParam);
		
		
		int countAllCreator = dao.countAllCreator();
		int countNowCreator =dao.countNowCreator();
		int countDeletedCreator = dao.countDeletedCreator();
		
		PagingVO pageVO = new PagingVO();
		
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("method", "get");
		mav.addObject("creatorList", list);
		mav.addObject("cntData", list.size());
		mav.addObject("lastPage", lastPage);
		mav.addObject("nowPage", nowPage);
		mav.addObject("countAllCreator", countAllCreator);
		mav.addObject("countNowCreator", countNowCreator);
		mav.addObject("countDeletedCreator", countDeletedCreator);
		mav.setViewName("admin/adminCreator");
		
		return mav;
	}
	
	@RequestMapping(value="/adminCreator", method=RequestMethod.POST)
	@ResponseBody
	public ModelAndView adminCreator(HttpServletResponse resp, @RequestParam(value="status", required=false) String status, @RequestParam(value="search", required=false) String search , @RequestParam(value="now",required=false) String now) {
		
		
		int nowPage = 1;
		if(now != null && now.length() > 0){
			nowPage = Integer.parseInt(now);
			System.out.println(nowPage);
		}
		int startNum = 20 * (nowPage - 1) + 1;
		int endNum = 20 * nowPage;

		ModelAndView mav=new ModelAndView();
		CreatorDaoImp dao = sqlSession.getMapper(CreatorDaoImp.class);
		
		if(status.length() <= 0) status = null;
		if(!search.equals(null)) {
			if(search.length() <= 0) search = null;
		}
		
		Map<String, String> dbParam = new HashMap<String, String>();
		dbParam.put("status", status);
		dbParam.put("search", search);
		dbParam.put("startNum", startNum + "");
		dbParam.put("endNum", endNum +"");
		
		int cntRecords = dao.selectCntAllCreator(dbParam);
		
		int lastPage = 1;
		if(cntRecords % 20 == 0) {
			lastPage = cntRecords / 20;
		} else {
			lastPage = cntRecords / 20 + 1;
		}
		
		List<AllVO> list = dao.pagingAllCreator(dbParam);
		int countAllCreator = dao.countAllCreator();
		int countNowCreator =dao.countNowCreator();
		int countDeletedCreator = dao.countDeletedCreator();
		
		if(list != null) {
			mav.addObject("method", "post");
			mav.addObject("creatorList", list);
			mav.addObject("nowPage", nowPage);
			mav.addObject("lastPage", lastPage);
			mav.addObject("cntData", list.size());
			mav.addObject("countAllCreator", countAllCreator);
			mav.addObject("countNowCreator", countNowCreator);
			mav.addObject("countDeletedCreator", countDeletedCreator);
			mav.addObject("status", status);
			mav.addObject("search", search);
			
			try {
				mav.setViewName("admin/adminCreator");
				resp.getWriter().write("{\"result\":\"success\"}");
				System.out.println("ajax success");
				return mav;
			} catch (Exception e) {
				e.printStackTrace();
			} 
//		} else {
//
//			try{
//				System.out.println("ajax error");
//				resp.getWriter().write("{\"result\":\"fail\"}");
//			} catch (IOException e) {
//	            e.printStackTrace();
//	        }
		}

		return null;
	}
	
	@RequestMapping("/adminCreatorView")
	public ModelAndView adminCreatorView(String userid) {
		
		CreatorDaoImp dao = sqlSession.getMapper(CreatorDaoImp.class);
		
		ModelAndView mav = new ModelAndView();
		AllVO vo = dao.selectCreator(userid);	
		mav.addObject("vo",vo);		
		mav.setViewName("admin/adminCreatorView");
		System.out.println(vo.getUsername());
		return mav;
	}
	
	@RequestMapping(value="/adminCreatorEditOk",method=RequestMethod.POST)
	   public ModelAndView adminCreatorEditOk(AllVO vo) {

	      CreatorDaoImp dao = sqlSession.getMapper(CreatorDaoImp.class);
	      int result = dao.creatorMemberUpdate(vo);
	      String state = vo.getCreator_state();
	      String userid= vo.getUserid();
	      
	      Map<String, String> dbParam = new HashMap<String, String>();
	      dbParam.put("state", state);
	      dbParam.put("userid", userid);
	      
	      int creator_state = dao.creatorStateUpdate(dbParam);
	      ModelAndView mav = new ModelAndView();   
	      
	         mav.addObject("result", result);
	         mav.addObject("creator_state", creator_state);
	         mav.setViewName("admin/adminCreatorEditOk");
	         
	      return mav;
	   }
	
	@RequestMapping("/adminCreatorLeaveEditOk")
	public ModelAndView adminCrearotLeaveEditOk(String userid) {

		CreatorDaoImp dao = sqlSession.getMapper(CreatorDaoImp.class);	
		int result = dao.creatorleaveMemberUpdate(userid);
		
		ModelAndView mav = new ModelAndView();

		mav.addObject("result", result);
		mav.setViewName("admin/adminCreatorLeaveEditOk");
		
	return mav;
	}
	
	@RequestMapping("/adminCreatorStateEditOk")
	public ModelAndView adminCreatorStateEditOk(String userid) {

		CreatorDaoImp dao = sqlSession.getMapper(CreatorDaoImp.class);	
		int result = dao.creatorStateMemberUpdate(userid);
		
		ModelAndView mav = new ModelAndView();

		mav.addObject("result", result);
		mav.setViewName("admin/adminCreatorStateEditOk");
		
	return mav;
	}
	
	@RequestMapping(value="/adminClass",method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView adminClass(@RequestParam(value="now", required=false) String now,
			@RequestParam(value="category", required=false) String category,
			@RequestParam(value="class_state", required=false) String class_state,
			@RequestParam(value="dateOption", required=false) String dateOption,
			@RequestParam(value="search", required=false) String search,
			@RequestParam(value="startDate", required=false) String startDate,
			@RequestParam(value="endDate", required=false) String endDate,
			HttpServletResponse res, HttpServletResponse resp){
		System.out.println("dateOption==>"+dateOption);
		System.out.println("startDate==>"+startDate);
		System.out.println("endDate==>"+endDate);
		System.out.println("POST 드가자");
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
		
		dao = sqlSession.getMapper(ClassDaoImp.class);
				
		int cntRecords = dao.getClassAllRecordCount(dbParam);
		
		int lastPage = 1;
		if(cntRecords % 10 == 0) {
			lastPage = cntRecords / 10;
		} else {
			lastPage = cntRecords / 10 + 1;
		}
		;
		List<ClassVO> result = dao.getClassRecord(dbParam);
		
		
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
				mav.setViewName("admin/adminClass");
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
	@RequestMapping("/adminClass")
	public ModelAndView adminClass(@RequestParam(value="now", required=false) String now) {
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
		
		ClassDaoImp dao=sqlSession.getMapper(ClassDaoImp.class);		
		dao = sqlSession.getMapper(ClassDaoImp.class);
				
		int cntRecords = dao.getClassAllRecordCount(dbParam);
		
		int lastPage = 1;
		if(cntRecords % 10 == 0) {
			lastPage = cntRecords / 10;
		} else {
			lastPage = cntRecords / 10 + 1;
		}
		List<ClassVO> result = dao.getClassRecord(dbParam);

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
		mav.setViewName("admin/adminClass");
	
		return mav;
	}

	@RequestMapping("/adminClassView")
	public ModelAndView adminClassView(@RequestParam("code") String code) {
		ClassDaoImp dao=sqlSession.getMapper(ClassDaoImp.class);
		ClassVO vo=dao.selectClass(code);
		List<String> list=new ArrayList<String>();
		if(vo.getClass_img2()!=null) {
			StringTokenizer st=new StringTokenizer(vo.getClass_img2(),",");	
			while(st.hasMoreTokens()) {
				list.add(st.nextToken());
			}
			vo.setImgList(list);
		}
		List<ClassVideoVO> sectionList=dao.selectSection(code);
		ModelAndView mav=new ModelAndView();
		mav.addObject("vo",vo);
		mav.addObject("list",list);
		mav.addObject("sectionList",sectionList);
		mav.setViewName("admin/adminClassView");
		return mav;
	}
	@RequestMapping("/adminClassEdit")
	public ModelAndView adminClassEdit(@RequestParam("code") String code) {
		ClassDaoImp dao=sqlSession.getMapper(ClassDaoImp.class);
		ClassVO vo=dao.selectClass(code);
		List<ClassVideoVO> sectionList=dao.selectSection(code);
		List<String> list=new ArrayList<String>();
		String text=vo.getClass_img2();
		if(text!=null) {
			StringTokenizer st=new StringTokenizer(text,",");
			while (st.hasMoreTokens()) {
				String img=st.nextToken();
				list.add(img);
			}	
		}
			vo.setImgList(list);
		ModelAndView mav=new ModelAndView();
		mav.addObject("vo",vo);
		mav.addObject("sectionList",sectionList);
		mav.setViewName("admin/adminClassEdit");
		return mav;
	}

	@RequestMapping(value="/adminClassEditOk",method = RequestMethod.POST)
	public ModelAndView adminClassEditOk(ClassVO vo,HttpSession session,
			MultipartHttpServletRequest mhsr) {
		ClassDaoImp dao=sqlSession.getMapper(ClassDaoImp.class);
		String path=session.getServletContext().getRealPath("/upload/classImg");
		String[] codes=vo.getCodes();
		String[] imgNames=vo.getImgNames();
		for (int i = 0; i < imgNames.length; i++) {
			String fullName=path+imgNames[i];
			String img=dao.selectClassImg2(codes[0]);
			StringTokenizer st=new StringTokenizer(img,",");
			while(st.hasMoreTokens()) {
				if(fullName==st.nextToken()){
					File file=new File(path,st.nextToken());
					if(file.exists()){
						file.delete();
					}
				}
			}
		}
		List<MultipartFile> files=mhsr.getFiles("mainImg");
		System.out.println("bfdsgds"+files.get(0).getOriginalFilename());
		if(files.get(0).getName()!=null&&!files.get(0).getName().equals("")) {
			vo.setClass_img(files.get(0).getOriginalFilename());
			File mainImg=new File(path, files.get(0).getOriginalFilename());
			try {
				files.get(0).transferTo(mainImg);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} 
		}
	
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd"); 
		String dateStr = null;
		Date date = new Date();
		dateStr = sdf.format(date); 
		
		int[] unitArray=vo.getUnitArray();
		String[] sectionCode=vo.getSectionCode();
		String[] unitContent=vo.getUnitContent();
		
		List<ClassVO> list =new ArrayList<ClassVO>();
		
		for(int i=0;i<sectionCode.length;i++){
			System.out.println("unitArray["+i+"]===>"+unitArray[i]);
			System.out.println("sectionCode["+i+"]===>"+sectionCode[i]);
			System.out.println("unitContent["+i+"]===>"+unitContent[i]);
			ClassVO vo2=new ClassVO();
			vo2.setCode(codes[i]);
			vo2.setUnit(unitArray[i]);
			if(sectionCode[i].equals("abc")) {
				int nextval=dao.selectNextSeq();
				String sc="sc"+dateStr+nextval;
				System.out.println("ssss=>"+sc);
				vo2.setSection_code(sc);
			}else {
				vo2.setSection_code(sectionCode[i]);
			}
			vo2.setUnit_content(unitContent[i]);
			dao.updateSection(vo2);
		}
		ClassUnitSort cus=new ClassUnitSort();
		Collections.sort(list,cus);
		int result=dao.updateClass(vo);
		ModelAndView mav=new ModelAndView();
		if(result>0) {
			mav.addObject("code",vo.getCode());
			mav.setViewName("redirect:adminClassView");
		}
		return mav;
	}
	@RequestMapping(value="/imgThumbnail",method=RequestMethod.POST,produces="application/text;charset=UTF-8" )
	@ResponseBody
	public String imgThumbnail(HttpSession session,MultipartHttpServletRequest mhsr,
			@RequestParam("code") String code) {
		ClassDaoImp dao=sqlSession.getMapper(ClassDaoImp.class);
		MultipartFile file=mhsr.getFile("file");
		String path=session.getServletContext().getRealPath("/upload/classImg");
		boolean isc=file.isEmpty();
		String filePath=null;
		if(!isc){
			String fName=file.getOriginalFilename();
			if(fName!=null&&!fName.equals("")) {
				String oriFileName=fName.substring(0,fName.lastIndexOf("."));
				String oriExt=fName.substring(fName.lastIndexOf("."));
				File newFile=new File(path,code+"_"+fName);
				if(newFile.exists()) {
					for (int renameNum=1;;renameNum++) {
						String renameFile=code+"_"+oriFileName+"("+renameNum+")"+oriExt;
						System.out.println("filename==> "+renameFile);
						newFile=new File(path,renameFile);
						if(!newFile.exists()) {
							fName=renameFile;
							break;
						}//if
					}//for
				}//if
				try {
					file.transferTo(newFile);
					String classImg=dao.selectClassImg2(code);
					classImg=classImg+newFile.getName()+",";
					dao.updateClassImg2(classImg, code);
					filePath="/gachi/upload/classImg/"+newFile.getName();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}//if
		}
		return filePath;
	}
	
	@RequestMapping(value="imageDelete",method = RequestMethod.GET)
	@ResponseBody
	public void imageDelete(HttpServletRequest req,HttpSession session) {
		ClassDaoImp dao=sqlSession.getMapper(ClassDaoImp.class);
		String path=session.getServletContext().getRealPath("/upload/classImg");
		String imageName=req.getParameter("imageName");
		System.out.println("imageName=>"+imageName);
		String code=req.getParameter("code");
		File file=new File(path,imageName);
		if(file.exists()) {
			file.delete();
		}
		String classImg=dao.selectClassImg2(code);
		StringTokenizer st=new StringTokenizer(classImg,",");
		String txt="";
		while (st.hasMoreTokens()) {
			String img=st.nextToken();
			if(img.equals(imageName)) {
				continue;
			}
			txt+=img+",";
		}
		System.out.println(txt);
		dao.updateClassImg2(txt, code);
	} 

	@RequestMapping(value="/mainImgUpdate",method=RequestMethod.POST,produces="application/text;charset=utf8")
	@ResponseBody
	public String mainImgUpdate(HttpSession session,HttpServletRequest req,
			MultipartHttpServletRequest mhsr){
		ClassDaoImp dao=sqlSession.getMapper(ClassDaoImp.class);
		System.out.println("Aaaaaaa");
		String path=session.getServletContext().getRealPath("/upload/classImg");
		String code=req.getParameter("code");
		String imageName=req.getParameter("imageName");
		String delFile=req.getParameter("delFile");
		System.out.println("code=>"+code);
		System.out.println("imgName=>"+imageName);
		System.out.println("delFile=>"+delFile);
		MultipartHttpServletRequest mr=(MultipartHttpServletRequest)req;
		
		File oldFile=new File(path,delFile);
		File newFile=new File(path,imageName);
		String filename=newFile.getName();
		if(filename!=null&&!filename.equals("")) {
			String oriFileName=filename.substring(0,filename.lastIndexOf("."));
			String oriExt=filename.substring(filename.lastIndexOf("."));
			File newFile1=new File(path,filename);
			if(newFile1.exists()) {
				for (int renameNum=1;;renameNum++) {
					String renameFile=oriFileName+"("+renameNum+")"+oriExt;
					System.out.println("filename==> "+renameFile);
					newFile=new File(path,renameFile);
					if(!newFile.exists()) {
						filename=renameFile;
						break;
					}
				}
	}
}
		return filename;
}
	
	
	@RequestMapping("/adminClassStateUpdate")
	public ModelAndView adminClassStateUpdate(@RequestParam("code") String code) {
		ClassDaoImp dao=sqlSession.getMapper(ClassDaoImp.class);
		int result=dao.updateClassState(code);
		ModelAndView mav=new ModelAndView();
		if(result>0) {
			mav.addObject("code",code);
			mav.setViewName("redirect:adminClassView");
		}
		return mav;
	} 
	
	
	@RequestMapping("/adminClassDel")
	public ModelAndView adminClassDel(@RequestParam("code") String code) {
		ClassDaoImp dao=sqlSession.getMapper(ClassDaoImp.class);
		int result=dao.deleteClass(code);
		ModelAndView mav=new ModelAndView();
		if(result<=0){
			mav.setViewName("admin/adminResult");
		}else{
			mav.setViewName("redirect:adminClass");
		}
		return mav;
	}
	@RequestMapping(value="/imageUpload",method=RequestMethod.POST)
	@ResponseBody
	public JsonObject imageUpload(HttpServletRequest req,@RequestParam MultipartFile upload,
			@RequestParam("type") String type) {
		HttpSession session=req.getSession();
		String path = null;
		if(type.equals("classEdit")) {
			path=session.getServletContext().getRealPath("/upload/classImg");
		}else if(type.equals("eventWrite")){
			path=session.getServletContext().getRealPath("/upload/event_img");
		}else if(type.equals("notice")){
			path=session.getServletContext().getRealPath("/upload/notice");
		}
		JsonObject json=new JsonObject();
		OutputStream ops=null;
		try {
			ops=new FileOutputStream(new File(path,upload.getOriginalFilename()));
			ops.write(upload.getBytes());
			json.addProperty("uploaded",1);
			json.addProperty("filename",upload.getOriginalFilename());
			json.addProperty("url","/gachi/upload/classImg/"+upload.getOriginalFilename());
			ops.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return json;
	}
	@RequestMapping("/adminMember")
	public ModelAndView adminMember(@RequestParam(value="now", required=false) String now) {
		
		int nowPage = 1;
		if(now != null && now.length() > 0){
			nowPage = Integer.parseInt(now);
		}
		int startNum = 20 * (nowPage - 1) + 1;
		int endNum = 20 * nowPage;
		
		MemberDaoImp dao = sqlSession.getMapper(MemberDaoImp.class);
		
		Map<String, String> dbParam = new HashMap<String, String>();
		dbParam.put("withdraw", null);
		dbParam.put("search", null);
		dbParam.put("startNum", startNum+"");
		dbParam.put("endNum", endNum+"");
		
		System.out.println("startNum:" + startNum);
		System.out.println("endNum:" + endNum);
		
		int cntRecords = dao.selectCntAllMember(dbParam);
		
		int lastPage = 1;
		if(cntRecords % 20 == 0) {
			lastPage = cntRecords / 20;
		} else {
			lastPage = cntRecords / 20 + 1;
		}
		System.out.println("cntRecords:" + cntRecords);
		System.out.println("lastPage:" + lastPage);
		
		List<MemberVO> list = dao.selectAllMember(dbParam); // �쟾泥� �쉶�썝 由ъ뒪�듃
		
		int countAllMember = dao.countAllMember(); // �쟾泥� �쉶�썝 紐� �닔 (�쁽�옱 �쉶�썝 + �깉�눜 �쉶�썝)
		int countNowMember = dao.countNowMember(); // �쁽�옱 �쉶�썝 紐� �닔
		int countDeletedMember = dao.countDeletedMember(); // �깉�눜 �쉶�썝 紐� �닔
		
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("method", "get");
		mav.addObject("memberList",list);
		mav.addObject("cntData", list.size());
		mav.addObject("lastPage", lastPage);
		mav.addObject("nowPage", nowPage);
		mav.addObject("countAllMember", countAllMember);
		mav.addObject("countNowMember", countNowMember);
		mav.addObject("countDeletedMember", countDeletedMember);
		mav.setViewName("admin/adminMember");
		
		return mav;
	}
	
	@RequestMapping(value="/adminMember", method=RequestMethod.POST)
	@ResponseBody
	public ModelAndView adminMember(HttpServletResponse resp, @RequestParam(value="withdraw", required=false) String withdraw, @RequestParam(value="search", required=false) String search, @RequestParam(value="now", required=false) String now) {
		System.out.println("adminMember post page");
		
		int nowPage = 1;
		if(now != null && now.length() > 0){
			nowPage = Integer.parseInt(now);
			System.out.println(nowPage);
		}
		int startNum = 20 * (nowPage - 1) + 1;
		int endNum = 20 * nowPage;
		
		ModelAndView mav = new ModelAndView();
		MemberDaoImp dao = sqlSession.getMapper(MemberDaoImp.class);
		
		if(withdraw.length() <= 0) withdraw = null;
		if(!search.equals(null)) {
			if(search.length() <= 0) search = null;
		}
		
		System.out.println("withdraw:" + withdraw);
		System.out.println("search:" + search);
		
		Map<String, String> dbParam = new HashMap<String, String>();
		dbParam.put("withdraw", withdraw);
		dbParam.put("search", search);
		dbParam.put("startNum", startNum + "");
		dbParam.put("endNum", endNum +"");
		
		System.out.println("startNum:" + startNum);
		System.out.println("endNum:" + endNum);
		
		int cntRecords = dao.selectCntAllMember(dbParam);
		
		int lastPage = 1;
		if(cntRecords % 20 == 0) {
			lastPage = cntRecords / 20;
		} else {
			lastPage = cntRecords / 20 + 1;
		}
		System.out.println("cntRecords:" + cntRecords);
		System.out.println("lastPage:" + lastPage);
		
		List<MemberVO> list = dao.selectAllMember(dbParam); // �쟾泥� �쉶�썝 由ъ뒪�듃
		int countAllMember = dao.countAllMember(); // �쟾泥� �쉶�썝 紐� �닔 (�쁽�옱 �쉶�썝 + �깉�눜 �쉶�썝)
		int countNowMember = dao.countNowMember(); // �쁽�옱 �쉶�썝 紐� �닔
		int countDeletedMember = dao.countDeletedMember(); // �깉�눜 �쉶�썝 紐� �닔
		
		System.out.println("lastPage:" + lastPage);
		if(list != null) {
			mav.addObject("method", "post");
			mav.addObject("memberList",list);
			mav.addObject("withdraw", withdraw);
			mav.addObject("nowPage", nowPage);
			mav.addObject("search", search);
			mav.addObject("cntData", list.size());
			mav.addObject("lastPage", lastPage);
			mav.addObject("countAllMember", countAllMember);
			mav.addObject("countNowMember", countNowMember);
			mav.addObject("countDeletedMember", countDeletedMember);
			try {
				mav.setViewName("admin/adminMember");
				resp.getWriter().write("{\"result\":\"success\"}");
				System.out.println("ajax success");
				return mav;
			} catch (Exception e) {
				e.printStackTrace();
			} 
//		} else {
//
//			try{
//				System.out.println("ajax error");
//				resp.getWriter().write("{\"result\":\"fail\"}");
//			} catch (IOException e) {
//	            e.printStackTrace();
//	        }
		}
		
		return null;
	}
	@RequestMapping("/adminMemberView")
	public ModelAndView adminMemberView(String userid) {
		
		MemberDaoImp dao = sqlSession.getMapper(MemberDaoImp.class);
		
		MemberVO vo = dao.selectMember(userid);
		ModelAndView mav = new ModelAndView();	
		
		mav.addObject("vo",vo);		
		mav.setViewName("admin/adminMemberView");
		return mav;
	}
	@RequestMapping(value="/adminMemberEditOk",method=RequestMethod.POST)
	public ModelAndView adminMemberEditOk(MemberVO vo) {

		MemberDaoImp dao = sqlSession.getMapper(MemberDaoImp.class);	
		int result = dao.MemberUpdate(vo);	
		ModelAndView mav = new ModelAndView();	
		
		mav.addObject("result", result);
		mav.setViewName("admin/adminMemberEditOk");
		
	return mav;
	}
	
	@RequestMapping("/adminMemberLeaveEditOk")
	public ModelAndView adminMemberLeaveEditOk(String userid) {

		MemberDaoImp dao = sqlSession.getMapper(MemberDaoImp.class);	
		int result = dao.leaveMemberUpdate(userid);
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("result", result);
		mav.setViewName("admin/adminMemberLeaveEditOk");
		
	return mav;
	}

//	@RequestMapping("/adminMemberDelete")
//	public ModelAndView adminMemberDelete(String userid) {
//		MemberDaoImp dao = sqlSession.getMapper(MemberDaoImp.class);
//		int result = dao.adminMemberDelete(userid);
//		
//		ModelAndView mav = new ModelAndView();
//		
//		if(result >0) {
//			mav.addObject("result", result);
//			mav.setViewName("redirect:adminMember");
//		}else {
//			mav.setViewName("gachi/adminResult");
//		}
//		return mav;
//	}
	@RequestMapping("/adminNotice")
	public ModelAndView adminNotice(NoticePageVO npvo,HttpServletRequest req) {
		NoticeDaoImp dao=sqlSession.getMapper(NoticeDaoImp.class);
		String nowPageRequest=req.getParameter("nowPage");
		if(nowPageRequest!=null) {
			npvo.setNowPage(Integer.parseInt(nowPageRequest));
		}
		
		System.out.println("option==>"+npvo.getOption());
		System.out.println("searchWord==>"+npvo.getSearchWord());
		int totalRecord=dao.getAllRecord(npvo);
		npvo.setTotalRecord(totalRecord);
		
		List<NoticeVO> list=dao.selectList(npvo);
		ModelAndView mav=new ModelAndView();
		mav.addObject("list",list);
		mav.addObject("npvo",npvo);
		mav.setViewName("admin/adminNotice");
		return mav;
	}
	
	@RequestMapping("/adminNoticeView")
	public ModelAndView adminNoticeView(@RequestParam("notice_num") int noticeNum,
			@RequestParam("nowPage") int nowPage) {
		NoticeDaoImp dao=sqlSession.getMapper(NoticeDaoImp.class);
		NoticeVO vo=dao.selectNotice(noticeNum);
		ModelAndView mav=new ModelAndView();
		mav.addObject("vo",vo);
		mav.addObject("nowPage",nowPage);
		mav.setViewName("admin/adminNoticeView");
		return mav;
	}
	@RequestMapping("/adminNoticeEdit")
	public ModelAndView adminNoticeEdit(@RequestParam("notice_num") int noticeNum,
			@RequestParam("nowPage") int nowPage) {
		NoticeDaoImp dao=sqlSession.getMapper(NoticeDaoImp.class);
		NoticeVO vo=dao.selectNotice(noticeNum);
		ModelAndView mav=new ModelAndView();
		mav.addObject("vo",vo);
		mav.addObject("nowPage",nowPage);
		mav.setViewName("admin/adminNoticeEdit");
		return mav;
	}
	@RequestMapping("/adminNoticeEditOk")
	public ModelAndView adminNoticeEditOk(NoticeVO vo,
			@RequestParam("nowPage") int nowPage) {
		NoticeDaoImp dao=sqlSession.getMapper(NoticeDaoImp.class);
		int result=dao.updateNotice(vo);
		ModelAndView mav=new ModelAndView();
		if(result>0){
			mav.addObject("notice_num",vo.getNotice_num());
			mav.addObject("nowPage",nowPage);
			mav.setViewName("redirect:adminNoticeView");
		}else {
			mav.addObject("msg","怨듭��궗�빆 �닔�젙�뿉 �떎�뙣�븯���뒿�땲�떎. �뮘濡� �룎�븘媛묐땲�떎.");
			mav.setViewName("admin/adminNoticeResult");
		}
		return mav;
	}
	@RequestMapping("/adminNoticeDel")
	public ModelAndView adminNoticeDel(@RequestParam("notice_num") int notice_num,
			@RequestParam("nowPage") int nowPage) {
		NoticeDaoImp dao=sqlSession.getMapper(NoticeDaoImp.class);
		int result=dao.deleteNotice(notice_num);
		NoticePageVO npvo=new NoticePageVO();
		npvo.setNowPage(nowPage);
		ModelAndView mav=new ModelAndView();
		if(result>0) {
			mav.addObject("npvo", npvo);
			mav.setViewName("redirect:adminNotice");
		}else{
			mav.addObject("msg","怨듭��궗�빆 �궘�젣瑜� �떎�뙣�븯���뒿�땲�떎. �뮘濡� �룎�븘媛묐땲�떎.");
			mav.setViewName("admin/adminNoticeResult");
		}
		return mav;
	}
	
	@RequestMapping("/adminNoticeWrite")
	public String adminNoticeWrite() {
		return "admin/adminNoticeWrite";
	}
	
	@RequestMapping(value="/adminNoticeWriteOk",method = RequestMethod.POST)
	public ModelAndView adminNoticeWriteOk(NoticeVO vo,MultipartFile file) {
		vo.setFilename(vo.getInput_file().getOriginalFilename());
		NoticeDaoImp dao=sqlSession.getMapper(NoticeDaoImp.class);
		int result=dao.insertNotice(vo);
		ModelAndView mav=new ModelAndView();
		if(result>0) {
			mav.setViewName("redirect:adminNotice");	
		}else{
			String msg="怨듭��궗�빆 �벑濡앹쓣 �떎�뙣�븯���뒿�땲�떎. 怨듭��궗�빆 �벐湲곕줈 �룎�븘媛묐땲�떎.";
			mav.addObject("msg", msg);
			mav.setViewName("admin/adminNoticeResult");
		}
		return mav;
	}
	@RequestMapping("/adminEvent")
	public ModelAndView adminEvent(@RequestParam(value="now", required=false) String now) {
		
		int nowPage = 1;
		if(now != null && now.length() > 0){
			nowPage = Integer.parseInt(now);
		}
		int startNum = 20 * (nowPage - 1) + 1;
		int endNum = 20 * nowPage;
		
		ModelAndView mav =new ModelAndView();
		EventDaoImp dao = sqlSession.getMapper(EventDaoImp.class);
//		SettleDaoImp sdao = sqlSession.getMapper(SettleDaoImp.class);
		
		SimpleDateFormat  yyyymmdd = new SimpleDateFormat("yyyy-MM-dd");
		String todate =  yyyymmdd.format(new Date());
		String startDate = todate.substring(0, 8) + "01";
		String endDate = todate;
		
		Map<String, String> dbParam = new HashMap<String, String>();
		dbParam.put("startDate", startDate);
		dbParam.put("endDate", endDate);
		dbParam.put("search", null);
		dbParam.put("startNum", startNum+"");
		dbParam.put("endNum", endNum+"");
		
//		int cntRecords = sdao.selectCntAllGoods(dbParam);
		int cntRecords = dao.selectCntAllEvent(dbParam);
		int lastPage = 1;
		if(cntRecords % 20 == 0) {
			lastPage = cntRecords / 20;
		} else {
			lastPage = cntRecords / 20 + 1;
		}
//		List<SettleVO> list = sdao.selectStoreList(dbParam); // �쟾泥� �긽�뭹 由ъ뒪�듃
		
		List<EventVO> list = dao.selectEventList(dbParam);
		dao = sqlSession.getMapper(EventDaoImp.class);
		
		mav.addObject("method", "get");
		mav.addObject("list",list);
		mav.addObject("cntData", list.size());
		mav.addObject("lastPage", lastPage);
		mav.addObject("nowPage", nowPage);
		
		mav.addObject("startDate", startDate);
		mav.addObject("endDate", endDate);
		mav.addObject("search", null);

		
		System.out.println("nowPage===GET===="+nowPage);
		System.out.println("lastPage====GET==="+lastPage);
		System.out.println("list.size()===GET===="+list.size());
		
		
//		mav.addObject("data", result);
		mav.setViewName("admin/adminEvent");
	
		return mav;
	}
	
	
	@RequestMapping(value="/adminEvent", method=RequestMethod.POST)
	@ResponseBody
	public ModelAndView adminEvent(HttpServletRequest req, HttpServletResponse resp, @RequestParam(value="startDate", required=false) String startDate, @RequestParam(value="endDate", required=false) String endDate,
			@RequestParam(value="search", required=false) String search,
			@RequestParam(value="now", required=false) String now){
		
		int nowPage = 1;
		if(now != null && now.length() > 0){
			nowPage = Integer.parseInt(now);
		}
		int startNum = 20 * (nowPage - 1) + 1;
		int endNum = 20 * nowPage;
		
		ModelAndView mav =new ModelAndView();
		EventDaoImp dao = sqlSession.getMapper(EventDaoImp.class);
//		SettleDaoImp sdao = sqlSession.getMapper(SettleDaoImp.class);

		if(startDate==null || endDate == null) {
			System.out.println("startMonth is null");
			
			SimpleDateFormat  yyyymmdd = new SimpleDateFormat("yyyy-MM-dd");
			String todate =  yyyymmdd.format(new Date());
			
			startDate = todate.substring(0, 8) + "01";
			endDate = todate;
		} 
		
		if(search.length() <= 0) search = null;

		Map<String, String> dbParam = new HashMap<String, String>();
		dbParam.put("startDate", startDate);
		dbParam.put("endDate", endDate);
		dbParam.put("search", search);
		dbParam.put("startNum", startNum+"");
		dbParam.put("endNum", endNum+"");
		
//		int cntRecords = sdao.selectCntAllGoods(dbParam);
		int cntRecords = dao.selectCntAllEvent(dbParam);
		int lastPage = 1;
		if(cntRecords % 20 == 0) {
			lastPage = cntRecords / 20;
		} else {
			lastPage = cntRecords / 20 + 1;
		}
		List<EventVO> list = dao.selectEventList(dbParam);
		dao = sqlSession.getMapper(EventDaoImp.class);
		
		if(startDate != null && endDate != null && list != null) {
			
			mav.addObject("method", "post");
			mav.addObject("list",list);
			mav.addObject("nowPage", nowPage);
			mav.addObject("cntData", list.size());
			mav.addObject("lastPage", lastPage);
			
			mav.addObject("startDate", startDate);
			mav.addObject("endDate", endDate);
			mav.addObject("search", search);

			System.out.println("ajax success");
			try {
				mav.setViewName("admin/adminEvent");
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
	@RequestMapping("/adminEventView")
	public ModelAndView adminEventView(String event_num) {
		
		EventDaoImp dao = sqlSession.getMapper(EventDaoImp.class);
		EventVO vo = dao.selectEvent(event_num);
		ModelAndView mav = new ModelAndView();	
		
		mav.addObject("vo",vo);		
		mav.setViewName("admin/adminEventView");
		return mav;
	}
	
	@RequestMapping(value="/adminEventEditOk",method = RequestMethod.POST)
	public ModelAndView adminEventEditOk(HttpSession session, EventVO vo, Object img_event, Object img_content,
			MultipartHttpServletRequest mhsr) {
		String path=session.getServletContext().getRealPath("/upload/eventImg");
		
		MultipartFile event_img = mhsr.getFile("img_event");
		if(!event_img.equals(null) && event_img != null) {
			boolean isc = event_img.isEmpty();

			if(!isc){
//				원래 img_event 삭제.
				String imageName=vo.getEvent_img();
				System.out.println(imageName);
				
				File file=new File(path,imageName);
				if(file.exists()) {
					file.delete();
				}
//				그리고 새로운 event_img upload.
				
//				OutputStream ops = null;
				String filePath = null;
				
				String fName=event_img.getOriginalFilename();
				if(fName!=null&&!fName.equals("")) {
					SimpleDateFormat  yyyymmdd = new SimpleDateFormat("yyyyMMddhhmmss");
					String todate =  yyyymmdd.format(new Date());
					String oriFileName=fName.substring(0,fName.lastIndexOf("."));
					String oriExt=fName.substring(fName.lastIndexOf("."));
					File newFile=new File(path,todate + "_" + fName);
					vo.setEvent_img(newFile.getName());
					if(newFile.exists()) {
						for (int renameNum=1;;renameNum++) {
							String renameFile= todate + "_"+oriFileName+"("+renameNum+")"+oriExt;
							System.out.println("filename==> "+renameFile);
							newFile=new File(path,renameFile);
							if(!newFile.exists()) {
								fName=renameFile;
								break;
							}//if
						}//for
					}//if
					try {
						event_img.transferTo(newFile);
						System.out.println("newFile:" + newFile);

						vo.setEvent_img(newFile.getName());
						
						filePath="/gachi/upload/eventImg/"+newFile.getName();
					} catch (Exception e) {
						e.printStackTrace();
					}
				}//if
			}//isc
		}//null
		
		MultipartFile content = mhsr.getFile("img_content");
		if(!event_img.equals(null) && event_img != null) {
			boolean isc = content.isEmpty();

			if(!isc){
//				원래 img_content 삭제.
				String imageName=vo.getContent();
				System.out.println(imageName);
				
				File file=new File(path,imageName);
				if(file.exists()) {
					file.delete();
				}
//				그리고 새로운 content upload.
			
//				OutputStream ops = null;	
				String filePath = null;
				
				String fName=content.getOriginalFilename();
				if(fName!=null&&!fName.equals("")) {
					SimpleDateFormat  yyyymmdd = new SimpleDateFormat("yyyyMMddhhmmss");
					String todate =  yyyymmdd.format(new Date());
					String oriFileName=fName.substring(0,fName.lastIndexOf("."));
					String oriExt=fName.substring(fName.lastIndexOf("."));
					File newFile=new File(path,todate + "_" + fName);
					vo.setContent(newFile.getName());
					if(newFile.exists()) {
						for (int renameNum=1;;renameNum++) {
							String renameFile= todate + "_"+oriFileName+"("+renameNum+")"+oriExt;
							System.out.println("filename==> "+renameFile);
							newFile=new File(path,renameFile);
							if(!newFile.exists()) {
								fName=renameFile;
								break;
							}//if
						}//for
					}//if
					try {
						content.transferTo(newFile);
						System.out.println("newFile:" + newFile);

						vo.setContent(newFile.getName());
						
						filePath="/gachi/upload/eventImg/"+newFile.getName();
					} catch (Exception e) {
						e.printStackTrace();
					}
				}//if
			}//isc
		}//null
		
		EventDaoImp dao=sqlSession.getMapper(EventDaoImp.class);
		int result=dao.updateEvent(vo);
		ModelAndView mav=new ModelAndView();
		if(result>0) {
//			mav.addObject("event_num",vo.getEvent_num());
			mav.setViewName("redirect:adminEventView?event_num="+vo.getEvent_num());
		}
		return mav;
	}
	
	@RequestMapping("/adminEventWrite")
	public ModelAndView adminEventWrite() {
		ModelAndView mav = new ModelAndView();
		
		SimpleDateFormat  yyyymmdd = new SimpleDateFormat("yyyy-MM-dd");
		String todate =  yyyymmdd.format(new Date());
		
		mav.addObject("todate", todate);
		mav.setViewName("admin/adminEventWrite");
		return mav;
	}
	
	@RequestMapping(value="/adminEventWriteOk",method = RequestMethod.POST)
	public ModelAndView adminEventWriteOk(HttpSession session, EventVO vo, Object img_event, Object img_content,
			MultipartHttpServletRequest mhsr) {
		EventDaoImp dao=sqlSession.getMapper(EventDaoImp.class);
//		MultipartFile file=mhsr.getFile("file");
		
		MultipartFile event_img = mhsr.getFile("img_event");
		MultipartFile content = mhsr.getFile("img_content");
		
//		OutputStream ops = null;
		String path=session.getServletContext().getRealPath("/upload/eventImg");
		boolean isc = event_img.isEmpty();
		String filePath = null;
		if(!isc){
			String fName=event_img.getOriginalFilename();
			if(fName!=null&&!fName.equals("")) {
				SimpleDateFormat  yyyymmdd = new SimpleDateFormat("yyyyMMddhhmmss");
				String todate =  yyyymmdd.format(new Date());
				String oriFileName=fName.substring(0,fName.lastIndexOf("."));
				String oriExt=fName.substring(fName.lastIndexOf("."));
				File newFile=new File(path,todate + "_" + fName);
				vo.setEvent_img(newFile.getName());
				System.out.println(newFile.getName());
				if(newFile.exists()) {
					for (int renameNum=1;;renameNum++) {
						String renameFile= todate + "_"+oriFileName+"("+renameNum+")"+oriExt;
						System.out.println("filename==> "+renameFile);
						newFile=new File(path,renameFile);
						if(!newFile.exists()) {
							fName=renameFile;
							break;
						}//if
					}//for
				}//if
				try {
					event_img.transferTo(newFile);
					System.out.println("newFile:" + newFile);
//					String eventImg=dao.selectEventImg(event_num);
//					eventImg=eventImg+newFile.getName()+",";
					vo.setEvent_img(newFile.getName());
					
					filePath="/gachi/upload/eventImg/"+newFile.getName();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}//if
		}//isc
		
		boolean isc2 = content.isEmpty();
		String filePath2 = null;
		if(!isc2){
			String fName=content.getOriginalFilename();
			if(fName!=null&&!fName.equals("")) {
				SimpleDateFormat  yyyymmdd = new SimpleDateFormat("yyyyMMddhhmmss");
				String todate =  yyyymmdd.format(new Date());
				String oriFileName=fName.substring(0,fName.lastIndexOf("."));
				String oriExt=fName.substring(fName.lastIndexOf("."));
				File newFile=new File(path,todate+"_" + fName);
				vo.setContent(newFile.getName());
				System.out.println(newFile.getName());
				if(newFile.exists()) {
					for (int renameNum=1;;renameNum++) {
						String renameFile= todate + "_"+oriFileName+"("+renameNum+")"+oriExt;
						System.out.println("filename==> "+renameFile);
						newFile=new File(path,renameFile);
						if(!newFile.exists()) {
							fName=renameFile;
							break;
						}//if
					}//for
				}//if
				try {
					content.transferTo(newFile);
					System.out.println("newFile:" + newFile);
//					String eventImg=dao.selectEventImg(event_num);
//					eventImg=eventImg+newFile.getName()+",";
					vo.setContent(newFile.getName());
					filePath2="/gachi/upload/eventImg/"+newFile.getName();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}//if
		}//isc
		
		dao.insertEvent(vo);
		ModelAndView mav=new ModelAndView();
		mav.setViewName("redirect:adminEvent");
		return mav;
	}

	@RequestMapping(value="/adminEventDelete", method=RequestMethod.GET)
	public ModelAndView adminEventDelete(String event_num, HttpSession session) {
		
		EventDaoImp dao = sqlSession.getMapper(EventDaoImp.class);
		EventVO vo = dao.selectEvent(event_num);
		
		// 관련 이미지 삭제
		String path=session.getServletContext().getRealPath("/upload/eventImg");
		String content = vo.getContent();
		System.out.println(content);
		
		File file=new File(path,content);
		if(file.exists()) {
			file.delete();
		}
		String event_img = vo.getEvent_img();
		System.out.println(event_img);
		
		File file2=new File(path,event_img);
		if(file2.exists()) {
			file2.delete();
		}
		
		dao.deleteOne(event_num);
		
		ModelAndView mav = new ModelAndView();	
		
		mav.setViewName("redirect:adminEvent");
		return mav;
	}
	
	@RequestMapping(value="/EventimgThumbnail",method=RequestMethod.POST,produces="application/text;charset=UTF-8" )
	@ResponseBody
	public String EventimgThumbnail(HttpSession session,MultipartHttpServletRequest mhsr,
			@RequestParam("event_num") String event_num, Object event_img, Object txt) {
		EventDaoImp dao=sqlSession.getMapper(EventDaoImp.class);
		MultipartFile file=mhsr.getFile("file");
		OutputStream ops=null;
		String path=session.getServletContext().getRealPath("/upload/eventImg");
		boolean isc=file.isEmpty();
		String filePath=null;
		if(!isc){
			String fName=file.getOriginalFilename();
			if(fName!=null&&!fName.equals("")) {
				String oriFileName=fName.substring(0,fName.lastIndexOf("."));
				String oriExt=fName.substring(fName.lastIndexOf("."));
				File newFile=new File(path,event_num+"_"+fName);
				if(newFile.exists()) {
					for (int renameNum=1;;renameNum++) {
						String renameFile=event_num+"_"+oriFileName+"("+renameNum+")"+oriExt;
						System.out.println("filename==> "+renameFile);
						newFile=new File(path,renameFile);
						if(!newFile.exists()) {
							fName=renameFile;
							break;
						}//if
					}//for
				}//if
				try {
					file.transferTo(newFile);
					System.out.println("newFile:" + newFile);
					String eventImg=dao.selectEventImg(event_num);
					eventImg=eventImg+newFile.getName()+",";
					dao.updateEventImg(txt, event_num);
					filePath="/gachi/upload/eventImg/"+newFile.getName();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}//if
		}
		System.out.println("filePath:" + filePath);
		return filePath;
	}
	
	@RequestMapping(value="EventimageDelete",method = RequestMethod.POST)
	@ResponseBody
	public void EventimageDelete(HttpServletRequest req,HttpSession session) throws UnsupportedEncodingException {
		req.setCharacterEncoding("UTF-8");
		
		EventDaoImp dao=sqlSession.getMapper(EventDaoImp.class);
		String path=session.getServletContext().getRealPath("/upload/eventImg");
		String imageName=req.getParameter("imageName");
		System.out.println(imageName);
		String event_num=req.getParameter("event_num");
		System.out.println(event_num);
		File file=new File(path,imageName);
		if(file.exists()) {
			file.delete();
			String eventImg=dao.selectEventImg(event_num);
			StringTokenizer st=new StringTokenizer(eventImg,",");
			String txt="";
			while (st.hasMoreTokens()) {
				String img=st.nextToken();
				if(img.equals(imageName)) {
					continue;
				}
				txt+=img+",";
			}
			Map<String, String> dbParam = new HashMap<String, String>();
			dao.updateEventImg(txt, event_num);
		}
	} 
	
	
	@RequestMapping(value="/EventimageUpload",method=RequestMethod.POST)
	@ResponseBody
	public JsonObject EventimageUpload(HttpServletRequest req,@RequestParam MultipartFile upload,
			@RequestParam("type") String type) {
		HttpSession session=req.getSession();
		String path = null;
		if(type.equals("EventEdit")) {
			path=session.getServletContext().getRealPath("/upload/eventImg");
		}
		else if(type.equals("EventWrite")) {
			path=session.getServletContext().getRealPath("/upload/eventImg");
		}
		JsonObject json=new JsonObject();
		OutputStream ops=null;
		try {
			ops=new FileOutputStream(new File(path,upload.getOriginalFilename()));
			ops.write(upload.getBytes());
			json.addProperty("uploaded",1);
			json.addProperty("filename",upload.getOriginalFilename());
			json.addProperty("url","/gachi/upload/eventImg/"+upload.getOriginalFilename());
			ops.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return json;
	}
	@RequestMapping("/admin1on1")
	public String admin1on1() {
		return "admin/admin1on1";
	}
	@RequestMapping("/admin1on1View")
	public String admin1on1View() {
		return "admin/admin1on1View";
	}
	@RequestMapping("/admin1on1Write")
	public String admin1on1Write() {
		return "admin/admin1on1Write";
	}

	@RequestMapping(value="/adminOrder", method=RequestMethod.POST)
	@ResponseBody
	public ModelAndView adminOrder(HttpServletRequest req, HttpServletResponse resp, @RequestParam(value="startDate", required=false) String startDate, @RequestParam(value="endDate", required=false) String endDate,
			@RequestParam(value="state", required=false) String state, @RequestParam(value="payment_type", required=false) String payment_type , 
			@RequestParam(value="search", required=false) String search,
			@RequestParam(value="now", required=false) String now){
		
		int nowPage = 1;
		if(now != null && now.length() > 0){
			nowPage = Integer.parseInt(now);
		}
		int startNum = 20 * (nowPage - 1) + 1;
		int endNum = 20 * nowPage;
		
		ModelAndView mav =new ModelAndView();
		OrderDaoImp dao = sqlSession.getMapper(OrderDaoImp.class);
//		SettleDaoImp sdao = sqlSession.getMapper(SettleDaoImp.class);
		
		if(startDate==null || endDate == null) {
			System.out.println("startMonth is null");
			
			SimpleDateFormat  yyyymmdd = new SimpleDateFormat("yyyy-MM-dd");
			String todate =  yyyymmdd.format(new Date());
			
			startDate = todate.substring(0, 8) + "01";
			endDate = todate;
		} 
		
		if(state.length() <= 0) state = null;
		if(payment_type.length() <= 0) payment_type = null;
		
		if(search.length() <= 0) search = null;

		
		Map<String, String> dbParam = new HashMap<String, String>();
		dbParam.put("startDate", startDate);
		dbParam.put("endDate", endDate);
		dbParam.put("state", state);
		dbParam.put("payment_type", payment_type);
		dbParam.put("search", search);
		dbParam.put("startNum", startNum+"");
		dbParam.put("endNum", endNum+"");
		
		dao = sqlSession.getMapper(OrderDaoImp.class);
				
		int cntRecords = dao.selectCntAllOrder(dbParam);
		
		int lastPage = 1;
		if(cntRecords % 20 == 0) {
			lastPage = cntRecords / 20;
		} else {
			lastPage = cntRecords / 20 + 1;
		}
		;
		List<OrderVO> result = dao.selectAllOrder(dbParam);
		
		
		if(startDate != null && endDate != null && result != null) {
			
			mav.addObject("method", "post");
			mav.addObject("result",result);
			mav.addObject("nowPage", nowPage);
			mav.addObject("cntData", result.size());
			mav.addObject("lastPage", lastPage);
			
			mav.addObject("startDate", startDate);
			mav.addObject("endDate", endDate);
			mav.addObject("state", state);
			mav.addObject("payment_type", payment_type);
			mav.addObject("search", search);
//			mav.addObject("data", result);
			
			
	
			try {
				//resp.getWriter().write("{\"result\":\"success\"}");
				mav.setViewName("admin/adminOrder");
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
	@RequestMapping("/adminOrder")
	public ModelAndView adminOrder(@RequestParam(value="now", required=false) String now) {
		int nowPage = 1;
		if(now != null && now.length() > 0){
			nowPage = Integer.parseInt(now);
		}
		int startNum = 20 * (nowPage - 1) + 1;
		int endNum = 20 * nowPage;
		
		ModelAndView mav =new ModelAndView();
		
		SimpleDateFormat  yyyymmdd = new SimpleDateFormat("yyyy-MM-dd");
		String todate =  yyyymmdd.format(new Date());
		String startDate = todate.substring(0, 8) + "01";
		String endDate = todate;
		
		Map<String, String> dbParam = new HashMap<String, String>();
		dbParam.put("startDate", startDate);
		dbParam.put("endDate", endDate);
		dbParam.put("state", null);
		dbParam.put("payment_type", null);
		dbParam.put("search", null);
		dbParam.put("startNum", startNum+"");
		dbParam.put("endNum", endNum+"");
		
		OrderDaoImp dao = sqlSession.getMapper(OrderDaoImp.class);
		dao = sqlSession.getMapper(OrderDaoImp.class);
				
		int cntRecords = dao.selectCntAllOrder(dbParam);
		
		int lastPage = 1;
		if(cntRecords % 20 == 0) {
			lastPage = cntRecords / 20;
		} else {
			lastPage = cntRecords / 20 + 1;
		}
		;
		List<OrderVO> result = dao.selectAllOrder(dbParam);
		
		
		mav.addObject("startDate", startDate);
		mav.addObject("endDate", endDate);
		
		mav.addObject("method", "get");
		mav.addObject("result",result);
		mav.addObject("cntData", result.size());
		mav.addObject("lastPage", lastPage);
		mav.addObject("nowPage", nowPage);
		
		mav.addObject("startDate", startDate);
		mav.addObject("endDate", endDate);
		mav.addObject("state", null);
		mav.addObject("payment_type", null);
		mav.addObject("search", null);


//		mav.addObject("data", result);
		mav.setViewName("admin/adminOrder");
	
		return mav;
	}
	@RequestMapping("/adminOrderView")
	public String adminOrderView() {
		return "admin/adminOrderView";
	}
	@RequestMapping("/adminStore")
	public String adminStore() {
		return "admin/adminStore";
	}
	@RequestMapping("/adminDelivery")
	public ModelAndView adminDelivery(@RequestParam(value="now", required=false) String now) {
		int nowPage = 1;
		if(now != null && now.length() > 0){
			nowPage = Integer.parseInt(now);
		}
		int startNum = 20 * (nowPage - 1) + 1;
		int endNum = 20 * nowPage;
		
		SettleDaoImp dao = sqlSession.getMapper(SettleDaoImp.class);
		
		Map<String, String> dbParam = new HashMap<String, String>();
		dbParam.put("state", null);
		dbParam.put("search", null);
		dbParam.put("startNum", startNum+"");
		dbParam.put("endNum", endNum+"");
		
		System.out.println("startNum:" + startNum);
		System.out.println("endNum:" + endNum);
		
		int cntRecords = dao.selectCntAllDelivery(dbParam);
		
		int lastPage = 1;
		if(cntRecords % 20 == 0) {
			lastPage = cntRecords / 20;
		} else {
			lastPage = cntRecords / 20 + 1;
		}
		System.out.println("cntRecords:" + cntRecords);
		System.out.println("lastPage:" + lastPage);
		
		List<MemberVO> list = dao.selectAllDelivery(dbParam); // 전체 리스트
		
		int countWaitDelivery = dao.countWaitDelivery(); // 배송대기 카운트 
		int countDelivery = dao.countDelivery(); // 배송중 카운트
		int countEndDelivery = dao.countEndDelivery(); // 배송완료 카운트
		int countdeposit = dao.countdeposit(); // 결제완료 카운트
		
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("method", "get");
		mav.addObject("deliveryList",list);
		mav.addObject("cntData", list.size());
		mav.addObject("lastPage", lastPage);
		mav.addObject("nowPage", nowPage);
		mav.addObject("countWaitDelivery", countWaitDelivery);
		mav.addObject("countDelivery", countDelivery);
		mav.addObject("countEndDelivery", countEndDelivery);
		mav.addObject("countdeposit", countdeposit);
		mav.setViewName("admin/adminDelivery");
		
		return mav;
	}
	
	@RequestMapping(value="/adminDelivery", method=RequestMethod.POST)
	@ResponseBody
	public ModelAndView adminDelivery(HttpServletResponse resp, @RequestParam(value="state", required=false) String state, @RequestParam(value="search", required=false) String search, @RequestParam(value="now", required=false) String now) {
		
		int nowPage = 1;
		if(now != null && now.length() > 0){
			nowPage = Integer.parseInt(now);
			System.out.println(nowPage);
		}
		int startNum = 20 * (nowPage - 1) + 1;
		int endNum = 20 * nowPage;
		
		ModelAndView mav = new ModelAndView();
		SettleDaoImp dao = sqlSession.getMapper(SettleDaoImp.class);
		
		if(state.length() <= 0) state = null;
		if(!search.equals(null)) {
			if(search.length() <= 0) search = null;
		}
		
		System.out.println("state:" + state);
		System.out.println("search:" + search);
		
		Map<String, String> dbParam = new HashMap<String, String>();
		dbParam.put("state", state);
		dbParam.put("search", search);
		dbParam.put("startNum", startNum + "");
		dbParam.put("endNum", endNum +"");
		
		System.out.println("startNum:" + startNum);
		System.out.println("endNum:" + endNum);
		
		int cntRecords = dao.selectCntAllDelivery(dbParam);
		
		int lastPage = 1;
		if(cntRecords % 20 == 0) {
			lastPage = cntRecords / 20;
		} else {
			lastPage = cntRecords / 20 + 1;
		}
		System.out.println("cntRecords:" + cntRecords);
		System.out.println("lastPage:" + lastPage);
		
		List<MemberVO> list = dao.selectAllDelivery(dbParam); // 전체 리스트
		
		int countWaitDelivery = dao.countWaitDelivery(); // 배송대기 카운트 
		int countDelivery = dao.countDelivery(); // 배송중 카운트
		int countEndDelivery = dao.countEndDelivery(); // 배송완료 카운트
		int countdeposit = dao.countdeposit(); // 결제완료 카운트
		
		
		if(list != null) {
			mav.addObject("method", "post");
			mav.addObject("deliveryList",list);
			mav.addObject("state", state);
			mav.addObject("nowPage", nowPage);
			mav.addObject("search", search);
			mav.addObject("cntData", list.size());
			mav.addObject("lastPage", lastPage);
			mav.addObject("countWaitDelivery", countWaitDelivery);
			mav.addObject("countDelivery", countDelivery);
			mav.addObject("countEndDelivery", countEndDelivery);
			mav.addObject("countdeposit", countdeposit);
			try {
				mav.setViewName("admin/adminDelivery");
				resp.getWriter().write("{\"result\":\"success\"}");
				System.out.println("ajax success");
				return mav;
			} catch (Exception e) {
				e.printStackTrace();
			} 

		}
		
		return null;
	}
	
	@RequestMapping("/adminDeliveryView")
	public ModelAndView adminDeliveryView(String code) {
		
		SettleDaoImp dao = sqlSession.getMapper(SettleDaoImp.class);
		
		SettleVO list = dao.selectDelivery(code);
		ModelAndView mav = new ModelAndView();	
		
		mav.addObject("list",list);		
		mav.setViewName("admin/adminDeliveryView");
		return mav;
	}

	@RequestMapping(value="/adminDeliveryEditOk",method=RequestMethod.POST)
	   public ModelAndView adminDeliveryEditOk(SettleVO vo) {

	      SettleDaoImp dao = sqlSession.getMapper(SettleDaoImp.class);
	      
	      String delivery = vo.getDelivery();
	      String state= vo.getState();
	      String order_code = vo.getOrder_code();
	      
	      
	      Map<String, String> dbParam = new HashMap<String, String>();
	      dbParam.put("state", state);
	      dbParam.put("delivery", delivery);
	      dbParam.put("order_code",order_code);
	      
	      int DeliveryUpdate = dao.DeliveryUpdate(dbParam);
	      ModelAndView mav = new ModelAndView();   
	      
	         mav.addObject("state", state);
	         mav.addObject("delivery", delivery);
	         mav.addObject("order_code", order_code);
	         
	        System.out.println("order_code"+order_code);
	        System.out.println("delivery"+delivery); 
	        System.out.println("state"+state); 
	        
	         mav.setViewName("redirect:adminDelivery");
	         
	      return mav;
	   }
	
	@RequestMapping("/adminGoods")
	public ModelAndView adminGoods(@RequestParam(value="now", required=false) String now) {
		
		int nowPage = 1;
		if(now != null && now.length() > 0){
			nowPage = Integer.parseInt(now);
		}
		int startNum = 20 * (nowPage - 1) + 1;
		int endNum = 20 * nowPage;
		
		ModelAndView mav =new ModelAndView();
		GoodsDaoImp dao = sqlSession.getMapper(GoodsDaoImp.class);
//		SettleDaoImp sdao = sqlSession.getMapper(SettleDaoImp.class);
		
		SimpleDateFormat  yyyymmdd = new SimpleDateFormat("yyyy-MM-dd");
		String todate =  yyyymmdd.format(new Date());
		String startDate = todate.substring(0, 8) + "01";
		String endDate = todate;
		
		Map<String, String> dbParam = new HashMap<String, String>();
		dbParam.put("startDate", startDate);
		dbParam.put("endDate", endDate);
		dbParam.put("category", null);
		dbParam.put("sale_State", null);
		dbParam.put("search", null);
		dbParam.put("startNum", startNum+"");
		dbParam.put("endNum", endNum+"");
		
//		int cntRecords = sdao.selectCntAllGoods(dbParam);
		int cntRecords = dao.selectCntAllGoods(dbParam);
		int lastPage = 1;
		if(cntRecords % 20 == 0) {
			lastPage = cntRecords / 20;
		} else {
			lastPage = cntRecords / 20 + 1;
		}
//		List<SettleVO> list = sdao.selectStoreList(dbParam); // �쟾泥� �긽�뭹 由ъ뒪�듃
		
		List<GoodsVO> list = dao.selectStoreList(dbParam);
		dao = sqlSession.getMapper(GoodsDaoImp.class);
		
		mav.addObject("method", "get");
		mav.addObject("list",list);
		mav.addObject("cntData", list.size());
		mav.addObject("lastPage", lastPage);
		mav.addObject("nowPage", nowPage);
		
		mav.addObject("startDate", startDate);
		mav.addObject("endDate", endDate);
		mav.addObject("category", null);
		mav.addObject("sale_State", null);
		mav.addObject("search", null);

		
		System.out.println("nowPage===GET===="+nowPage);
		System.out.println("lastPage====GET==="+lastPage);
		System.out.println("list.size()===GET===="+list.size());
		
		
//		mav.addObject("data", result);
		mav.setViewName("admin/adminGoods");
	
		return mav;
	}
	
	@RequestMapping(value="/adminGoods", method=RequestMethod.POST)
	@ResponseBody
	public ModelAndView adminGoods(HttpServletRequest req, HttpServletResponse resp, @RequestParam(value="startDate", required=false) String startDate, @RequestParam(value="endDate", required=false) String endDate,
			@RequestParam(value="category", required=false) String category, @RequestParam(value="sale_State", required=false) String sale_State , @RequestParam(value="search", required=false) String search,
			@RequestParam(value="now", required=false) String now){
		
		int nowPage = 1;
		if(now != null && now.length() > 0){
			nowPage = Integer.parseInt(now);
		}
		int startNum = 20 * (nowPage - 1) + 1;
		int endNum = 20 * nowPage;
		
		ModelAndView mav =new ModelAndView();
		GoodsDaoImp dao = sqlSession.getMapper(GoodsDaoImp.class);
//		SettleDaoImp sdao = sqlSession.getMapper(SettleDaoImp.class);

		if(startDate==null || endDate == null) {
			System.out.println("startMonth is null");
			
			SimpleDateFormat  yyyymmdd = new SimpleDateFormat("yyyy-MM-dd");
			String todate =  yyyymmdd.format(new Date());
			
			startDate = todate.substring(0, 8) + "01";
			endDate = todate;
		} 
		
		if(category.length() <= 0) category = null;
		if(sale_State.length() <= 0) sale_State = null;
		if(search.length() <= 0) search = null;

		// sql 寃��깋 媛� �뀑�똿
		Map<String, String> dbParam = new HashMap<String, String>();
		dbParam.put("startDate", startDate);
		dbParam.put("endDate", endDate);
		dbParam.put("category", category);
		dbParam.put("sale_State", sale_State);
		dbParam.put("search", search);
		dbParam.put("startNum", startNum+"");
		dbParam.put("endNum", endNum+"");
		
//		int cntRecords = sdao.selectCntAllGoods(dbParam);
		int cntRecords = dao.selectCntAllGoods(dbParam);
		int lastPage = 1;
		if(cntRecords % 20 == 0) {
			lastPage = cntRecords / 20;
		} else {
			lastPage = cntRecords / 20 + 1;
		}
//		List<SettleVO> list = sdao.selectStoreList(dbParam); // �쟾泥� �긽�뭹 由ъ뒪�듃
		List<GoodsVO> list = dao.selectStoreList(dbParam);
		dao = sqlSession.getMapper(GoodsDaoImp.class);
		
		if(startDate != null && endDate != null && list != null) {
			
			mav.addObject("method", "post");
			mav.addObject("list",list);
			mav.addObject("nowPage", nowPage);
			mav.addObject("cntData", list.size());
			mav.addObject("lastPage", lastPage);
			
			mav.addObject("startDate", startDate);
			mav.addObject("endDate", endDate);
			mav.addObject("category", category);
			mav.addObject("sale_State", sale_State);
			mav.addObject("search", search);
//			mav.addObject("data", result);

			System.out.println("category======="+category);
			System.out.println("search======="+search);
			System.out.println("sale_State======="+sale_State);
			System.out.println("nowPage======="+nowPage);
			System.out.println("lastPage======="+lastPage);
			System.out.println("list.size()======="+list.size());

			System.out.println("ajax success");
			try {
				//resp.getWriter().write("{\"result\":\"success\"}");
				mav.setViewName("admin/adminGoods");
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
	@RequestMapping("/adminGoodsEdit")
	public ModelAndView adminGoodsEdit(String code) {
		ModelAndView mav = new ModelAndView();	
		
		GoodsDaoImp dao = sqlSession.getMapper(GoodsDaoImp.class);
		GoodsVO vo = dao.selectGoods(code);
		String detail1=null, detail2=null, detail3=null;
		if(vo.getGoods_img2() != null) {
			if(vo.getGoods_img2().contains(", ")) {
				String[] details = (vo.getGoods_img2()).split(", ");
				for(int i=0; i<details.length; i++) {
					if(i==0) detail1 = details[i];
					if(i==1) detail2 = details[i];
					if(i==2) detail3 = details[i];
				}
			} else {
				detail1 = vo.getGoods_img2();
			}
			System.out.println(detail1);
			System.out.println(detail2);
			System.out.println(detail3);
		}
		mav.addObject("vo",vo);
		mav.addObject("detail1", detail1);
		mav.addObject("detail2", detail2);
		mav.addObject("detail3", detail3);
		mav.setViewName("admin/adminGoodsEdit");
		return mav;
	}
	
	@RequestMapping(value="/adminGoodsEditOk",method = RequestMethod.POST)
	public ModelAndView adminGoodsEditOk(GoodsVO vo, HttpSession session, MultipartHttpServletRequest mhsr, 
			Object img_goodsInfo, Object img_main, Object img_detail1, Object img_detail2, Object img_detail3,
			String detail1, String detail2, String detail3) {
		
		System.out.println("detail1:"+detail1);
		System.out.println("detail2:"+detail2);
		System.out.println("detail3:"+detail3);
		GoodsDaoImp dao=sqlSession.getMapper(GoodsDaoImp.class);
		String path=session.getServletContext().getRealPath("/upload/storeImg");
		// 마일리지 = 판매금액 * 0.1
		vo.setStack((int)(vo.getReal_price()*0.1));
		
		
		// goods_img2
		String goods_img2 = "";
		
		MultipartFile goodsInfo = mhsr.getFile("img_goodsInfo");
		if(!goodsInfo.equals(null) && goodsInfo != null) {
			boolean isc = goodsInfo.isEmpty();

			if(!isc){
//				원래 img_event 삭제.
				String imageName=vo.getGoods_info();
				System.out.println(imageName);
				
				File file=new File(path,imageName);
				if(file.exists()) {
					file.delete();
				}
//				그리고 새로운 event_img upload.
				
//				OutputStream ops = null;
				String filePath = null;
				
				String fName=goodsInfo.getOriginalFilename();
				if(fName!=null&&!fName.equals("")) {
					SimpleDateFormat  yyyymmdd = new SimpleDateFormat("yyyyMMddhhmmss");
					String todate =  yyyymmdd.format(new Date());
					String oriFileName=fName.substring(0,fName.lastIndexOf("."));
					String oriExt=fName.substring(fName.lastIndexOf("."));
					File newFile=new File(path,todate + "_" + fName);
					vo.setGoods_info(newFile.getName());
					if(newFile.exists()) {
						for (int renameNum=1;;renameNum++) {
							String renameFile= todate + "_"+oriFileName+"("+renameNum+")"+oriExt;
							System.out.println("filename==> "+renameFile);
							newFile=new File(path,renameFile);
							if(!newFile.exists()) {
								fName=renameFile;
								break;
							}//if
						}//for
					}//if
					try {
						goodsInfo.transferTo(newFile);
						System.out.println("newFile:" + newFile);

						vo.setGoods_info(newFile.getName());
						
						filePath="/gachi/upload/storeImg/"+newFile.getName();
					} catch (Exception e) {
						e.printStackTrace();
					}
				}//if
			}//isc
		}//null
		
		MultipartFile main = mhsr.getFile("img_main");
		if(!main.equals(null) && main != null) {
			boolean isc = main.isEmpty();

			if(!isc){
//				원래 img_event 삭제.
				String imageName=vo.getGoods_img1();
				System.out.println(imageName);
				
				File file=new File(path,imageName);
				if(file.exists()) {
					file.delete();
				}
//				그리고 새로운 event_img upload.
				
//				OutputStream ops = null;
				String filePath = null;
				
				String fName=main.getOriginalFilename();
				if(fName!=null&&!fName.equals("")) {
					SimpleDateFormat  yyyymmdd = new SimpleDateFormat("yyyyMMddhhmmss");
					String todate =  yyyymmdd.format(new Date());
					String oriFileName=fName.substring(0,fName.lastIndexOf("."));
					String oriExt=fName.substring(fName.lastIndexOf("."));
					File newFile=new File(path,todate + "_" + fName);
					vo.setGoods_img1(newFile.getName());
					if(newFile.exists()) {
						for (int renameNum=1;;renameNum++) {
							String renameFile= todate + "_"+oriFileName+"("+renameNum+")"+oriExt;
							System.out.println("filename==> "+renameFile);
							newFile=new File(path,renameFile);
							if(!newFile.exists()) {
								fName=renameFile;
								break;
							}//if
						}//for
					}//if
					try {
						main.transferTo(newFile);
						System.out.println("newFile:" + newFile);

						vo.setGoods_img1(newFile.getName());
						
						filePath="/gachi/upload/storeImg/"+newFile.getName();
					} catch (Exception e) {
						e.printStackTrace();
					}
				}//if
			}//isc
		}//null
		
		MultipartFile detailImg1 = mhsr.getFile("img_detail1");
		if(!detailImg1.equals(null) && detailImg1 != null) {
			boolean isc = detailImg1.isEmpty();
			String tmp = "";
			if(!isc){
//				원래 img_event 삭제.
				if(detail1 != null && detail1.length() > 0) {
					String imageName=detail1;
					System.out.println(imageName);
					File file=new File(path,imageName);
					if(file.exists()) {
						file.delete();
					}
				}
//				그리고 새로운 event_img upload.

				String filePath = null;
				
				String fName=detailImg1.getOriginalFilename();
				if(fName!=null&&!fName.equals("")) {
					SimpleDateFormat  yyyymmdd = new SimpleDateFormat("yyyyMMddhhmmss");
					String todate =  yyyymmdd.format(new Date());
					String oriFileName=fName.substring(0,fName.lastIndexOf("."));
					String oriExt=fName.substring(fName.lastIndexOf("."));
					File newFile=new File(path,todate + "_" + fName);
					tmp = newFile.getName();
					if(newFile.exists()) {
						for (int renameNum=1;;renameNum++) {
							String renameFile= todate + "_"+oriFileName+"("+renameNum+")"+oriExt;
							System.out.println("filename==> "+renameFile);
							newFile=new File(path,renameFile);
							if(!newFile.exists()) {
								fName=renameFile;
								break;
							}//if
						}//for
					}//if
					try {
						detailImg1.transferTo(newFile);
						System.out.println("newFile:" + newFile);

						tmp = newFile.getName();
						
						filePath="/gachi/upload/storeImg/"+newFile.getName();
					} catch (Exception e) {
						e.printStackTrace();
					}
				}//if
				goods_img2 = tmp;
				System.out.println("GOODS_IMG2:" + goods_img2);
			}//isc
			else {
				if(detail1 != null && detail1.length() > 0)
					goods_img2 = detail1;
				
				System.out.println("goods_img2:" + goods_img2);
			}
			
		}//null
		
		
		MultipartFile detailImg2 = mhsr.getFile("img_detail2");
		if(!detailImg2.equals(null) && detailImg2 != null) {
			boolean isc = detailImg2.isEmpty();
			String tmp = "";
			if(!isc){
//				원래 img_event 삭제.
				if(detail2 != null &&  detail2.length() > 0) {
					String imageName=detail2;
					System.out.println(imageName);
					File file=new File(path,imageName);
					if(file.exists()) {
						file.delete();
					}
				}
//				그리고 새로운 event_img upload.

				String filePath = null;
				
				String fName=detailImg2.getOriginalFilename();
				if(fName!=null&&!fName.equals("")) {
					SimpleDateFormat  yyyymmdd = new SimpleDateFormat("yyyyMMddhhmmss");
					String todate =  yyyymmdd.format(new Date());
					String oriFileName=fName.substring(0,fName.lastIndexOf("."));
					String oriExt=fName.substring(fName.lastIndexOf("."));
					File newFile=new File(path,todate + "_" + fName);
					tmp = newFile.getName();
					if(newFile.exists()) {
						for (int renameNum=1;;renameNum++) {
							String renameFile= todate + "_"+oriFileName+"("+renameNum+")"+oriExt;
							System.out.println("filename==> "+renameFile);
							newFile=new File(path,renameFile);
							if(!newFile.exists()) {
								fName=renameFile;
								break;
							}//if
						}//for
					}//if
					try {
						detailImg2.transferTo(newFile);
						System.out.println("newFile:" + newFile);

						tmp = newFile.getName();
						
						filePath="/gachi/upload/storeImg/"+newFile.getName();
					} catch (Exception e) {
						e.printStackTrace();
					}
				}//if
				goods_img2 = goods_img2 + ", " + tmp;
				System.out.println("GOODS_IMG2:" + goods_img2);
			}//isc
			else {
				if(detail2 != null && detail2.length() > 0)
					goods_img2 = goods_img2 + ", " + detail2;
				
				System.out.println("goods_img2:" + goods_img2);
			}
		}//null
		MultipartFile detailImg3 = mhsr.getFile("img_detail3");
		if(!detailImg3.equals(null) && detailImg3 != null) {
			boolean isc = detailImg3.isEmpty();
			String tmp = "";
			if(!isc){
//				원래 img_event 삭제.
				if(detail3 != null &&  detail3.length() > 0) {
					String imageName = detail3;
					System.out.println(imageName);
					File file=new File(path,imageName);
					if(file.exists()) {
						file.delete();
					}
				}
//				그리고 새로운 event_img upload.

				String filePath = null;
				
				String fName=detailImg3.getOriginalFilename();
				if(fName!=null&&!fName.equals("")) {
					SimpleDateFormat  yyyymmdd = new SimpleDateFormat("yyyyMMddhhmmss");
					String todate =  yyyymmdd.format(new Date());
					String oriFileName=fName.substring(0,fName.lastIndexOf("."));
					String oriExt=fName.substring(fName.lastIndexOf("."));
					File newFile=new File(path,todate + "_" + fName);
					tmp = newFile.getName();
					if(newFile.exists()) {
						for (int renameNum=1;;renameNum++) {
							String renameFile= todate + "_"+oriFileName+"("+renameNum+")"+oriExt;
							System.out.println("filename==> "+renameFile);
							newFile=new File(path,renameFile);
							if(!newFile.exists()) {
								fName=renameFile;
								break;
							}//if
						}//for
					}//if
					try {
						detailImg3.transferTo(newFile);
						System.out.println("newFile:" + newFile);

						tmp = newFile.getName();
						
						filePath="/gachi/upload/storeImg/"+newFile.getName();
					} catch (Exception e) {
						e.printStackTrace();
					}
				}//if
				goods_img2 = goods_img2 +  ", " + tmp;
				System.out.println("GOODS_IMG2:" + goods_img2);
			}//isc
			else {
				if(detail3 != null && detail3.length() > 0)
					goods_img2 = goods_img2 + ", " + detail3;
				
				System.out.println("goods_img2:" + goods_img2);
			}
			
		}//null
		
		
		vo.setGoods_img2(goods_img2);
		
		int result=dao.updateStore(vo);
		ModelAndView mav=new ModelAndView();
		if(result>0) {
			mav.setViewName("redirect:adminGoodsEdit?code="+vo.getCode());
		}
		return mav;
	}
	@RequestMapping(value="/adminGoodsWriteOk", method = RequestMethod.POST)
	public ModelAndView adminGoodsWriteOk(GoodsVO vo, HttpSession session,MultipartHttpServletRequest mhsr, 
			Object img_goodsInfo, Object img_main, Object img_detail1, Object img_detail2, Object img_detail3) {
		System.out.println("post");
		GoodsDaoImp dao=sqlSession.getMapper(GoodsDaoImp.class);
		String path=session.getServletContext().getRealPath("/upload/storeImg");
		
		// 마일리지 = 판매금액 * 0.1
		vo.setStack((int)(vo.getReal_price()*0.1));

		MultipartFile goodsInfo = mhsr.getFile("img_goodsInfo");
		MultipartFile main = mhsr.getFile("img_main");
		MultipartFile detail1 = mhsr.getFile("img_detail1");
		MultipartFile detail2 = mhsr.getFile("img_detail2");
		MultipartFile detail3 = mhsr.getFile("img_detail3");
		
		String goods_img2 = "";
		
		boolean isc = goodsInfo.isEmpty();
		if(!isc){
			String fName=goodsInfo.getOriginalFilename();
			if(fName!=null&&!fName.equals("")) {
				SimpleDateFormat  yyyymmdd = new SimpleDateFormat("yyyyMMddhhmmss");
				String todate =  yyyymmdd.format(new Date());
				String oriFileName=fName.substring(0,fName.lastIndexOf("."));
				String oriExt=fName.substring(fName.lastIndexOf("."));
				File newFile=new File(path,todate + "_" + fName);
				vo.setGoods_info(newFile.getName());
				
				System.out.println(newFile.getName());
				if(newFile.exists()) {
					for (int renameNum=1;;renameNum++) {
						String renameFile= todate + "_"+oriFileName+"("+renameNum+")"+oriExt;
						System.out.println("filename==> "+renameFile);
						newFile=new File(path,renameFile);
						if(!newFile.exists()) {
							fName=renameFile;
							break;
						}//if
					}//for
				}//if
				try {
					goodsInfo.transferTo(newFile);
					System.out.println("newFile:" + newFile);

					vo.setGoods_info(newFile.getName());
					
				} catch (Exception e) {
					e.printStackTrace();
				}
			}//if
		}//!isc
		
		boolean isc2 = main.isEmpty();
		if(!isc2){
			String fName=main.getOriginalFilename();
			if(fName!=null&&!fName.equals("")) {
				SimpleDateFormat  yyyymmdd = new SimpleDateFormat("yyyyMMddhhmmss");
				String todate =  yyyymmdd.format(new Date());
				String oriFileName=fName.substring(0,fName.lastIndexOf("."));
				String oriExt=fName.substring(fName.lastIndexOf("."));
				File newFile=new File(path,todate + "_" + fName);
				vo.setGoods_img1(newFile.getName());
				
				System.out.println(newFile.getName());
				if(newFile.exists()) {
					for (int renameNum=1;;renameNum++) {
						String renameFile= todate + "_"+oriFileName+"("+renameNum+")"+oriExt;
						System.out.println("filename==> "+renameFile);
						newFile=new File(path,renameFile);
						if(!newFile.exists()) {
							fName=renameFile;
							break;
						}//if
					}//for
				}//if
				try {
					main.transferTo(newFile);
					System.out.println("newFile:" + newFile);

					vo.setGoods_img1(newFile.getName());
					
				} catch (Exception e) {
					e.printStackTrace();
				}
			}//if
		}//!isc
		
		boolean isc3 = detail1.isEmpty();
		if(!isc3){
			String tmp = "";
			String fName=detail1.getOriginalFilename();
			if(fName!=null&&!fName.equals("")) {
				SimpleDateFormat  yyyymmdd = new SimpleDateFormat("yyyyMMddhhmmss");
				String todate =  yyyymmdd.format(new Date());
				String oriFileName=fName.substring(0,fName.lastIndexOf("."));
				String oriExt=fName.substring(fName.lastIndexOf("."));
				File newFile=new File(path,todate + "_" + fName);
//				vo.setGoods_info(newFile.getName());
				tmp = newFile.getName();
				System.out.println(newFile.getName());
				if(newFile.exists()) {
					for (int renameNum=1;;renameNum++) {
						String renameFile= todate + "_"+oriFileName+"("+renameNum+")"+oriExt;
						System.out.println("filename==> "+renameFile);
						newFile=new File(path,renameFile);
						if(!newFile.exists()) {
							fName=renameFile;
							break;
						}//if
					}//for
				}//if
				try {
					detail1.transferTo(newFile);
					System.out.println("newFile:" + newFile);

//					vo.setGoods_info(newFile.getName());
					tmp = newFile.getName();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}//if
			goods_img2 = tmp;
		}//!isc3
		
		boolean isc4 = detail2.isEmpty();
		if(!isc4){
			String tmp = "";
			String fName=detail2.getOriginalFilename();
			if(fName!=null&&!fName.equals("")) {
				SimpleDateFormat  yyyymmdd = new SimpleDateFormat("yyyyMMddhhmmss");
				String todate =  yyyymmdd.format(new Date());
				String oriFileName=fName.substring(0,fName.lastIndexOf("."));
				String oriExt=fName.substring(fName.lastIndexOf("."));
				File newFile=new File(path,todate + "_" + fName);
//				vo.setGoods_info(newFile.getName());
				tmp = newFile.getName();
				System.out.println(newFile.getName());
				if(newFile.exists()) {
					for (int renameNum=1;;renameNum++) {
						String renameFile= todate + "_"+oriFileName+"("+renameNum+")"+oriExt;
						System.out.println("filename==> "+renameFile);
						newFile=new File(path,renameFile);
						if(!newFile.exists()) {
							fName=renameFile;
							break;
						}//if
					}//for
				}//if
				try {
					detail2.transferTo(newFile);
					System.out.println("newFile:" + newFile);

//					vo.setGoods_info(newFile.getName());
					tmp = newFile.getName();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}//if
			goods_img2 += ", " + tmp;
		}//!isc4
		
		boolean isc5 = detail3.isEmpty();
		if(!isc5){
			String tmp = "";
			String fName=detail3.getOriginalFilename();
			if(fName!=null&&!fName.equals("")) {
				SimpleDateFormat  yyyymmdd = new SimpleDateFormat("yyyyMMddhhmmss");
				String todate =  yyyymmdd.format(new Date());
				String oriFileName=fName.substring(0,fName.lastIndexOf("."));
				String oriExt=fName.substring(fName.lastIndexOf("."));
				File newFile=new File(path,todate + "_" + fName);
//				vo.setGoods_info(newFile.getName());
				tmp = newFile.getName();
				System.out.println(newFile.getName());
				if(newFile.exists()) {
					for (int renameNum=1;;renameNum++) {
						String renameFile= todate + "_"+oriFileName+"("+renameNum+")"+oriExt;
						System.out.println("filename==> "+renameFile);
						newFile=new File(path,renameFile);
						if(!newFile.exists()) {
							fName=renameFile;
							break;
						}//if
					}//for
				}//if
				try {
					detail3.transferTo(newFile);
					System.out.println("newFile:" + newFile);

//					vo.setGoods_info(newFile.getName());
					tmp = newFile.getName();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}//if
			goods_img2 += ", " + tmp;
		}//!isc5
		
		vo.setGoods_img2(goods_img2);
		
		dao.insertStore(vo);
		ModelAndView mav=new ModelAndView();
		
		mav.setViewName("redirect:adminGoods");
	
		return mav;
	}
	
	@RequestMapping(value="/adminGoodsDelete", method=RequestMethod.GET)
	public ModelAndView adminGoodsDelete(String code, HttpSession session) {
		System.out.println("adminGoodsDelete");
		
		ModelAndView mav = new ModelAndView();
		GoodsDaoImp dao = sqlSession.getMapper(GoodsDaoImp.class);
		GoodsVO vo = dao.selectGoods(code);
		String detail1=null, detail2=null, detail3=null;
		if(vo.getGoods_img2() != null) {
			if(vo.getGoods_img2().contains(", ")) {
				String[] details = (vo.getGoods_img2()).split(", ");
				for(int i=0; i<details.length; i++) {
					if(i==0) detail1 = details[i];
					if(i==1) detail2 = details[i];
					if(i==2) detail3 = details[i];
				}
			} else {
				detail1 = vo.getGoods_img2();
			}
			System.out.println(detail1);
			System.out.println(detail2);
			System.out.println(detail3);
		}
		
		// 관련 이미지 삭제
		String path=session.getServletContext().getRealPath("/upload/storeImg");
		String goodsInfo = vo.getGoods_info();
		System.out.println(goodsInfo);
		
		File file=new File(path, goodsInfo);
		if(file.exists()) {
			file.delete();
		}
		
		String goods_img1 = vo.getGoods_img1();
		System.out.println(goods_img1);
		
		File file2=new File(path,goods_img1);
		if(file2.exists()) {
			file2.delete();
		}
		
		if(detail1 != null && detail1.length() > 0) {
			File file3=new File(path, detail1);
			if(file3.exists()) {
				file3.delete();
			}
		}
		
		if(detail2 != null && detail2.length() > 0) {
			File file4=new File(path, detail2);
			if(file4.exists()) {
				file4.delete();
			}
		}
		
		if(detail3 != null && detail3.length() > 0) {
			File file5=new File(path, detail3);
			if(file5.exists()) {
				file5.delete();
			}
		}
		
		dao.deleteOne(code);

		mav.setViewName("redirect:adminGoods");
		return mav;
	}
	@RequestMapping(value="/StoreimgThumbnail",method=RequestMethod.POST,produces="application/text;charset=UTF-8" )
	@ResponseBody
	public String StoreimgThumbnail(HttpSession session,MultipartHttpServletRequest mhsr,
			@RequestParam("code") String code) {
		GoodsDaoImp dao=sqlSession.getMapper(GoodsDaoImp.class);
		MultipartFile file=mhsr.getFile("file");
		OutputStream ops=null;
		String path=session.getServletContext().getRealPath("/upload/storeImg");
		boolean isc=file.isEmpty();
		String filePath=null;
		if(!isc){
			String fName=file.getOriginalFilename();
			if(fName!=null&&!fName.equals("")) {
				String oriFileName=fName.substring(0,fName.lastIndexOf("."));
				String oriExt=fName.substring(fName.lastIndexOf("."));
				File newFile=new File(path,code+"_"+fName);
				if(newFile.exists()) {
					for (int renameNum=1;;renameNum++) {
						String renameFile=code+"_"+oriFileName+"("+renameNum+")"+oriExt;
						System.out.println("filename==> "+renameFile);
						newFile=new File(path,renameFile);
						if(!newFile.exists()) {
							fName=renameFile;
							break;
						}//if
					}//for
				}//if
				try {
					file.transferTo(newFile);
					System.out.println("newFile:" + newFile);
					String storeImg=dao.selectStoreImg(code);
					storeImg=storeImg+newFile.getName()+",";
					dao.updateStoreImg(storeImg, code);
					filePath="/gachi/upload/storeImg/"+newFile.getName();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}//if
		}
		System.out.println("filePath:" + filePath);
		return filePath;
	}
	
	@RequestMapping(value="/StoreimageDelete",method = RequestMethod.POST)
	@ResponseBody
	public void StoreimageDelete(HttpServletRequest req,HttpSession session) throws UnsupportedEncodingException {
		req.setCharacterEncoding("UTF-8");
		
		GoodsDaoImp dao=sqlSession.getMapper(GoodsDaoImp.class);
		String path=session.getServletContext().getRealPath("/upload/storeImg");
		String imageName=req.getParameter("imageName");
		System.out.println(imageName);
		String code=req.getParameter("code");
		System.out.println(code);
		File file=new File(path,imageName);
		if(file.exists()) {
			file.delete();
			String storeImg=dao.selectStoreImg(code);
			StringTokenizer st=new StringTokenizer(storeImg,",");
			String txt="";
			while (st.hasMoreTokens()) {
				String img=st.nextToken();
				if(img.equals(imageName)) {
					continue;
				}
				txt+=img+",";
			}
			Map<String, String> dbParam = new HashMap<String, String>();
			dao.updateStoreImg(txt, code);
		}
	} 
	
	
	@RequestMapping(value="/StoreimageUpload",method=RequestMethod.POST)
	@ResponseBody
	public JsonObject StoreimageUpload(HttpServletRequest req,@RequestParam MultipartFile upload,
			@RequestParam("type") String type) {
		HttpSession session=req.getSession();
		String path = null;
		if(type.equals("GoodsEdit")) {
			path=session.getServletContext().getRealPath("/upload/storeImg");
		}
		else if(type.equals("GoodsWrite")) {
			path=session.getServletContext().getRealPath("/upload/storeImg");
		}
		JsonObject json=new JsonObject();
		OutputStream ops=null;
		try {
			ops=new FileOutputStream(new File(path,upload.getOriginalFilename()));
			ops.write(upload.getBytes());
			json.addProperty("uploaded",1);
			json.addProperty("filename",upload.getOriginalFilename());
			json.addProperty("url","/gachi/upload/storeImg/"+upload.getOriginalFilename());
			ops.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return json;
	}
	
	@RequestMapping("/adminGoodsWrite")
	public ModelAndView adminGoodsWrite() {
		GoodsDaoImp dao = sqlSession.getMapper(GoodsDaoImp.class);
		
		ModelAndView mav = new ModelAndView();
		SimpleDateFormat  yyyymmdd = new SimpleDateFormat("yyyy-MM-dd");
		String writedate =  yyyymmdd.format(new Date());
		
		int cnt = dao.selectTodayGoodsCnt(writedate);
		cnt = cnt + 1;
		mav.addObject("todate", writedate);
		mav.addObject("cnt", cnt);
		mav.setViewName("admin/adminGoodsWrite");
		return mav;
	}

	@RequestMapping("/adminStatStore")
	public ModelAndView adminStatStore() {
		ModelAndView mav = new ModelAndView();
		
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
		List<Integer> result = dao.sumStoreSalesByDay(dbParam2);
		System.out.println("result:" + result);
		dao = sqlSession.getMapper(SettleDaoImp.class);
		Integer countStoreAll = dao.cntStoreAll(dbParam);
		Integer countStoreN = dao.cntStoreN(dbParam);
		Integer countStoreY = dao.cntStoreY(dbParam);
		
		
		
		Map<String, String> dbParam_pie = new HashMap<String, String>();
		dbParam_pie.put("startDate", startDate.toString());
		dbParam_pie.put("endDate", endDate.toString());
		
		// chart2 data
		dao = sqlSession.getMapper(SettleDaoImp.class);
		List<Map<String, Integer>> genderResult = dao.StoreForGender(dbParam_pie);
		
		// chart3 data
		dao = sqlSession.getMapper(SettleDaoImp.class);
		List<Map<String, Integer>> ageResult = dao.StoreForAge(dbParam_pie);
		

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
		
		if(countStoreAll == null) countStoreAll = 0;
		if(countStoreN == null) countStoreN = 0;
		if(countStoreY == null) countStoreY = 0;
		
		System.out.println(countStoreAll);
		System.out.println(countStoreN);
		System.out.println(countStoreY);
		
		mav.addObject("startDate", startDate);
		mav.addObject("endDate", endDate);
		mav.addObject("labelData", dateArr);
		mav.addObject("dashData", result);
		mav.addObject("countStoreAll", countStoreAll);
		mav.addObject("countStoreN", countStoreN);
		mav.addObject("countStoreY", countStoreY);
		
		mav.addObject("genderLabel", genderPieLbl);
		mav.addObject("genderData", genderPieData);
		mav.addObject("ageLabel", agePieLbl);
		mav.addObject("ageData", agePieData);
		mav.setViewName("admin/adminStatStore");
		
		return mav;
	}
	@RequestMapping(value="/adminStatStore", method=RequestMethod.POST)
	@ResponseBody
	public ModelAndView adminStatStore(HttpServletRequest req, HttpServletResponse resp, @RequestParam(value="startDate", required=false) String startDate, @RequestParam String endDate) {
		ModelAndView mav = new ModelAndView();

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
		List<Integer> result = dao.sumStoreSalesByDay(dbParam2);
		dao = sqlSession.getMapper(SettleDaoImp.class);
		Integer countStoreAll = dao.cntStoreAll(dbParam);
		Integer countStoreN = dao.cntStoreN(dbParam);
		Integer countStoreY = dao.cntStoreY(dbParam);
		
		Map<String, String> dbParam_pie = new HashMap<String, String>();
		dbParam_pie.put("startDate", startDate.toString());
		dbParam_pie.put("endDate", endDate.toString());
		
		// chart2 data
		dao = sqlSession.getMapper(SettleDaoImp.class);
		List<Map<String, Integer>> genderResult = dao.StoreForGender(dbParam_pie);
		
		// chart3 data
		dao = sqlSession.getMapper(SettleDaoImp.class);
		List<Map<String, Integer>> ageResult = dao.StoreForAge(dbParam_pie);
		

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
		
		if(countStoreAll == null) countStoreAll = 0;
		if(countStoreN == null) countStoreN = 0;
		if(countStoreY == null) countStoreY = 0;
				
		if(startDate != null && endDate != null) {
			
			mav.addObject("startDate", startDate);
			mav.addObject("endDate", endDate);
			mav.addObject("labelData", dateArr);
			mav.addObject("dashData", result);
			mav.addObject("countStoreAll", countStoreAll);
			mav.addObject("countStoreN", countStoreN);
			mav.addObject("countStoreY", countStoreY);
			
			mav.addObject("genderLabel", genderPieLbl);
			mav.addObject("genderData", genderPieData);
			mav.addObject("ageLabel", agePieLbl);
			mav.addObject("ageData", agePieData);

			System.out.println("ajax success");
			try {
				//resp.getWriter().write("{\"result\":\"success\"}");
				mav.setViewName("admin/adminStatStore");
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
	
	
	@RequestMapping("/adminStatClass")
	public ModelAndView adminStatClass() {

		ModelAndView mav = new ModelAndView();
		
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
		
		Map<String, Object> dbParam2 = new HashMap<String,Object>();
		dbParam2.put("list", dateArr);
		// sql 검색 값 셋팅
		Map<String, String> dbParam = new HashMap<String, String>();
		dbParam.put("startDate", startDate);
		dbParam.put("endDate", endDate);
		
		SettleDaoImp dao = sqlSession.getMapper(SettleDaoImp.class);
		List<Integer> result = dao.sumClassSalesByDay(dbParam2);
		dao = sqlSession.getMapper(SettleDaoImp.class);
		Integer countStatClassAll = dao.cntStatClassAll(dbParam);
		Integer countClassN = dao.cntClassN(dbParam);
		Integer countClassY = dao.cntClassY(dbParam);
		
		if(countStatClassAll == null) countStatClassAll = 0;
		if(countClassN == null) countClassN = 0;
		if(countClassY == null) countClassY = 0;
		
		System.out.println(countStatClassAll);
		System.out.println(countClassN);
		System.out.println(countClassY);
		
		Map<String, String> dbParam_pie = new HashMap<String, String>();
		dbParam_pie.put("startDate", startDate.toString());
		dbParam_pie.put("endDate", endDate.toString());
		
		
		// chart2 data
		dao = sqlSession.getMapper(SettleDaoImp.class);
		List<Map<String, Integer>> genderResult = dao.ClassForGender(dbParam_pie);
		
		// chart3 data
		dao = sqlSession.getMapper(SettleDaoImp.class);
		List<Map<String, Integer>> ageResult = dao.ClassForAge(dbParam_pie);
		

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
		mav.addObject("dashData", result);
		mav.addObject("labelData", dateArr);
		mav.addObject("countStatClassAll", countStatClassAll);
		mav.addObject("countClassN", countClassN);
		mav.addObject("countClassY", countClassY);
		
		mav.addObject("genderLabel", genderPieLbl);
		mav.addObject("genderData", genderPieData);
		mav.addObject("ageLabel", agePieLbl);
		mav.addObject("ageData", agePieData);
		
		mav.setViewName("admin/adminStatClass");
		
		return mav;
	}
	
	@RequestMapping(value="/adminStatClass", method=RequestMethod.POST)
	@ResponseBody
	public ModelAndView adminStatClass(HttpServletRequest req, HttpServletResponse resp, @RequestParam(value="startDate", required=false) String startDate, @RequestParam(value="endDate", required=false) String endDate) {
		ModelAndView mav = new ModelAndView();

		if(startDate==null || endDate == null) {
			
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
		List<Integer> result = dao.sumClassSalesByDay(dbParam2);
		dao = sqlSession.getMapper(SettleDaoImp.class);
		Integer countStatClassAll = dao.cntStatClassAll(dbParam);
		Integer countClassN = dao.cntClassN(dbParam);
		Integer countClassY = dao.cntClassY(dbParam);
		
		if(countStatClassAll == null) countStatClassAll = 0;
		if(countClassN == null) countClassN = 0;
		if(countClassY == null) countClassY = 0;
		
		System.out.println(countStatClassAll);
		System.out.println(countClassN);
		System.out.println(countClassY);
		
		
		Map<String, String> dbParam_pie = new HashMap<String, String>();
		dbParam_pie.put("startDate", startDate.toString());
		dbParam_pie.put("endDate", endDate.toString());
		
		// chart2 data
		dao = sqlSession.getMapper(SettleDaoImp.class);
		List<Map<String, Integer>> genderResult = dao.ClassForGender(dbParam_pie);
		
		// chart3 data
		dao = sqlSession.getMapper(SettleDaoImp.class);
		List<Map<String, Integer>> ageResult = dao.ClassForAge(dbParam_pie);
		

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
			mav.addObject("dashData", result);
			mav.addObject("labelData", dateArr);
			mav.addObject("countStatClassAll", countStatClassAll);
			mav.addObject("countClassN", countClassN);
			mav.addObject("countClassY", countClassY);
			
			mav.addObject("genderLabel", genderPieLbl);
			mav.addObject("genderData", genderPieData);
			mav.addObject("ageLabel", agePieLbl);
			mav.addObject("ageData", agePieData);
			
			mav.setViewName("admin/adminStatClass");

			System.out.println("ajax success");
			try {
				//resp.getWriter().write("{\"result\":\"success\"}");
				mav.setViewName("admin/adminStatClass");
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
	
	
	
	@RequestMapping("/adminStatCreator")
	public ModelAndView adminStatCreator() {
		ModelAndView mav = new ModelAndView();
		System.out.println("controller");
		System.out.println("startMonth is null");
			
		String startMonth, endMonth;
		SimpleDateFormat  yyyymm = new SimpleDateFormat("yyyy-MM");
		String todate =  yyyymm.format(new Date());
		if(Integer.parseInt(todate.substring(5, 7))-1 <= 0) {
			startMonth = (Integer.parseInt(todate.substring(0,3))-1) + "-" + (Integer.parseInt(todate.substring(5, 7))+12-1);
		}
			startMonth = todate.substring(0, 4) +  "-" + (Integer.parseInt(todate.substring(5, 7))-1);
			endMonth = todate;
			
		int dataSize = 0;
			if((Integer.parseInt(endMonth.substring(0, 4))) == (Integer.parseInt(startMonth.substring(0, 4)))) { // 2019-11 2020-02
				dataSize = Integer.parseInt(endMonth.substring(5,7)) - Integer.parseInt(startMonth.substring(5,7));
			} else{
				dataSize = (Integer.parseInt(endMonth.substring(0,4)) - Integer.parseInt(startMonth.substring(0,4)))*12;
				dataSize += Integer.parseInt(endMonth.substring(5,7)); 
				dataSize -= Integer.parseInt(startMonth.substring(5,7));
				
			}
			dataSize += 1;
			System.out.println(dataSize);
			
			List<String> dbParam2 = new ArrayList<String>();
			for(int i=0; i<dataSize; i++) {
				String tmp;
				if(Integer.parseInt(startMonth.substring(5, 7)) + i > 12) {
					tmp = Integer.parseInt(startMonth.substring(0,4))+1 + "-" + (Integer.parseInt(startMonth.substring(5, 7)) - 12 + i);
					System.out.println("tmp1:" + tmp);
				} else {
					tmp = Integer.parseInt(startMonth.substring(0,4)) + "-" + (Integer.parseInt(startMonth.substring(5, 7)) + i);
					System.out.println("tmp2:" + tmp);
				}
				if(tmp.length()<7) tmp = tmp.substring(0,4)+ "-0" + tmp.substring(5,6);
				dbParam2.add(tmp);
			}
			
			Map<String, List> dbParam = new HashMap<String, List>();
			dbParam.put("list", dbParam2);
			
			// chart1 data
			CreatorDaoImp dao = sqlSession.getMapper(CreatorDaoImp.class);
			List<Integer> newMember = dao.dashForCreator(dbParam); // return type
		
			// dbParam for pie chart 
			Map<String, String> dbParam_pie = new HashMap<String, String>();
			dbParam_pie.put("startMonth", startMonth.toString());
			dbParam_pie.put("endMonth", endMonth.toString());
			
			System.out.println(dbParam_pie.get("startMonth"));
			System.out.println(dbParam_pie.get("endMonth"));
			
			// chart2 data
			dao = sqlSession.getMapper(CreatorDaoImp.class);
			List<Map<String, Integer>> genderResult = dao.CreatorForGender(dbParam_pie);
			
			// chart3 data
			dao = sqlSession.getMapper(CreatorDaoImp.class);
			List<Map<String, Integer>> ageResult = dao.CreatorForAge(dbParam_pie);
			
			//chart4 data 
			dao = sqlSession.getMapper(CreatorDaoImp.class);
			List<Map<String, Integer>> categoryResult = dao.CreatorForCategory(dbParam_pie);

			// ChartJs �쟾�넚 �뜲�씠�꽣
			List<String> genderPieLbl = new ArrayList<String>();
			List<String> genderPieData = new ArrayList<String>();
			
			List<String> agePieLbl = new ArrayList<String>();
			List<String> agePieData = new ArrayList<String>();
			
			List<String> categoryPieLbl = new ArrayList<String>();
			List<String> categoryPieData = new ArrayList<String>();
			
			
			for(int i=0; i< genderResult.size(); i++) {
				genderPieLbl.add("\'" + genderResult.get(i).get("GENDER_GB") + "\'");
				genderPieData.add(String.valueOf(genderResult.get(i).get("CNT")));
			}
			for(int i=0; i< ageResult.size(); i++) {
				agePieData.add(String.valueOf(ageResult.get(i).get("CNT")));
				agePieLbl.add("\'" + ageResult.get(i).get("AGE_GB") + "\'");
			}
			for(int i=0; i< categoryResult.size(); i++) {
				categoryPieData.add(String.valueOf(categoryResult.get(i).get("DATA")));
				categoryPieLbl.add("\'" + categoryResult.get(i).get("labels") + "\'");
			}
			
			for(int i=0; i<newMember.size(); i++) {
				System.out.println(newMember.get(i));
			}
		
			for(int i=0; i<dataSize; i++) {
				String tmp = dbParam2.get(i);
//					System.out.println(tmp);
				dbParam2.set(i, "\'" + tmp +"\'");
//					System.out.println(dbParam2.get(i));
			}
			
			mav.addObject("dashData", newMember);
			mav.addObject("labelData", dbParam2);
			mav.addObject("dataSize", dataSize);
			mav.addObject("startMonth", startMonth);
			mav.addObject("endMonth", endMonth);
			mav.addObject("genderLabel", genderPieLbl);
			mav.addObject("genderData", genderPieData);
			mav.addObject("ageLabel", agePieLbl);
			mav.addObject("ageData", agePieData);
			mav.addObject("categoryLabel", categoryPieLbl);
			mav.addObject("categoryData", categoryPieData);
			
		System.out.println("startMonth:" + startMonth);
		System.out.println("endMonth:" + endMonth);
		// getChartData(startMonth, endMonth);
		mav.addObject("dataSize", 2);
		mav.setViewName("admin/adminStatCreator");
		return mav;
	}
	
	@RequestMapping(value="/adminStatCreator",method=RequestMethod.POST)
	@ResponseBody
	public ModelAndView adminStatCreator(HttpServletRequest req, HttpServletResponse resp, @RequestParam(value="startMonth", required=false) String startMonth, @RequestParam(value="endMonth", required=false) String endMonth) {
		ModelAndView mav = new ModelAndView();
		
		if(startMonth==null || endMonth == null) {
			System.out.println("startMonth is null");
			
			SimpleDateFormat  yyyymm = new SimpleDateFormat("yyyy-MM");
			String todate =  yyyymm.format(new Date());
			if(Integer.parseInt(todate.substring(5, 7))-1 <= 0) {
				startMonth = (Integer.parseInt(todate.substring(0,3))-1) + "-" + (Integer.parseInt(todate.substring(5, 7))+12-1);
			}
			startMonth = todate.substring(0, 4) +  "-" + (Integer.parseInt(todate.substring(5, 7))-1);
			endMonth = todate;
		} 
		
		int dataSize = 0;
		if((Integer.parseInt(endMonth.substring(0, 4))) == (Integer.parseInt(startMonth.substring(0, 4)))) { // 2019-11 2020-02
			dataSize = Integer.parseInt(endMonth.substring(5,7)) - Integer.parseInt(startMonth.substring(5,7));
		} else{
			dataSize = (Integer.parseInt(endMonth.substring(0,4)) - Integer.parseInt(startMonth.substring(0,4)))*12;
			dataSize += Integer.parseInt(endMonth.substring(5,7)); 
			dataSize -= Integer.parseInt(startMonth.substring(5,7));
			
		}
		dataSize += 1;
		System.out.println(dataSize);
		
		List<String> dbParam2 = new ArrayList<String>();
		for(int i=0; i<dataSize; i++) {
			String tmp;
			if(Integer.parseInt(startMonth.substring(5, 7)) + i > 12) {
				tmp = Integer.parseInt(startMonth.substring(0,4))+1 + "-" + (Integer.parseInt(startMonth.substring(5, 7)) - 12 + i);
				System.out.println("tmp1:" + tmp);
			} else {
				tmp = Integer.parseInt(startMonth.substring(0,4)) + "-" + (Integer.parseInt(startMonth.substring(5, 7)) + i);
				System.out.println("tmp2:" + tmp);
			}
			if(tmp.length()<7) tmp = tmp.substring(0,4)+ "-0" + tmp.substring(5,6);
			dbParam2.add(tmp);
		}
		
		// dbParam definition
		Map<String, List> dbParam = new HashMap<String, List>();
		dbParam.put("list", dbParam2);
		
		// chart1 data
		CreatorDaoImp dao = sqlSession.getMapper(CreatorDaoImp.class);
		List<Integer> newMember = dao.dashForCreator(dbParam); // return type
	
		// dbParam for pie chart 
		Map<String, String> dbParam_pie = new HashMap<String, String>();
		dbParam_pie.put("startMonth", startMonth.toString());
		dbParam_pie.put("endMonth", endMonth.toString());
		
		System.out.println(dbParam_pie.get("startMonth"));
		System.out.println(dbParam_pie.get("endMonth"));
		
		// chart2 data
		dao = sqlSession.getMapper(CreatorDaoImp.class);
		List<Map<String, Integer>> genderResult = dao.CreatorForGender(dbParam_pie);
		
		// chart3 data
		dao = sqlSession.getMapper(CreatorDaoImp.class);
		List<Map<String, Integer>> ageResult = dao.CreatorForAge(dbParam_pie);
		
		//chart4 data 
		dao = sqlSession.getMapper(CreatorDaoImp.class);
		List<Map<String, Integer>> categoryResult = dao.CreatorForCategory(dbParam_pie);

		// ChartJs �쟾�넚 �뜲�씠�꽣
		List<String> genderPieLbl = new ArrayList<String>();
		List<String> genderPieData = new ArrayList<String>();
		
		List<String> agePieLbl = new ArrayList<String>();
		List<String> agePieData = new ArrayList<String>();
		
		List<String> categoryPieLbl = new ArrayList<String>();
		List<String> categoryPieData = new ArrayList<String>();
		
		for(int i=0; i< genderResult.size(); i++) {
			genderPieLbl.add("\'" + genderResult.get(i).get("GENDER_GB") + "\'");
			genderPieData.add(String.valueOf(genderResult.get(i).get("CNT")));
		}
		for(int i=0; i< ageResult.size(); i++) {
			agePieData.add(String.valueOf(ageResult.get(i).get("CNT")));
			agePieLbl.add("\'" + ageResult.get(i).get("AGE_GB") + "\'");
		}
		for(int i=0; i<categoryResult.size(); i++) {
			categoryPieData.add(String.valueOf(categoryResult.get(i).get("DATA")));
			categoryPieLbl.add("\'" + categoryResult.get(i).get("labels") + "\'");
		}
		
		
		for(int i=0; i<newMember.size(); i++) {
		}
		
		if(startMonth != null && endMonth != null) {
			for(int i=0; i<dataSize; i++) {
				String tmp = dbParam2.get(i);

				dbParam2.set(i, "\'" + tmp +"\'");
			}
//			System.out.println("generData.size:" + genderPieData.size());
//			System.out.println("ageData.size:" + agePieData.size());
			
			mav.addObject("dashData", newMember);
			mav.addObject("labelData", dbParam2);
			mav.addObject("dataSize", dataSize);
			mav.addObject("startMonth", startMonth);
			mav.addObject("endMonth", endMonth);
			mav.addObject("genderLabel", genderPieLbl);
			mav.addObject("genderData", genderPieData);
			mav.addObject("ageLabel", agePieLbl);
			mav.addObject("ageData", agePieData);
			mav.addObject("categoryLabel", categoryPieLbl);
			mav.addObject("categoryData", categoryPieData);

			
			System.out.println("ajax success");
			try {
				//resp.getWriter().write("{\"result\":\"success\"}");
				mav.setViewName("admin/adminStatCreator");
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

	//	mav.addObject("dataSize", dataSize);
	//	mav.addObject("newMember", newMember);
	//	mav.setViewName("admin/adminStatMember");
		return null;
	}

	@RequestMapping("/adminStatMember")
	public ModelAndView adminStatMember() {
		ModelAndView mav = new ModelAndView();
			
		String startMonth, endMonth;
		SimpleDateFormat  yyyymm = new SimpleDateFormat("yyyy-MM");
		String todate =  yyyymm.format(new Date());
		if(Integer.parseInt(todate.substring(5, 7))-1 <= 0) {
			startMonth = (Integer.parseInt(todate.substring(0,3))-1) + "-" + (Integer.parseInt(todate.substring(5, 7))+12-1);
		}
			startMonth = todate.substring(0, 4) +  "-" + (Integer.parseInt(todate.substring(5, 7))-1);
			endMonth = todate;
			
		int dataSize = 0;
			if((Integer.parseInt(endMonth.substring(0, 4))) == (Integer.parseInt(startMonth.substring(0, 4)))) { // 2019-11 2020-02
				dataSize = Integer.parseInt(endMonth.substring(5,7)) - Integer.parseInt(startMonth.substring(5,7));
			} else{
				dataSize = (Integer.parseInt(endMonth.substring(0,4)) - Integer.parseInt(startMonth.substring(0,4)))*12;
				dataSize += Integer.parseInt(endMonth.substring(5,7)); 
				dataSize -= Integer.parseInt(startMonth.substring(5,7));
				
			}
			dataSize += 1;
			System.out.println(dataSize);
			
			List<String> dbParam2 = new ArrayList<String>();
			for(int i=0; i<dataSize; i++) {
				String tmp;
				if(Integer.parseInt(startMonth.substring(5, 7)) + i > 12) {
					tmp = Integer.parseInt(startMonth.substring(0,4))+1 + "-" + (Integer.parseInt(startMonth.substring(5, 7)) - 12 + i);
					System.out.println("tmp1:" + tmp);
				} else {
					tmp = Integer.parseInt(startMonth.substring(0,4)) + "-" + (Integer.parseInt(startMonth.substring(5, 7)) + i);
					System.out.println("tmp2:" + tmp);
				}
				if(tmp.length()<7) tmp = tmp.substring(0,4)+ "-0" + tmp.substring(5,6);
				dbParam2.add(tmp);
			}
			
			// dbParam definition
			Map<String, List> dbParam = new HashMap<String, List>();
			dbParam.put("list", dbParam2);
			
			// chart1 data
			MemberDaoImp dao = sqlSession.getMapper(MemberDaoImp.class);
			List<Integer> newMember = dao.dashForMember(dbParam); // return type
		
			// dbParam for pie chart 
			Map<String, String> dbParam_pie = new HashMap<String, String>();
			dbParam_pie.put("startMonth", startMonth.toString());
			dbParam_pie.put("endMonth", endMonth.toString());
			
			System.out.println(dbParam_pie.get("startMonth"));
			System.out.println(dbParam_pie.get("endMonth"));
			
			// chart2 data
			dao = sqlSession.getMapper(MemberDaoImp.class);
			List<Map<String, Integer>> genderResult = dao.dashForGender(dbParam_pie);
			
			// chart3 data
			dao = sqlSession.getMapper(MemberDaoImp.class);
			List<Map<String, Integer>> ageResult = dao.dashForAge(dbParam_pie);

			// ChartJs �쟾�넚 �뜲�씠�꽣
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
			
			for(int i=0; i<newMember.size(); i++) {
				System.out.println(newMember.get(i));
			}
			
		
			for(int i=0; i<dataSize; i++) {
				String tmp = dbParam2.get(i);
//					System.out.println(tmp);
				dbParam2.set(i, "\'" + tmp +"\'");
//					System.out.println(dbParam2.get(i));
			}
			
			mav.addObject("dashData", newMember);
			mav.addObject("labelData", dbParam2);
			mav.addObject("dataSize", dataSize);
			mav.addObject("genderLabel", genderPieLbl);
			mav.addObject("genderData", genderPieData);
			mav.addObject("ageLabel", agePieLbl);
			mav.addObject("ageData", agePieData);
		
			mav.addObject("startMonth", startMonth);
			mav.addObject("endMonth", endMonth);
			
		System.out.println("startMonth:" + startMonth);
		System.out.println("endMonth:" + endMonth);
		// getChartData(startMonth, endMonth);
		mav.addObject("dataSize", 2);
		mav.setViewName("admin/adminStatMember");
		return mav;
	}
	
	@RequestMapping(value="/adminStatMember",method=RequestMethod.POST)
	@ResponseBody
	public ModelAndView adminStatMember(HttpServletRequest req, HttpServletResponse resp, @RequestParam(value="startMonth", required=false) String startMonth, @RequestParam(value="endMonth", required=false) String endMonth) {
		ModelAndView mav = new ModelAndView();
		
		if(startMonth==null || endMonth == null) {
			System.out.println("startMonth is null");
			
			SimpleDateFormat  yyyymm = new SimpleDateFormat("yyyy-MM");
			String todate =  yyyymm.format(new Date());
			if(Integer.parseInt(todate.substring(5, 7))-1 <= 0) {
				startMonth = (Integer.parseInt(todate.substring(0,3))-1) + "-" + (Integer.parseInt(todate.substring(5, 7))+12-1);
			}
			startMonth = todate.substring(0, 4) +  "-" + (Integer.parseInt(todate.substring(5, 7))-1);
			endMonth = todate;
		} 
		
		int dataSize = 0;
		if((Integer.parseInt(endMonth.substring(0, 4))) == (Integer.parseInt(startMonth.substring(0, 4)))) { // 2019-11 2020-02
			dataSize = Integer.parseInt(endMonth.substring(5,7)) - Integer.parseInt(startMonth.substring(5,7));
		} else{
			dataSize = (Integer.parseInt(endMonth.substring(0,4)) - Integer.parseInt(startMonth.substring(0,4)))*12;
			dataSize += Integer.parseInt(endMonth.substring(5,7)); 
			dataSize -= Integer.parseInt(startMonth.substring(5,7));
			
		}
		dataSize += 1;
		System.out.println(dataSize);
		
		List<String> dbParam2 = new ArrayList<String>();
		for(int i=0; i<dataSize; i++) {
			String tmp;
			if(Integer.parseInt(startMonth.substring(5, 7)) + i > 12) {
				tmp = Integer.parseInt(startMonth.substring(0,4))+1 + "-" + (Integer.parseInt(startMonth.substring(5, 7)) - 12 + i);
				System.out.println("tmp1:" + tmp);
			} else {
				tmp = Integer.parseInt(startMonth.substring(0,4)) + "-" + (Integer.parseInt(startMonth.substring(5, 7)) + i);
				System.out.println("tmp2:" + tmp);
			}
			if(tmp.length()<7) tmp = tmp.substring(0,4)+ "-0" + tmp.substring(5,6);
			dbParam2.add(tmp);
		}
		
		// dbParam definition
		Map<String, List> dbParam = new HashMap<String, List>();
		dbParam.put("list", dbParam2);
		
		// chart1 data
		MemberDaoImp dao = sqlSession.getMapper(MemberDaoImp.class);
		List<Integer> newMember = dao.dashForMember(dbParam); // return type
	
		// dbParam for pie chart 
		Map<String, String> dbParam_pie = new HashMap<String, String>();
		dbParam_pie.put("startMonth", startMonth.toString());
		dbParam_pie.put("endMonth", endMonth.toString());
		
		System.out.println(dbParam_pie.get("startMonth"));
		System.out.println(dbParam_pie.get("endMonth"));
		
		// chart2 data
		dao = sqlSession.getMapper(MemberDaoImp.class);
		List<Map<String, Integer>> genderResult = dao.dashForGender(dbParam_pie);
		
		// chart3 data
		dao = sqlSession.getMapper(MemberDaoImp.class);
		List<Map<String, Integer>> ageResult = dao.dashForAge(dbParam_pie);

		// ChartJs �쟾�넚 �뜲�씠�꽣
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
		
		for(int i=0; i<newMember.size(); i++) {
			System.out.println(newMember.get(i));
		}
		
		if(startMonth != null && endMonth != null) {
			for(int i=0; i<dataSize; i++) {
				String tmp = dbParam2.get(i);
//				System.out.println(tmp);
				dbParam2.set(i, "\'" + tmp +"\'");
//				System.out.println(dbParam2.get(i));
			}
//			System.out.println("generData.size:" + genderPieData.size());
//			System.out.println("ageData.size:" + agePieData.size());
			
			mav.addObject("dashData", newMember);
			mav.addObject("labelData", dbParam2);
			mav.addObject("dataSize", dataSize);
			mav.addObject("startMonth", startMonth);
			mav.addObject("endMonth", endMonth);
			mav.addObject("genderLabel", genderPieLbl);
			mav.addObject("genderData", genderPieData);
			mav.addObject("ageLabel", agePieLbl);
			mav.addObject("ageData", agePieData);
			
			System.out.println("ajax success");
//			System.out.println("labelData =="+dbParam2);
			try {
				//resp.getWriter().write("{\"result\":\"success\"}");
				mav.setViewName("admin/adminStatMember");
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
		System.out.println("startMonth:" + startMonth);
		System.out.println("endMonth:" + endMonth);
	//	mav.addObject("dataSize", dataSize);
	//	mav.addObject("newMember", newMember);
	//	mav.setViewName("admin/adminStatMember");
		return null;
	}
	@RequestMapping("/adminSettle")
	public ModelAndView adminSettle(@RequestParam(value="now", required=false) String now) {
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
	
		// sql 寃��깋 媛� �뀑�똿
		Map<String, String> dbParam = new HashMap<String, String>();
		dbParam.put("startDate", startDate);
		dbParam.put("endDate", endDate);
		dbParam.put("category", null);
		dbParam.put("username", null);
		dbParam.put("startNum", startNum+"");
		dbParam.put("endNum", endNum+"");
		
		int cntRecords = dao.selectCntAllSettle(dbParam); //移댁슫�듃
		
		int lastPage = 1;
		if(cntRecords % 20 == 0) {
			lastPage = cntRecords / 20;
		} else {
			lastPage = cntRecords / 20 + 1;
		}

		List<SettleVO> list = dao.selectAllSettle(dbParam); // 전체 리스트
		for(SettleVO tmp : list) {
			System.out.println(tmp.getClass_order_code());
		}
    
		List<SettleVO> result = dao.manageSettle(dbParam);
		dao = sqlSession.getMapper(SettleDaoImp.class);
		Integer cntAllSales = dao.countAllSales(dbParam);
		Integer cntSalesN = dao.countSalesN(dbParam);
		Integer cntSalesY = dao.countSalesY(dbParam);
		
		if(cntAllSales == null) cntAllSales = 0;
		if(cntSalesN == null) cntSalesN = 0;
		if(cntSalesY == null) cntSalesY = 0;
		
		System.out.println(cntAllSales);
		System.out.println(cntSalesN);
		System.out.println(cntSalesY);
		
		
		mav.addObject("method", "get");
		mav.addObject("SelectSettleList",list);
		mav.addObject("cntData", list.size());
		mav.addObject("lastPage", lastPage);
		mav.addObject("nowPage", nowPage);
		
		mav.addObject("startDate", startDate);
		mav.addObject("endDate", endDate);
		mav.addObject("category", null);
		mav.addObject("username", null);
		mav.addObject("data", result);
		mav.addObject("cntAllSales", cntAllSales);
		mav.addObject("cntSalesN", cntSalesN);
		mav.addObject("cntSalesY", cntSalesY);
		mav.setViewName("admin/adminSettle");
		
		return mav;
	}
	
	@RequestMapping(value="/adminSettle", method=RequestMethod.POST)
	@ResponseBody
	public ModelAndView adminSettle(@RequestParam(value="now", required=false) String now, HttpServletRequest req, HttpServletResponse resp, @RequestParam(value="startDate", required=false) String startDate, @RequestParam(value="endDate", required=false) String endDate,  @RequestParam(value="category", required=false) String category, @RequestParam(value="username", required=false) String username) {
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
		if(username.length() <= 0) username = null;
		
		System.out.println(username);
		// sql 寃��깋 媛� �뀑�똿
		Map<String, String> dbParam = new HashMap<String, String>();
		dbParam.put("startDate", startDate);
		dbParam.put("endDate", endDate);
		dbParam.put("category", category);
		dbParam.put("username", username);
		dbParam.put("startNum", startNum + "");
		dbParam.put("endNum", endNum +"");
		
		int cntRecords = dao.selectCntAllSettle(dbParam);
		
		int lastPage = 1;
		if(cntRecords % 20 == 0) {
			lastPage = cntRecords / 20;
		} else {
			lastPage = cntRecords / 20 + 1;
		}
		List<SettleVO> list = dao.selectAllSettle(dbParam);
		List<SettleVO> result = dao.manageSettle(dbParam);
		dao = sqlSession.getMapper(SettleDaoImp.class);
		Integer cntAllSales = dao.countAllSales(dbParam);
		Integer cntSalesN = dao.countSalesN(dbParam);
		Integer cntSalesY = dao.countSalesY(dbParam);
		
		
		if(cntAllSales == null) cntAllSales = 0;
		if(cntSalesN == null) cntSalesN = 0;
		if(cntSalesY == null) cntSalesY = 0;
		
				
		
		if(startDate != null && endDate != null && list != null) {
			
			mav.addObject("method", "post");
			mav.addObject("SelectSettleList",list);
			mav.addObject("nowPage", nowPage);
			mav.addObject("cntData", list.size());
			mav.addObject("lastPage", lastPage);
			
			mav.addObject("startDate", startDate);
			mav.addObject("endDate", endDate);
			mav.addObject("category", category);
			mav.addObject("username", username);
			mav.addObject("data", result);
			mav.addObject("cntAllSales", cntAllSales);
			mav.addObject("cntSalesN", cntSalesN);
			mav.addObject("cntSalesY", cntSalesY);
			
			System.out.println("data"+result);
			System.out.println("ajax success");
			try {
				//resp.getWriter().write("{\"result\":\"success\"}");
				mav.setViewName("admin/adminSettle");
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
	
	
	@RequestMapping(value="/adminSettleEditOk", method=RequestMethod.POST)
	public ModelAndView adminSettleEditOk(HttpServletRequest req) throws UnsupportedEncodingException {
		
		ModelAndView mav = new ModelAndView();
		
		req.setCharacterEncoding("UTF-8");
		Enumeration e1 = req.getParameterNames();
		
		ArrayList<String> chked = new ArrayList<String>();
		while(e1.hasMoreElements()) {
			 String element = (String) e1.nextElement();
			 if(element.contains("chk")) {
				 if(element != null && element.length() > 0) {
					 element = element.substring(4);
					 chked.add(element); // chk_${data.order_code}, student3, student4....	
					 System.out.println(element);
				 }
			 }
		}
		
		for(int i=0; i<chked.size(); i++){
			String class_order_code = req.getParameter("code_" + chked.get(i));
			String userId = req.getParameter("userid_" + chked.get(i));
			String price = req.getParameter("price_" + chked.get(i));
			
			System.out.println(class_order_code);
			System.out.println(userId);
			System.out.println(price);
			
			Map<String, String> dbParam = new HashMap<String, String>();
			dbParam.put("class_order_code", class_order_code);
			dbParam.put("userid", userId);
			dbParam.put("price", price);
			
			SettleDaoImp dao = sqlSession.getMapper(SettleDaoImp.class);
			//정산 테이블 insert
			dao.SettleInfoInsert(dbParam);
			// class_order 테이블 정산여부 'Y' 처리
			int result = dao.SettleStateUpdate(class_order_code);
			
			if(result == chked.size()) {
				mav.setViewName("redirect:adminSettle");
			} else {
				mav.setViewName("redirect:adminSettle");
			}
			
		}
		
		return mav;

	}
	
	@RequestMapping(value="adminStoreEditOk", method=RequestMethod.POST)
	public ModelAndView adminStoreEditOk(HttpServletRequest req) throws UnsupportedEncodingException {
		ModelAndView mav = new ModelAndView();
		
		req.setCharacterEncoding("UTF-8");
		Enumeration e1 = req.getParameterNames();
		
		ArrayList<String> chked = new ArrayList<String>();
		while(e1.hasMoreElements()) {
			 String element = (String) e1.nextElement();
			 if(element.contains("chk")) {
				 if(element != null && element.length() > 0) {
					 element = element.substring(4);
					 chked.add(element); // chk_${data.order_code}, student3, student4....	
					 System.out.println(element);
				 }
			 }
		}
		
		for(int i=0; i<chked.size(); i++){
			String goods_order_code = req.getParameter("code_" + chked.get(i));
			
			System.out.println(goods_order_code);
			
			SettleDaoImp dao = sqlSession.getMapper(SettleDaoImp.class);

			// goods_order 테이블 finished '확정' 처리
			int result = dao.PaymentStateUpdate(goods_order_code);
			
			if(result == chked.size()) {
				mav.setViewName("redirect:adminPaymentStore");
			} else {
				mav.setViewName("redirect:adminPaymentStore");
			}
			
		}
		return mav;
	}
	
	@RequestMapping("/adminPaymentStore")
	public ModelAndView adminPaymentStore(@RequestParam(value="now", required=false) String now) {
		

		int nowPage = 1;
		if(now != null && now.length() > 0){
			nowPage = Integer.parseInt(now);
		}
		int startNum = 20 * (nowPage - 1) + 1;
		int endNum = 20 * nowPage;
		
		SettleDaoImp dao = sqlSession.getMapper(SettleDaoImp.class);
		dao = sqlSession.getMapper(SettleDaoImp.class);
		
		ModelAndView mav = new ModelAndView();
		
		SimpleDateFormat  yyyymmdd = new SimpleDateFormat("yyyy-MM-dd");
		String todate =  yyyymmdd.format(new Date());
		String startDate = todate.substring(0, 8) + "01";
		String endDate = todate;
	
		// sql 寃��깋 媛� �뀑�똿
		Map<String, String> dbParam = new HashMap<String, String>();
		dbParam.put("startDate", startDate);
		dbParam.put("endDate", endDate);
		dbParam.put("category", null);
		dbParam.put("username", null);
		dbParam.put("startNum", startNum + "");
		dbParam.put("endNum", endNum +"");
		
		int cntRecords = dao.selectCntAllStore(dbParam);
		
		int lastPage = 1;
		if(cntRecords % 20 == 0) {
			lastPage = cntRecords / 20;
		} else {
			lastPage = cntRecords / 20 + 1;
		}
		
		List<SettleVO> list = dao.selectAllStore(dbParam); // �쟾泥� �쉶�썝 由ъ뒪�듃
		
		
		List<SettleVO> result = dao.managePaymentStore(dbParam);
		Integer cntAllPayment = dao.paymentStoreAll(dbParam);
		Integer cntPaymentN = dao.paymentStoreN(dbParam);
		Integer cntPaymentY = dao.paymentStoreY(dbParam);
		
		if(cntAllPayment == null) cntAllPayment = 0;
		if(cntPaymentN == null) cntPaymentN = 0;
		if(cntPaymentY == null) cntPaymentY = 0;
		
		System.out.println(cntAllPayment);
		System.out.println(cntPaymentN);
		System.out.println(cntPaymentY);
		
		mav.addObject("method", "get");
		mav.addObject("SettleStoreList",list);
		mav.addObject("cntData", list.size());
		mav.addObject("lastPage", lastPage);
		mav.addObject("nowPage", nowPage);
		
		mav.addObject("startDate", startDate);
		mav.addObject("endDate", endDate);
		mav.addObject("category", null);
		mav.addObject("username", null);
		mav.addObject("data", result);
		mav.addObject("cntAllPayment", cntAllPayment);
		mav.addObject("cntPaymentN", cntPaymentN);
		mav.addObject("cntPaymentY", cntPaymentY);
		mav.setViewName("admin/adminPaymentStore");
		
		return mav;

	}
	@RequestMapping(value="/adminPaymentStore", method=RequestMethod.POST)
	@ResponseBody
	public ModelAndView adminPaymentStore(@RequestParam(value="now", required=false) String now,HttpServletRequest req, HttpServletResponse resp, @RequestParam(value="startDate", required=false) String startDate, @RequestParam(value="endDate", required=false) String endDate,  @RequestParam(value="category", required=false) String category, @RequestParam(value="username", required=false) String username) {
		ModelAndView mav = new ModelAndView();
		
		int nowPage = 1;
		if(now != null && now.length() > 0){
			nowPage = Integer.parseInt(now);
			System.out.println(nowPage);
		}
		int startNum = 20 * (nowPage - 1) + 1;
		int endNum = 20 * nowPage;
		
		SettleDaoImp dao = sqlSession.getMapper(SettleDaoImp.class);

		if(startDate==null || endDate == null) {
			System.out.println("startMonth is null");
			
			SimpleDateFormat  yyyymmdd = new SimpleDateFormat("yyyy-MM-dd");
			String todate =  yyyymmdd.format(new Date());
			
			startDate = todate.substring(0, 8) + "01";
			endDate = todate;
		} 
		
		if(category.length() <= 0) category = null;
		if(username.length() <= 0) username = null;
		
		System.out.println(username);
		// sql 寃��깋 媛� �뀑�똿
		Map<String, String> dbParam = new HashMap<String, String>();
		dbParam.put("startDate", startDate);
		dbParam.put("endDate", endDate);
		dbParam.put("category", category);
		dbParam.put("username", username);
		dbParam.put("startNum", startNum + "");
		dbParam.put("endNum", endNum +"");
		
		int cntRecords = dao.selectCntAllStore(dbParam);
		
		int lastPage = 1;
		if(cntRecords % 20 == 0) {
			lastPage = cntRecords / 20;
		} else {
			lastPage = cntRecords / 20 + 1;
		}

		List<SettleVO> list = dao.selectAllStore(dbParam); 
		List<SettleVO> result = dao.managePaymentStore(dbParam);
		System.out.println("result="+result);
		dao = sqlSession.getMapper(SettleDaoImp.class);
		Integer cntAllPayment = dao.paymentStoreAll(dbParam);
		Integer cntPaymentN = dao.paymentStoreN(dbParam);
		Integer cntPaymentY = dao.paymentStoreY(dbParam);
		
		if(cntAllPayment == null) cntAllPayment = 0;
		if(cntPaymentN == null) cntPaymentN = 0;
		if(cntPaymentY == null) cntPaymentY = 0;
		
		
		if(startDate != null && endDate != null && list != null) {
			
			
			mav.addObject("method", "post");
			mav.addObject("SettleStoreList",list);
			mav.addObject("nowPage", nowPage);
			mav.addObject("lastPage", lastPage);
			mav.addObject("startDate", startDate);
			mav.addObject("endDate", endDate);
			mav.addObject("category", category);
			mav.addObject("username", username);
			mav.addObject("data", result);
			mav.addObject("cntAllPayment", cntAllPayment);
			mav.addObject("cntPaymentN", cntPaymentN);
			mav.addObject("cntPaymentY", cntPaymentY);
			

			System.out.println("ajax success");
			try {
				//resp.getWriter().write("{\"result\":\"success\"}");
				mav.setViewName("admin/adminPaymentStore");
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

	@RequestMapping("/adminPaymentClass")
	public ModelAndView adminPaymentClass(@RequestParam(value="now", required=false) String now) {
		
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
	
		// sql 寃��깋 媛� �뀑�똿
		Map<String, String> dbParam = new HashMap<String, String>();
		dbParam.put("startDate", startDate);
		dbParam.put("endDate", endDate);
		dbParam.put("category", null);
		dbParam.put("username", null);
		dbParam.put("startNum", startNum+"");
		dbParam.put("endNum", endNum+"");
		
		int cntRecords = dao.selectCntAllClass(dbParam);
		
		int lastPage = 1;
		if(cntRecords % 20 == 0) {
			lastPage = cntRecords / 20;
		} else {
			lastPage = cntRecords / 20 + 1;
		}
		List<SettleVO> list = dao.selectAllClass(dbParam); // �쟾泥� �쉶�썝 由ъ뒪�듃	
		List<SettleVO> result = dao.managePaymentClass(dbParam);
		dao = sqlSession.getMapper(SettleDaoImp.class);
		Integer cntAllPaymentClass = dao.paymentClassAll(dbParam);
		Integer cntPaymentClassY = dao.paymentClassY(dbParam);
		Integer cntPaymentClassN = dao.paymentClassN(dbParam);
		
		
		if(cntAllPaymentClass == null) cntAllPaymentClass = 0;
		if(cntPaymentClassY == null) cntPaymentClassY = 0;
		if(cntPaymentClassN == null) cntPaymentClassN = 0;
		
		System.out.println(cntAllPaymentClass);
		System.out.println(cntPaymentClassY);
		
		
		mav.addObject("method", "get");
		mav.addObject("SelectClassList",list);
		mav.addObject("cntData", list.size());
		mav.addObject("lastPage", lastPage);
		mav.addObject("nowPage", nowPage);
		mav.addObject("startDate", startDate);
		mav.addObject("endDate", endDate);
		mav.addObject("category", null);
		mav.addObject("username", null);
		mav.addObject("data", result);
		mav.addObject("cntAllPaymentClass", cntAllPaymentClass);
		mav.addObject("cntPaymentClassY", cntPaymentClassY);
		mav.addObject("cntPaymentClassN", cntPaymentClassN);
		mav.setViewName("admin/adminPaymentClass");
		
		return mav;

	}
	@RequestMapping(value="/adminPaymentClass", method=RequestMethod.POST)
	@ResponseBody
	public ModelAndView adminPaymentClass(@RequestParam(value="now", required=false) String now,HttpServletRequest req, HttpServletResponse resp, @RequestParam(value="startDate", required=false) String startDate, @RequestParam(value="endDate", required=false) String endDate,  @RequestParam(value="category", required=false) String category, @RequestParam(value="username", required=false) String username) {
		
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
		if(username.length() <= 0) username = null;
		
		System.out.println(username);
		// sql 寃��깋 媛� �뀑�똿
		Map<String, String> dbParam = new HashMap<String, String>();
		dbParam.put("startDate", startDate);
		dbParam.put("endDate", endDate);
		dbParam.put("category", category);
		dbParam.put("username", username);
		dbParam.put("startNum", startNum + "");
		dbParam.put("endNum", endNum +"");
		
		int cntRecords = dao.selectCntAllClass(dbParam);
		
		int lastPage = 1;
		if(cntRecords % 20 == 0) {
			lastPage = cntRecords / 20;
		} else {
			lastPage = cntRecords / 20 + 1;
		}

		List<SettleVO> list = dao.selectAllClass(dbParam); // �쟾泥� �쉶�썝 由ъ뒪�듃
		List<SettleVO> result = dao.managePaymentClass(dbParam);
		dao = sqlSession.getMapper(SettleDaoImp.class);
		Integer cntAllPaymentClass = dao.paymentClassAll(dbParam);
		Integer cntPaymentClassY = dao.paymentClassY(dbParam);
		Integer cntPaymentClassN = dao.paymentClassN(dbParam);
		
		if(cntAllPaymentClass == null) cntAllPaymentClass = 0;
		if(cntPaymentClassY == null) cntPaymentClassY = 0;
		if(cntPaymentClassN == null) cntPaymentClassN = 0;

		
		if(startDate != null && endDate != null && list!= null) {
			
			
			mav.addObject("method", "post");
			mav.addObject("SelectClassList",list);
			mav.addObject("nowPage", nowPage);
			mav.addObject("cntData", list.size());
			mav.addObject("lastPage", lastPage);

			mav.addObject("startDate", startDate);
			mav.addObject("endDate", endDate);
			mav.addObject("category", category);
			mav.addObject("username", username);
			mav.addObject("data", result);
			mav.addObject("cntAllPaymentClass", cntAllPaymentClass);
			mav.addObject("cntPaymentClassY", cntPaymentClassY);
			mav.addObject("cntPaymentClassN", cntPaymentClassN);

			System.out.println("ajax success");
			try {
				//resp.getWriter().write("{\"result\":\"success\"}");
				mav.setViewName("admin/adminPaymentClass");
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

	
	@RequestMapping("/adminReturn")
	public String adminReturn() {
		return "admin/adminReturn";
	}
	
	@RequestMapping(value="/adminVideo" , method=RequestMethod.GET)
	public ModelAndView adminVideo(@RequestParam(value="now", required=false) String now) {
		
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
		
		ClassDaoImp dao = sqlSession.getMapper(ClassDaoImp.class);		
		dao = sqlSession.getMapper(ClassDaoImp.class);
				
		int cntRecords = dao.getVideoRecordCount(dbParam);
		
		int lastPage = 1;
		if(cntRecords % 10 == 0) {
			lastPage = cntRecords / 10;
		} else {
			lastPage = cntRecords / 10 + 1;
		}
		
		List<ClassVideoVO> vlist = dao.getClassVideoList(dbParam);
		
		
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
		mav.setViewName("admin/adminVideo");
	
		return mav;
	}
	
	@RequestMapping(value="/adminVideo", method=RequestMethod.POST)
	@ResponseBody
	public ModelAndView adminVideo(HttpServletRequest req, HttpServletResponse resp, @RequestParam(value="startDate", required=false) String startDate, @RequestParam(value="endDate", required=false) String endDate,
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
	@RequestMapping(value="/videoUpload",method = RequestMethod.POST)
	@ResponseBody
	public HashMap<String,Object> videoUpload(HttpSession session, MultipartHttpServletRequest mhsr,
			@RequestParam("code") String code){
		String path=session.getServletContext().getRealPath("/upload/class_video");
		MultipartFile file=mhsr.getFile("file");
		boolean isc=file.isEmpty();
		String filePath=null;
		String filename=null;
		String sizeStr=null;
		if(!isc){
			String fName=file.getOriginalFilename();
			if(fName!=null&&!fName.equals("")) {
				String oriFileName=fName.substring(0,fName.lastIndexOf("."));
				String oriExt=fName.substring(fName.lastIndexOf("."));
				File newFile=new File(path,code+"_"+fName);
				if(newFile.exists()) {
					for (int renameNum=1;;renameNum++) {
						String renameFile=code+"_"+oriFileName+"("+renameNum+")"+oriExt;
						System.out.println("filename==> "+renameFile);
						newFile=new File(path,renameFile);
						if(!newFile.exists()) {
							fName=renameFile;
							break;
						}//if
					}//for
				}//if
				try {
					file.transferTo(newFile);
					filePath="/gachi/upload/class_video/"+newFile.getName();
					filename=newFile.getName();
					sizeStr=byteCalculation(newFile.length());
				} catch (Exception e) {
					e.printStackTrace();
				}
			}//if
		}
		
		ClassDaoImp dao=sqlSession.getMapper(ClassDaoImp.class);
		int unitMax=dao.getUnitMax(code);
		List<String> conList=dao.getUnitContent(code);
		HashMap<String,Object> map =new HashMap<String, Object>();
		map.put("filePath",filePath);
		map.put("unitMax",unitMax);
		map.put("conList",conList);
		map.put("filename",filename);
		map.put("sizeStr",sizeStr);
		return map;
	}
	@RequestMapping("/adminVideoWrite")
	public String adminVideoWrite() {
		return "admin/adminVideoWrite";
	}
	@RequestMapping(value="/adminVideoWriteOk",method=RequestMethod.POST)
	public ModelAndView adminVideoWriteOk(ClassVideoVO vo,HttpServletRequest req) {
		ClassDaoImp dao =sqlSession.getMapper(ClassDaoImp.class);
		int[] unitArray=vo.getUnitArray();
		int[] sectionIndex=vo.getSectionIndex();
		String[] enrollDate=vo.getEnrollDate();
		String[] unitContent=vo.getUnitContent();
		String[] videoName=vo.getVideoName();
		String[] videoFileName=vo.getVideoFileName();
		double[] videoLength=vo.getVideoLength();
		List<String> sectionCode=new ArrayList<String>();
		List<ClassVideoVO> list=new ArrayList<ClassVideoVO>();
		
		ClassvideoSort cvs=new ClassvideoSort();
		ModelAndView mav=new ModelAndView();
		
		
		for(int i=0;i<unitContent.length;i++){
			String section_code=dao.selectSectionCode(unitContent[i]);
			sectionCode.add(section_code);
		}
		
			for (int i = 0; i < unitArray.length; i++) {
				ClassVideoVO vo1=new ClassVideoVO();
				vo1.setCode(vo.getCode());
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd"); 
				String dateStr = null;
				try {
					Date date = sdf.parse(enrollDate[i]);
					dateStr = sdf.format(date);
				} catch (java.text.ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				vo1.setVideo_code("v"+dateStr);
				vo1.setSection_code(sectionCode.get(i));
				vo1.setVideo_name(videoName[i]);
				vo1.setVideo_length(videoLength[i]);
				vo1.setSection_index(sectionIndex[i]);
				vo1.setVideo_filename(videoFileName[i]);
				list.add(vo1);
			}
			Collections.sort(list,cvs);
			for (int i = 0; i < list.size(); i++) {
				ClassVideoVO vo3=list.get(i);
				int result=dao.videoInsert(vo3);
				if(result<=0) {
					break;
				}
			}
			mav.setViewName("redirect:adminVideo");
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
	@RequestMapping("/adminVideoView")
	public ModelAndView adminVideoView(HttpServletRequest req){
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
		String videoName=dao.getVideoName(filename);
		List<ClassVideoVO> videoList=dao.selectClassVideoList(code);
		List<ClassVideoVO> unitList=dao.selectSection(code);
		
		mav.addObject("videoList", videoList);
		mav.addObject("unitList", unitList);
		mav.addObject("category",category);
		mav.addObject("className",className);
		mav.addObject("filename",filename);
		mav.addObject("code",code);
		mav.addObject("videoName",videoName);
		mav.setViewName("admin/adminVideoView");
		return mav;
	} 
	
	
	
	@RequestMapping("/adminClassReview")
	public ModelAndView adminClassReview(@RequestParam(value="now", required=false) String now) {
		int nowPage = 1;
		if(now != null && now.length() > 0){
			nowPage = Integer.parseInt(now);
		}
		int startNum = 20 * (nowPage - 1) + 1;
		int endNum = 20 * nowPage;
		
		
		ClassDaoImp dao = sqlSession.getMapper(ClassDaoImp.class);

		
		SimpleDateFormat  yyyymmdd = new SimpleDateFormat("yyyy-MM-dd");
		String todate =  yyyymmdd.format(new Date());
		String startDate = todate.substring(0, 8) + "01";
		String endDate = todate;
		
		Map<String, String> dbParam = new HashMap<String, String>();
		dbParam.put("startDate", startDate);
		dbParam.put("endDate", endDate);
		dbParam.put("grade", null);
		dbParam.put("category", null);
		dbParam.put("search", null);
		dbParam.put("startNum", startNum+"");
		dbParam.put("endNum", endNum+"");
		
//		dao = sqlSession.getMapper(ClassDaoImp.class);
				
		int cntRecords = dao.selectCntAllReview(dbParam);
		
		int lastPage = 1;
		if(cntRecords % 20 == 0) {
			lastPage = cntRecords / 20;
		} else {
			lastPage = cntRecords / 20 + 1;
		}
		
		List<ClassVO> list = dao.selectAllReview(dbParam);
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
		mav.addObject("grade", null);
		mav.addObject("category", null);
		mav.addObject("search", null);

//		System.out.println("list"+list.get(0).getCategory());
		System.out.println("list+"+list.size());
		System.out.println("startDate"+startDate);
		System.out.println("endDate"+endDate);
//		mav.addObject("data", result);
		mav.setViewName("admin/adminClassReview");
	
		return mav;
	}
	
	@RequestMapping(value="/adminClassReview", method=RequestMethod.POST)
	@ResponseBody
	public ModelAndView adminClassReview(HttpServletRequest req, HttpServletResponse resp, @RequestParam(value="startDate", required=false) String startDate, @RequestParam(value="endDate", required=false) String endDate,
																@RequestParam(value="category", required=false) String category, @RequestParam(value="grade", required=false) String grade , 
																@RequestParam(value="search", required=false) String search,
																@RequestParam(value="now", required=false) String now) {
		int nowPage = 1;
		if(now != null && now.length() > 0){
			nowPage = Integer.parseInt(now);
		}
		int startNum = 20 * (nowPage - 1) + 1;
		int endNum = 20 * nowPage;
		
		ModelAndView mav =new ModelAndView();
		ClassDaoImp dao = sqlSession.getMapper(ClassDaoImp.class);
//		SettleDaoImp sdao = sqlSession.getMapper(SettleDaoImp.class);

		if(startDate==null || endDate == null) {
			
			SimpleDateFormat  yyyymmdd = new SimpleDateFormat("yyyy-MM-dd");
			String todate =  yyyymmdd.format(new Date());
			
			startDate = todate.substring(0, 8) + "01";
			endDate = todate;
		} 
		if(grade.length() <= 0) grade = null;
		if(category.length() <= 0) category = null;
		if(search.length() <= 0) search = null;

		
		Map<String, String> dbParam = new HashMap<String, String>();
		dbParam.put("startDate", startDate);
		dbParam.put("endDate", endDate);
		dbParam.put("grade", grade);
		dbParam.put("category", category);
		dbParam.put("search", search);
		dbParam.put("startNum", startNum+"");
		dbParam.put("endNum", endNum+"");
		
		dao = sqlSession.getMapper(ClassDaoImp.class);
				
		int cntRecords = dao.selectCntAllReview(dbParam);
		
		int lastPage = 1;
		if(cntRecords % 20 == 0) {
			lastPage = cntRecords / 20;
		} else {
			lastPage = cntRecords / 20 + 1;
		}
		
		List<ClassVO> list = dao.selectAllReview(dbParam);
		
		
		if(startDate != null && endDate != null && list != null) {
			
			mav.addObject("method", "post");
			mav.addObject("list",list);
			mav.addObject("nowPage", nowPage);
			mav.addObject("cntData", list.size());
			mav.addObject("lastPage", lastPage);
			
			mav.addObject("startDate", startDate);
			mav.addObject("endDate", endDate);
			mav.addObject("grade", grade);
			mav.addObject("category", category);
			mav.addObject("search", search);

			try {
				//resp.getWriter().write("{\"result\":\"success\"}");
				mav.setViewName("admin/adminClassReview");
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
	@RequestMapping("/adminReply")
	public ModelAndView adminReply(@RequestParam(value="now", required=false) String now) {
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
		dbParam.put("grade", null);
		dbParam.put("category", null);
		dbParam.put("search", null);
		dbParam.put("startNum", startNum+"");
		dbParam.put("endNum", endNum+"");
		
//		dao = sqlSession.getMapper(ClassDaoImp.class);
				
		int cntRecords = dao.selectCntAllReply(dbParam);
		
		int lastPage = 1;
		if(cntRecords % 20 == 0) {
			lastPage = cntRecords / 20;
		} else {
			lastPage = cntRecords / 20 + 1;
		}
		
		List<QnaVO> list = dao.selectAllReply(dbParam);
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
		mav.addObject("grade", null);
		mav.addObject("category", null);
		mav.addObject("search", null);

//		System.out.println("list"+list.get(0).getCategory());
		System.out.println("list+"+list.size());
		System.out.println("startDate"+startDate);
		System.out.println("endDate"+endDate);
//		mav.addObject("data", result);
		mav.setViewName("admin/adminReply");
	
		return mav;
	}
	
	@RequestMapping(value="/adminReply", method=RequestMethod.POST)
	@ResponseBody
	public ModelAndView adminReply(HttpServletRequest req, HttpServletResponse resp, @RequestParam(value="startDate", required=false) String startDate, @RequestParam(value="endDate", required=false) String endDate,
																@RequestParam(value="category", required=false) String category, @RequestParam(value="grade", required=false) String grade , 
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
		if(grade.length() <= 0) grade = null;
		if(category.length() <= 0) category = null;
		if(search.length() <= 0) search = null;

		
		Map<String, String> dbParam = new HashMap<String, String>();
		dbParam.put("startDate", startDate);
		dbParam.put("endDate", endDate);
		dbParam.put("grade", grade);
		dbParam.put("category", category);
		dbParam.put("search", search);
		dbParam.put("startNum", startNum+"");
		dbParam.put("endNum", endNum+"");
		
		dao = sqlSession.getMapper(SettleDaoImp.class);
				
		int cntRecords = dao.selectCntAllReply(dbParam);
		
		int lastPage = 1;
		if(cntRecords % 20 == 0) {
			lastPage = cntRecords / 20;
		} else {
			lastPage = cntRecords / 20 + 1;
		}
		
		List<QnaVO> list = dao.selectAllReply(dbParam);
		
		
		if(startDate != null && endDate != null && list != null) {
			
			mav.addObject("method", "post");
			mav.addObject("list",list);
			mav.addObject("nowPage", nowPage);
			mav.addObject("cntData", list.size());
			mav.addObject("lastPage", lastPage);
			
			mav.addObject("startDate", startDate);
			mav.addObject("endDate", endDate);
			mav.addObject("grade", grade);
			mav.addObject("category", category);
			mav.addObject("search", search);

			try {
				//resp.getWriter().write("{\"result\":\"success\"}");
				mav.setViewName("admin/adminReply");
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
	
	@RequestMapping("/adminReplyView")
	public ModelAndView adminReplyView(int num) {
		SettleDaoImp dao = sqlSession.getMapper(SettleDaoImp.class);
		
		QnaVO list = dao.selectReplyView(num);
		ModelAndView mav = new ModelAndView();	
		
		mav.addObject("list",list);		
		mav.setViewName("admin/adminReplyView");
		return mav;
	}
		
	@RequestMapping("/adminClassReviewView")
	public ModelAndView adminClassReviewView(int num) {
		ClassDaoImp dao = sqlSession.getMapper(ClassDaoImp.class);
		
		ClassVO list = dao.selectReviewView(num);
		ModelAndView mav = new ModelAndView();	
		
		mav.addObject("list",list);		
		mav.setViewName("admin/adminClassReviewView");
		return mav;
	}
	@RequestMapping("/adminAnswer")
	public ModelAndView adminAnswer(@RequestParam(value="now", required=false) String now) {
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
				
		int cntRecords = dao.selectCntAllQna(dbParam);
		
		int lastPage = 1;
		if(cntRecords % 20 == 0) {
			lastPage = cntRecords / 20;
		} else {
			lastPage = cntRecords / 20 + 1;
		}
		
		List<QnaVO> list = dao.selectAllQna(dbParam);
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

		mav.setViewName("admin/adminAnswer");
	
		return mav;
	}
	
	@RequestMapping(value="/adminAnswer", method=RequestMethod.POST)
	@ResponseBody
	public ModelAndView adminAnswer(HttpServletRequest req, HttpServletResponse resp, @RequestParam(value="startDate", required=false) String startDate, @RequestParam(value="endDate", required=false) String endDate,
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
				
		int cntRecords = dao.selectCntAllQna(dbParam);
		
		int lastPage = 1;
		if(cntRecords % 20 == 0) {
			lastPage = cntRecords / 20;
		} else {
			lastPage = cntRecords / 20 + 1;
		}
		
		List<QnaVO> list = dao.selectAllQna(dbParam);
		
		
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
				mav.setViewName("admin/adminAnswer");
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
	@RequestMapping("/adminAnswerView")
	public ModelAndView adminAnswerView(int num) {
		SettleDaoImp dao = sqlSession.getMapper(SettleDaoImp.class);
		
		QnaVO list = dao.selectAnswerView(num);
		ModelAndView mav = new ModelAndView();	
		
		mav.addObject("list",list);		
		mav.setViewName("admin/adminAnswerView");
		return mav;
	}
	@RequestMapping(value="/adminAnswerOk",method=RequestMethod.POST)
	public ModelAndView adminAnswerOk(@RequestParam String num, HttpSession ses, @RequestParam String answer) {
		String admin = (String)ses.getAttribute("userid");
		ModelAndView mav = new ModelAndView();
		SettleDaoImp dao = sqlSession.getMapper(SettleDaoImp.class);
		
		Map<String, String> dbParam = new HashMap<String, String>();
		dbParam.put("num", num);
		dbParam.put("answer", answer);
		dbParam.put("writer", admin);
		
		int result = dao.creatorUpdateAnswer(dbParam);
			mav.setViewName("redirect:adminAnswerView?num="+num);	
		
		return mav;
	}
	@RequestMapping("/adminGetClassList")
	@ResponseBody
	public List<ClassVO> adminGetClassList(HttpServletRequest req){
		ClassDaoImp dao=sqlSession.getMapper(ClassDaoImp.class);
		String category=req.getParameter("value");
		List<ClassVO> list=dao.getClassAllList(category);
		return list;
	}
	@RequestMapping("/adminGetVideoInfo")
	@ResponseBody
	public List<ClassVideoVO> adminGetVideoInfo(HttpServletRequest req){
		ClassDaoImp dao=sqlSession.getMapper(ClassDaoImp.class);
		String code=req.getParameter("code");
		List<ClassVideoVO> list=dao.selectSection(code);
		return list;
	}
	
	@RequestMapping("/adminGetCode")
	@ResponseBody
	public String adminGetCode(HttpServletRequest req){
		ClassDaoImp dao=sqlSession.getMapper(ClassDaoImp.class);
		String class_name=req.getParameter("class_name");
		String code=dao.getCode(class_name);
		System.out.println("code===> "+code);
		return code;
	}
	@RequestMapping("/videoDelete")
	@ResponseBody
	public void videoDelete(HttpServletRequest req) {
		String fileName=req.getParameter("fileName");
		String path=req.getSession().getServletContext().getRealPath("/upload/class_video");
		File delFile=new File(path,fileName);
		if(delFile.exists()) {
			delFile.delete();
		}
	}
	@RequestMapping("/unitDel")
	@ResponseBody
	public void unitDel(HttpServletRequest req) {
		String section_code=req.getParameter("section_code");
		ClassDaoImp dao=sqlSession.getMapper(ClassDaoImp.class);
		dao.deleteSection(section_code);
	}
	
	@RequestMapping(value="/adminVideoUpdate",method=RequestMethod.POST)
	public ModelAndView adminVideoUpdate(ClassVideoVO vo) {
		ClassDaoImp dao=sqlSession.getMapper(ClassDaoImp.class);
		int[] unitArray=vo.getUnitArray();
		int[] sectionIndex=vo.getSectionIndex();
		String[] enrollDate=vo.getEnrollDate();
		String[] unitContent=vo.getUnitContent();
		String[] videoName=vo.getVideoName();
		String[] videoFileName=vo.getVideoFileName();
		String[] videoCode=vo.getVideoCode();
		double[] videoLength=vo.getVideoLength();
		List<String> sectionCode=new ArrayList<String>();
		List<ClassVideoVO> list=new ArrayList<ClassVideoVO>();
		
		for(int i=0;i<unitContent.length;i++){
			String section_code=dao.selectSectionCode(unitContent[i]);
			sectionCode.add(section_code);
		}
		
		for(int i=0;i<unitArray.length;i++){
			ClassVideoVO vo2=new ClassVideoVO();
			System.out.println("videocode=> "+videoCode[i]);
			System.out.println("videoLength=> "+videoLength[i]);
			if(videoCode[i]==null||videoCode[i].equals("")){
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd"); 
				String dateStr = null;
				try {
					Date date = sdf.parse(enrollDate[i]);
					dateStr = sdf.format(date);
				} catch (java.text.ParseException e) {
					e.printStackTrace();
				}
				String vc="v"+dateStr;
				vo2.setVideo_code(vc);
				vo2.setUnit(unitArray[i]);
				vo2.setSection_index(sectionIndex[i]);
				vo2.setVideo_name(videoName[i]);
				vo2.setVideo_filename(videoFileName[i]);
				vo2.setCode(vo.getCode());
				vo2.setVideo_length(videoLength[i]);
				vo2.setSection_code(sectionCode.get(i));
				list.add(vo2);
			}
		}
		ClassvideoSort cvs=new ClassvideoSort();
		Collections.sort(list,cvs);
		for (int i=0;i<list.size();i++) {
			ClassVideoVO vo3=list.get(i);
			dao.videoInsert(vo3);
		}
		ModelAndView mav=new ModelAndView();
		mav.addObject("code",vo.getCode());
		mav.addObject("video_filename", list.get(0).getVideo_filename());
		mav.setViewName("admin/adminVideoView");
		return mav;
	}
	
	@RequestMapping("/getVideoOption")
	@ResponseBody
	public HashMap<String,Object> getVideoOption(HttpServletRequest req){
		String code=req.getParameter("code");
		HashMap<String,Object> map=new HashMap<String, Object>();
		ClassDaoImp dao=sqlSession.getMapper(ClassDaoImp.class);
		List<String> ucList=dao.getUnitContent(code);
		int unitMax=dao.getUnitMax(code);
		map.put("ucList",ucList);
		map.put("unitMax",unitMax);
		return map;
	}
	
	@RequestMapping("/videoDel")
	@ResponseBody
	public int videoDel(HttpServletRequest req) {
		ClassDaoImp dao=sqlSession.getMapper(ClassDaoImp.class);
		String path=req.getSession().getServletContext().getRealPath("/upload/class_video");
		String videoCode=req.getParameter("video_code");
		String filename=req.getParameter("filename");
		File file=new File(path, filename);
		if(file.exists()) {
			file.delete();
		}
		int result=0;
		if(videoCode!=null&&!videoCode.equals("")) {
			result=dao.videoDelete(videoCode);
		}
		return result; 
	}
	@RequestMapping("/getUnit")
	@ResponseBody
	public int getUnit(HttpServletRequest req) {
		ClassDaoImp dao=sqlSession.getMapper(ClassDaoImp.class);
		String unitContent=req.getParameter("unit_content");
		int unit=dao.getUnit(unitContent);
		return unit;
	}
}