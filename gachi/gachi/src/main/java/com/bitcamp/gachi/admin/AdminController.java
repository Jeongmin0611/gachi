package com.bitcamp.gachi.admin;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
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
			// ChartJs 전송 데이터
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

		// ChartJs 전송 데이터
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
		
		
		return mav;
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
	public ModelAndView adminMemberEditOk(AllVO vo) {

		CreatorDaoImp dao = sqlSession.getMapper(CreatorDaoImp.class);
		int result = dao.creatorMemberUpdate(vo);
		ModelAndView mav = new ModelAndView();	
		
			mav.addObject("result", result);
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
//	@RequestMapping("/creatorMemberDelete")
//	public ModelAndView creatorMemberDelete(String userid) {
//		MemberDaoImp dao = sqlSession.getMapper(MemberDaoImp.class);
//		int result = dao.adminMemberDelete(userid);
//		
//		ModelAndView mav = new ModelAndView();
//		if(result >0) {
//			mav.addObject("result", result);
//			mav.setViewName("redirect:adminCreator");
//		}else {
//			mav.setViewName("gachi/adminResult");
//		}
//		return mav;
//	}
	
	@RequestMapping("/adminClass")
	public ModelAndView adminClass(TestVO vo,HttpServletRequest req) {
		ClassDaoImp dao=sqlSession.getMapper(ClassDaoImp.class);	
		String nowPageRequest=req.getParameter("nowPage");
		if(nowPageRequest!=null) {
			vo.setNowPage(Integer.parseInt(nowPageRequest));
		}
		int totalRecord=dao.getAllRecordCount(vo);
		vo.setTotalRecord(totalRecord);
		List<ClassVO> list=dao.getClassListLookUp(vo); 
		
		ModelAndView mav =new ModelAndView();
		mav.addObject("list",list);
		mav.addObject("pvo",vo);
		mav.setViewName("admin/adminClass");
		return mav;
	}
	@RequestMapping("/adminClass2")
	public ModelAndView adminClass2(TestVO vo,HttpServletRequest req){
		System.out.println(vo.getOption());
		System.out.println(vo.getSearchWord());
		ClassDaoImp dao=sqlSession.getMapper(ClassDaoImp.class);	
		
		System.out.println("date1===> "+vo.getDate1()+"date2===> "+vo.getDate2());
		String nowPageRequest=req.getParameter("nowPage");
		if(nowPageRequest!=null) {
			vo.setNowPage(Integer.parseInt(nowPageRequest));
		}
		int totalRecord=dao.getAllRecordCount(vo);
		vo.setTotalRecord(totalRecord);
		List<ClassVO> list=dao.getClassListSearch(vo);
		
		ModelAndView mav =new ModelAndView();
		mav.addObject("list",list);
		mav.addObject("pvo",vo);
		mav.setViewName("admin/adminClass");
		return mav;
	}
	@RequestMapping("/adminClassView")
	public ModelAndView adminClassView(@RequestParam("code") String code) {
		ClassDaoImp dao=sqlSession.getMapper(ClassDaoImp.class);
		ClassVO vo=dao.selectClass(code);
		StringTokenizer st=new StringTokenizer(vo.getClass_img(),",");
		List<String> list=new ArrayList<String>();
		while(st.hasMoreTokens()) {
			list.add(st.nextToken());
		}
		vo.setImgList(list);
		
		List<ClassVideoVO> sectionList=dao.selectSection(code);
		List<ClassVideoVO> vList=dao.getClassVideoListSample(code);
		ModelAndView mav=new ModelAndView();
		mav.addObject("vo",vo);
		mav.addObject("sectionList",sectionList);
		mav.addObject("vList",vList);
		mav.setViewName("admin/adminClassView");
		return mav;
	}
	@RequestMapping("/adminClassEdit")
	public ModelAndView adminClassEdit(@RequestParam("code") String code) {
		ClassDaoImp dao=sqlSession.getMapper(ClassDaoImp.class);
		ClassVO vo=dao.selectClass(code);
		StringTokenizer st=new StringTokenizer(vo.getClass_img(),",");
		List<String> list=new ArrayList<String>();
		while(st.hasMoreTokens()) {
			list.add(st.nextToken());
		}
		vo.setImgList(list);
		
		List<ClassVideoVO> sectionList=dao.selectSection(code);
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("vo",vo);
		mav.addObject("sectionList",sectionList);
		mav.setViewName("admin/adminClassEdit");
		return mav;
	}

	@RequestMapping(value="/adminClassEditOk",method = RequestMethod.POST)
	public ModelAndView adminClassEditOk(ClassVO vo,HttpSession session) {
		ClassDaoImp dao=sqlSession.getMapper(ClassDaoImp.class);
		String path=session.getServletContext().getRealPath("/upload/classImg");
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
		OutputStream ops=null;
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
					String classImg=dao.selectClassImg(code);
					classImg=classImg+newFile.getName()+",";
					dao.updateClassImg(classImg, code);
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
		String code=req.getParameter("code");
		File file=new File(path,imageName);
		if(file.exists()) {
			file.delete();
			String classImg=dao.selectClassImg(code);
			StringTokenizer st=new StringTokenizer(classImg,",");
			String txt="";
			while (st.hasMoreTokens()) {
				String img=st.nextToken();
				if(img.equals(imageName)) {
					continue;
				}
				txt+=img+",";
			}
			dao.updateClassImg(txt, code);
		}
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
	
	@RequestMapping(value="/imgDelete",method=RequestMethod.POST,produces="application/text;charset=UTF-8" )
	@ResponseBody
	public void imgDelete() {
		
	}
	
	
	@RequestMapping("/adminClassDel")
	public ModelAndView adminClassDel(@RequestParam("code") String code) {
		ClassDaoImp dao=sqlSession.getMapper(ClassDaoImp.class);
		ClassVO vo=dao.selectClass(code);
		ModelAndView mav=new ModelAndView();
		mav.addObject("vo",vo);
		mav.setViewName("admin/adminClassEdit");
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
	
	
	
//	}
//	@RequestMapping("/adminNotice")
//	public ModelAndView adminNotice(NoticePageVO npvo,HttpServletRequest req) {
//		NoticeDaoImp dao=sqlSession.getMapper(NoticeDaoImp.class);
//		String nowPageRequest=req.getParameter("nowPage");
//		if(nowPageRequest!=null) {
//			npvo.setNowPage(Integer.parseInt(nowPageRequest));
//		}
//		int totalRecord=dao.getAllRecord(npvo);
//		npvo.setTotalRecord(totalRecord);
//		
//		List<NoticeVO> list=dao.selectList(npvo);
//		ModelAndView mav=new ModelAndView();
//		mav.addObject("list",list);
//		mav.addObject("npvo",npvo);
//		mav.setViewName("admin/adminNotice");
//		return mav;
//	}
//	
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
		
		List<MemberVO> list = dao.selectAllMember(dbParam); // 전체 회원 리스트
		
		int countAllMember = dao.countAllMember(); // 전체 회원 명 수 (현재 회원 + 탈퇴 회원)
		int countNowMember = dao.countNowMember(); // 현재 회원 명 수
		int countDeletedMember = dao.countDeletedMember(); // 탈퇴 회원 명 수
		
		PagingVO pageVO = new PagingVO();
		
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
		
		List<MemberVO> list = dao.selectAllMember(dbParam); // 전체 회원 리스트
		int countAllMember = dao.countAllMember(); // 전체 회원 명 수 (현재 회원 + 탈퇴 회원)
		int countNowMember = dao.countNowMember(); // 현재 회원 명 수
		int countDeletedMember = dao.countDeletedMember(); // 탈퇴 회원 명 수
		
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
	@RequestMapping("adminNoticeEdit")
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
	@RequestMapping("adminNoticeEditOk")
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
			mav.addObject("msg","공지사항 수정에 실패하였습니다. 뒤로 돌아갑니다.");
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
			mav.addObject("msg","공지사항 삭제를 실패하였습니다. 뒤로 돌아갑니다.");
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
			String msg="공지사항 등록을 실패하였습니다. 공지사항 쓰기로 돌아갑니다.";
			mav.addObject("msg", msg);
			mav.setViewName("admin/adminNoticeResult");
		}
		return mav;
	}
	@RequestMapping("/adminEvent")
	public String adminEvent() {
		return "admin/adminEvent";
	}
	@RequestMapping("/adminEventView")
	public String adminEventView() {
		return "admin/adminEventView";
	}
	@RequestMapping("/adminEventWrite")
	public String adminEventWrite() {
		return "admin/adminEventWrite";
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

	@RequestMapping("/adminOrder")
	public ModelAndView adminOrder() {
		ModelAndView mav =new ModelAndView();
		
		SimpleDateFormat  yyyymmdd = new SimpleDateFormat("yyyy-MM-dd");
		String todate =  yyyymmdd.format(new Date());
		String startDate = todate.substring(0, 8) + "01";
		String endDate = todate;
		
		Map<String, String> dbParam = new HashMap<String, String>();
		dbParam.put("startDate", startDate);
		dbParam.put("endDate", endDate);
		
		OrderDaoImp dao = sqlSession.getMapper(OrderDaoImp.class);
		dao = sqlSession.getMapper(OrderDaoImp.class);
		List<OrderVO> result = dao.selectAllOrder(dbParam);
		
		
		mav.addObject("startDate", startDate);
		mav.addObject("endDate", endDate);

		mav.addObject("data", result);
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
	public String adminDelivery() {
		return "admin/adminDelivery";
	}
	@RequestMapping("/adminGoods")
	public ModelAndView adminGoods() {
		ModelAndView mav =new ModelAndView();
		
		SimpleDateFormat  yyyymmdd = new SimpleDateFormat("yyyy-MM-dd");
		String todate =  yyyymmdd.format(new Date());
		String startDate = todate.substring(0, 8) + "01";
		String endDate = todate;
		
		Map<String, String> dbParam = new HashMap<String, String>();
		dbParam.put("startDate", startDate);
		dbParam.put("endDate", endDate);
		
		GoodsDaoImp dao = sqlSession.getMapper(GoodsDaoImp.class);
		List<GoodsVO> result = dao.selectAllGoods(dbParam);
		dao = sqlSession.getMapper(GoodsDaoImp.class);
		
		mav.addObject("startDate", startDate);
		mav.addObject("endDate", endDate);

		mav.addObject("data", result);
		mav.setViewName("admin/adminGoods");
	
		return mav;
	}
	
	@RequestMapping(value="/adminGoods", method=RequestMethod.POST)
	@ResponseBody
	public ModelAndView adminGoods(HttpServletRequest req, HttpServletResponse resp, @RequestParam(value="startDate", required=false) String startDate, @RequestParam(value="endDate", required=false) String endDate) {
		ModelAndView mav = new ModelAndView();

		if(startDate==null || endDate == null) {
			System.out.println("startMonth is null");
			
			SimpleDateFormat  yyyymmdd = new SimpleDateFormat("yyyy-MM-dd");
			String todate =  yyyymmdd.format(new Date());
			
			startDate = todate.substring(0, 8) + "01";
			endDate = todate;
		} 

		// sql 검색 값 셋팅
		Map<String, String> dbParam = new HashMap<String, String>();
		dbParam.put("startDate", startDate);
		dbParam.put("endDate", endDate);

		GoodsDaoImp dao = sqlSession.getMapper(GoodsDaoImp.class);
		List<GoodsVO> result = dao.selectAllGoods(dbParam);
		dao = sqlSession.getMapper(GoodsDaoImp.class);
		
		if(startDate != null && endDate != null) {
			
			mav.addObject("startDate", startDate);
			mav.addObject("endDate", endDate);

			mav.addObject("data", result);
			mav.setViewName("admin/adminGoods");

			System.out.println("ajax success");
			try {
				//resp.getWriter().write("{\"result\":\"success\"}");
				mav.setViewName("admin/adminGoods");
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
	@RequestMapping("/adminGoodsView")
	public String adminGoodsView() {
		return "admin/adminGoodsView";
	}
	@RequestMapping("/adminGoodsEdit")
	public String adminGoodsEdit() {
		return "admin/adminGoodsEdit";
	}
	@RequestMapping("/adminGoodsWrite")
	public String adminGoodsEnroll() {
		return "admin/adminGoodsWrite";
	}
	
//	@RequestMapping(value="/adminStatStore")
//	public String adminStatStore() {
//	
//		return "admin/adminStatStore";
//	}
	
	@RequestMapping("/adminStatStore")
	public ModelAndView adminStatStore(@RequestParam(value="startMonth", required=false) String startMonth, @RequestParam(value="endMonth", required=false) String endMonth) {
		ModelAndView mav = new ModelAndView();
		
		SimpleDateFormat  yyyymmdd = new SimpleDateFormat("yyyy-MM-dd");
		String todate =  yyyymmdd.format(new Date());
		String startDate = todate.substring(0, 8) + "01";
		String endDate = todate;
	
		// sql 검색 값 셋팅
		Map<String, String> dbParam = new HashMap<String, String>();
		dbParam.put("startDate", startDate);
		dbParam.put("endDate", endDate);

		SettleDaoImp dao = sqlSession.getMapper(SettleDaoImp.class);
		List<SettleVO> result = dao.manageSettle(dbParam);
		dao = sqlSession.getMapper(SettleDaoImp.class);
		Integer countStoreAll = dao.cntStoreAll(dbParam);
		Integer countStoreN = dao.cntStoreN(dbParam);
		Integer countStoreY = dao.cntStoreY(dbParam);
		
		if(countStoreAll == null) countStoreAll = 0;
		if(countStoreN == null) countStoreN = 0;
		if(countStoreY == null) countStoreY = 0;
		if(countStoreN == null) countStoreN =0;
		
		System.out.println(countStoreAll);
		System.out.println(countStoreN);
		System.out.println(countStoreY);
		
		
		mav.addObject("startDate", startDate);
		mav.addObject("endDate", endDate);

		mav.addObject("data", result);
		mav.addObject("countStoreAll", countStoreAll);
		mav.addObject("countStoreN", countStoreN);
		mav.addObject("countStoreY", countStoreY);
		mav.setViewName("admin/adminStatStore");
		
		return mav;
	}
	@RequestMapping(value="/adminStatStore", method=RequestMethod.POST)
	@ResponseBody
	public ModelAndView adminStatStore(HttpServletRequest req, HttpServletResponse resp, @RequestParam(value="startDate", required=false) String startDate, @RequestParam(value="endDate", required=false) String endDate) {
		ModelAndView mav = new ModelAndView();

		if(startDate==null || endDate == null) {
			System.out.println("startMonth is null");
			
			SimpleDateFormat  yyyymmdd = new SimpleDateFormat("yyyy-MM-dd");
			String todate =  yyyymmdd.format(new Date());
			
			startDate = todate.substring(0, 8) + "01";
			endDate = todate;
		} 

		// sql 검색 값 셋팅
		Map<String, String> dbParam = new HashMap<String, String>();
		dbParam.put("startDate", startDate);
		dbParam.put("endDate", endDate);

		SettleDaoImp dao = sqlSession.getMapper(SettleDaoImp.class);
		List<SettleVO> result = dao.manageSettle(dbParam);
		dao = sqlSession.getMapper(SettleDaoImp.class);
		Integer countStoreAll = dao.cntStoreAll(dbParam);
		Integer countStoreN = dao.cntStoreN(dbParam);
		Integer countStoreY = dao.cntStoreY(dbParam);
		
		if(countStoreAll == null) countStoreAll = 0;
		if(countStoreN == null) countStoreN = 0;
		if(countStoreY == null) countStoreY = 0;
		if(countStoreN == null) countStoreN = 0;
				

		
		if(startDate != null && endDate != null) {
			
			mav.addObject("startDate", startDate);
			mav.addObject("endDate", endDate);

			mav.addObject("data", result);
			mav.addObject("countStoreAll", countStoreAll);
			mav.addObject("countStoreN", countStoreN);
			mav.addObject("countStoreY", countStoreY);
			mav.setViewName("admin/adminStatStore");

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
		
		SimpleDateFormat  yyyymmdd = new SimpleDateFormat("yyyy-MM-dd");
		String todate =  yyyymmdd.format(new Date());
		String startDate = todate.substring(0, 8) + "01";
		String endDate = todate;
	
		// sql 검색 값 셋팅
		Map<String, String> dbParam = new HashMap<String, String>();
		dbParam.put("startDate", startDate);
		dbParam.put("endDate", endDate);
		dbParam.put("category", null);
		dbParam.put("username", null);
		SettleDaoImp dao = sqlSession.getMapper(SettleDaoImp.class);
		List<SettleVO> result = dao.manageSettle(dbParam);
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
		
		
		mav.addObject("startDate", startDate);
		mav.addObject("endDate", endDate);
		mav.addObject("category", null);
		mav.addObject("username", null);
		mav.addObject("data", result);
		mav.addObject("countStatClassAll", countStatClassAll);
		mav.addObject("countClassN", countClassN);
		mav.addObject("countClassY", countClassY);
		mav.setViewName("admin/adminStatClass");
		
		return mav;
	}
	
	@RequestMapping(value="/adminStatClass", method=RequestMethod.POST)
	@ResponseBody
	public ModelAndView adminStatClass(HttpServletRequest req, HttpServletResponse resp, @RequestParam(value="startDate", required=false) String startDate, @RequestParam(value="endDate", required=false) String endDate,  @RequestParam(value="category", required=false) String category, @RequestParam(value="username", required=false) String username) {
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
		// sql 검색 값 셋팅
		Map<String, String> dbParam = new HashMap<String, String>();
		dbParam.put("startDate", startDate);
		dbParam.put("endDate", endDate);
		dbParam.put("category", category);
		dbParam.put("username", username);
		SettleDaoImp dao = sqlSession.getMapper(SettleDaoImp.class);
		List<SettleVO> result = dao.manageSettle(dbParam);
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
				
		
		if(startDate != null && endDate != null) {
			
			mav.addObject("startDate", startDate);
			mav.addObject("endDate", endDate);
			mav.addObject("category", category);
			mav.addObject("username", username);
			mav.addObject("data", result);
			mav.addObject("countStatClassAll", countStatClassAll);
			mav.addObject("countClassN", countClassN);
			mav.addObject("countClassY", countClassY);
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

			// ChartJs 전송 데이터
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

		// ChartJs 전송 데이터
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
	public ModelAndView adminSettle() {
		ModelAndView mav = new ModelAndView();
		
		SimpleDateFormat  yyyymmdd = new SimpleDateFormat("yyyy-MM-dd");
		String todate =  yyyymmdd.format(new Date());
		String startDate = todate.substring(0, 8) + "01";
		String endDate = todate;
	
		// sql 검색 값 셋팅
		Map<String, String> dbParam = new HashMap<String, String>();
		dbParam.put("startDate", startDate);
		dbParam.put("endDate", endDate);
		dbParam.put("category", null);
		dbParam.put("username", null);
		SettleDaoImp dao = sqlSession.getMapper(SettleDaoImp.class);
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
	public ModelAndView adminSettle(HttpServletRequest req, HttpServletResponse resp, @RequestParam(value="startDate", required=false) String startDate, @RequestParam(value="endDate", required=false) String endDate,  @RequestParam(value="category", required=false) String category, @RequestParam(value="username", required=false) String username) {
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
		// sql 검색 값 셋팅
		Map<String, String> dbParam = new HashMap<String, String>();
		dbParam.put("startDate", startDate);
		dbParam.put("endDate", endDate);
		dbParam.put("category", category);
		dbParam.put("username", username);
		SettleDaoImp dao = sqlSession.getMapper(SettleDaoImp.class);
		List<SettleVO> result = dao.manageSettle(dbParam);
		dao = sqlSession.getMapper(SettleDaoImp.class);
		Integer cntAllSales = dao.countAllSales(dbParam);
		Integer cntSalesN = dao.countSalesN(dbParam);
		Integer cntSalesY = dao.countSalesY(dbParam);
		
		
		if(cntAllSales == null) cntAllSales = 0;
		if(cntSalesN == null) cntSalesN = 0;
		if(cntSalesY == null) cntSalesY = 0;
		
				
		
		if(startDate != null && endDate != null) {
			
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
	
	@RequestMapping("/adminPaymentStore")
	public ModelAndView adminPaymentStore() {
		
		ModelAndView mav = new ModelAndView();
		
		SimpleDateFormat  yyyymmdd = new SimpleDateFormat("yyyy-MM-dd");
		String todate =  yyyymmdd.format(new Date());
		String startDate = todate.substring(0, 8) + "01";
		String endDate = todate;
	
		// sql 검색 값 셋팅
		Map<String, String> dbParam = new HashMap<String, String>();
		dbParam.put("startDate", startDate);
		dbParam.put("endDate", endDate);
		dbParam.put("category", null);
		dbParam.put("username", null);
		SettleDaoImp dao = sqlSession.getMapper(SettleDaoImp.class);
		List<SettleVO> result = dao.managePaymentStore(dbParam);
		dao = sqlSession.getMapper(SettleDaoImp.class);
		Integer cntAllPayment = dao.paymentStoreAll(dbParam);
		Integer cntPaymentN = dao.paymentStoreN(dbParam);
		Integer cntPaymentY = dao.paymentStoreY(dbParam);
		
		if(cntAllPayment == null) cntAllPayment = 0;
		if(cntPaymentN == null) cntPaymentN = 0;
		if(cntPaymentY == null) cntPaymentY = 0;
		
		System.out.println(cntAllPayment);
		System.out.println(cntPaymentN);
		System.out.println(cntPaymentY);
		
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
	public ModelAndView adminPaymentStore(HttpServletRequest req, HttpServletResponse resp, @RequestParam(value="startDate", required=false) String startDate, @RequestParam(value="endDate", required=false) String endDate,  @RequestParam(value="category", required=false) String category, @RequestParam(value="username", required=false) String username) {
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
		// sql 검색 값 셋팅
		Map<String, String> dbParam = new HashMap<String, String>();
		dbParam.put("startDate", startDate);
		dbParam.put("endDate", endDate);
		dbParam.put("category", category);
		dbParam.put("username", username);
		SettleDaoImp dao = sqlSession.getMapper(SettleDaoImp.class);
		List<SettleVO> result = dao.managePaymentStore(dbParam);
		System.out.println("result="+result);
		dao = sqlSession.getMapper(SettleDaoImp.class);
		Integer cntAllPayment = dao.paymentStoreAll(dbParam);
		Integer cntPaymentN = dao.paymentStoreN(dbParam);
		Integer cntPaymentY = dao.paymentStoreY(dbParam);
		
		if(cntAllPayment == null) cntAllPayment = 0;
		if(cntPaymentN == null) cntPaymentN = 0;
		if(cntPaymentY == null) cntPaymentY = 0;
		
		
		if(startDate != null && endDate != null) {
			
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
	public ModelAndView adminPaymentClass() {
		
		ModelAndView mav = new ModelAndView();
		
		SimpleDateFormat  yyyymmdd = new SimpleDateFormat("yyyy-MM-dd");
		String todate =  yyyymmdd.format(new Date());
		String startDate = todate.substring(0, 8) + "01";
		String endDate = todate;
	
		// sql 검색 값 셋팅
		Map<String, String> dbParam = new HashMap<String, String>();
		dbParam.put("startDate", startDate);
		dbParam.put("endDate", endDate);
		dbParam.put("category", null);
		dbParam.put("username", null);
		SettleDaoImp dao = sqlSession.getMapper(SettleDaoImp.class);
		List<SettleVO> result = dao.managePaymentClass(dbParam);
		dao = sqlSession.getMapper(SettleDaoImp.class);
		Integer cntAllPaymentClass = dao.paymentClassAll(dbParam);
		Integer cntPaymentClassY = dao.paymentClassY(dbParam);
		
		if(cntAllPaymentClass == null) cntAllPaymentClass = 0;
		if(cntPaymentClassY == null) cntPaymentClassY = 0;
		
		System.out.println(cntAllPaymentClass);
		System.out.println(cntPaymentClassY);
		
		mav.addObject("startDate", startDate);
		mav.addObject("endDate", endDate);
		mav.addObject("category", null);
		mav.addObject("username", null);
		mav.addObject("data", result);
		mav.addObject("cntAllPaymentClass", cntAllPaymentClass);
		mav.addObject("cntPaymentClassY", cntPaymentClassY);
		mav.setViewName("admin/adminPaymentClass");
		
		return mav;

	}
	@RequestMapping(value="/adminPaymentClass", method=RequestMethod.POST)
	@ResponseBody
	public ModelAndView adminPaymentClass(HttpServletRequest req, HttpServletResponse resp, @RequestParam(value="startDate", required=false) String startDate, @RequestParam(value="endDate", required=false) String endDate,  @RequestParam(value="category", required=false) String category, @RequestParam(value="username", required=false) String username) {
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
		// sql 검색 값 셋팅
		Map<String, String> dbParam = new HashMap<String, String>();
		dbParam.put("startDate", startDate);
		dbParam.put("endDate", endDate);
		dbParam.put("category", category);
		dbParam.put("username", username);
		SettleDaoImp dao = sqlSession.getMapper(SettleDaoImp.class);
		List<SettleVO> result = dao.managePaymentClass(dbParam);
		dao = sqlSession.getMapper(SettleDaoImp.class);
		Integer cntAllPaymentClass = dao.paymentClassAll(dbParam);
		Integer cntPaymentClassY = dao.paymentClassY(dbParam);
		
		if(cntAllPaymentClass == null) cntAllPaymentClass = 0;
		if(cntPaymentClassY == null) cntPaymentClassY = 0;
		
		
		if(startDate != null && endDate != null) {
			
			mav.addObject("startDate", startDate);
			mav.addObject("endDate", endDate);
			mav.addObject("category", category);
			mav.addObject("username", username);
			mav.addObject("data", result);
			mav.addObject("cntAllPaymentClass", cntAllPaymentClass);
			mav.addObject("cntPaymentClassY", cntPaymentClassY);
			

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
	@RequestMapping("/adminVideo")
	public String adminVideo() {
		return "admin/adminVideo";
	}
	
	@RequestMapping(value="/videoUpload",method = RequestMethod.POST)
	@ResponseBody
	public HashMap<String,Object> videoUpload(HttpSession session, MultipartHttpServletRequest mhsr,
			@RequestParam("code") String code){
		String path=session.getServletContext().getRealPath("/upload/class_video");
		MultipartFile file=mhsr.getFile("file");
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
					filePath="/gachi/upload/class/class_video/"+newFile.getName();
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
		return map;
	}
	@RequestMapping("/adminVideoWrite")
	public String adminVideoWrite() {
		return "admin/adminVideoWrite";
	}
	@RequestMapping(value="/adminVideoWriteOk",method=RequestMethod.POST)
	public ModelAndView adminVideoWriteOk(ClassVideoVO vo) {
		ClassDaoImp dao=sqlSession.getMapper(ClassDaoImp.class);
		ClassvideoSort cvs=new ClassvideoSort();
		List<ClassVideoVO> list=vo.getList();
		Collections.sort(list,cvs);
		for (int i = 0; i < list.size(); i++) {
			ClassVideoVO vo1=list.get(i);
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd"); 
			String dateStr = null;
			try {
				Date date = sdf.parse(vo1.getEnroll_date());
				dateStr = sdf.format(date);
			} catch (java.text.ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			int result=dao.videoInsert(vo1);
			if(result<=0){
				
				break;
			}
		}
		ModelAndView mav=new ModelAndView();
		mav.setViewName("admin/adminVideo");
		return mav;	
	}
	@RequestMapping("/adminReply")	
	public String adminReply() {
		return "admin/adminReply";
	}
	@RequestMapping("/adminClassReview")
	public String adminClassReview() {
		return "admin/adminClassReview";
	}
	@RequestMapping("/adminAnswer")
	public String adminAnswer() {
		return "admin/adminAnswer";
	}
	
	@RequestMapping("/adminGetClassList")
	@ResponseBody
	public List<ClassVO> adminGetClassList(HttpServletRequest req){
		ClassDaoImp dao=sqlSession.getMapper(ClassDaoImp.class);
		String category=req.getParameter("value");
		List<ClassVO> list=dao.getClassAllList(category);
		return list;
	}
	@RequestMapping("/adminGetSection")
	@ResponseBody
	public List<ClassVideoVO> adminGetSection(HttpServletRequest req){
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
	
}