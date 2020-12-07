package com.bitcamp.gachi.register;


import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bitcamp.gachi.mypage.MileageDaoImp;
import com.bitcamp.gachi.mypage.UserInfoDaoImp;

import oracle.jdbc.internal.OracleConnection.TransactionState;


	@Controller
	public class RegisterController {
		SqlSession sqlSession;
		
		public SqlSession getSqlSession() {
			return sqlSession;
		}
		@Autowired
		public void setSqlSession(SqlSession sqlSession) {
			this.sqlSession = sqlSession;
		}
		@Autowired
		DataSourceTransactionManager transactionManager;
		
		@RequestMapping(value="/registerInsert",method={RequestMethod.GET, RequestMethod.POST})
		public ModelAndView registerInsert(RegisterVO vo) {
			System.out.println();
			RegisterDaoImp dao=sqlSession.getMapper(RegisterDaoImp.class);
			int result=dao.registerInsert(vo);
		
			ModelAndView mav=new ModelAndView();
			mav.addObject("result",result);
			mav.setViewName("redirect:/");
			return mav;
	}
		@RequestMapping(value="/creatorInsert",method={RequestMethod.GET, RequestMethod.POST})
		public ModelAndView creatorInsert(RegisterVO vo) {
			DefaultTransactionDefinition def=new DefaultTransactionDefinition();
			def.setPropagationBehavior(DefaultTransactionDefinition.PROPAGATION_REQUIRED);
			
			TransactionStatus status=transactionManager.getTransaction(def);
			
			RegisterDaoImp dao=sqlSession.getMapper(RegisterDaoImp.class);
			ModelAndView mav=new ModelAndView();
			int result=0;
			try {
					 dao.creatorInsert(vo); 
					 dao.creatorInsert2(vo);
							
				transactionManager.commit(status);
			}catch(Exception e) {
				transactionManager.rollback(status);
			}
			mav.addObject("result",result);
			mav.setViewName("redirect:/");
			return mav;
	}
		@RequestMapping("/useridChk")
		@ResponseBody
		public int useridChk(HttpServletRequest req,Model model) {
			RegisterDaoImp dao=sqlSession.getMapper(RegisterDaoImp.class);
			String okid=req.getParameter("okid");
			System.out.println("aaaa===>"+okid);
			int result=dao.useridChk(okid);
			return result;
		}
		@RequestMapping("/useridChk2")
		@ResponseBody
		public int useridChk2(HttpServletRequest req,Model model) {
			RegisterDaoImp dao=sqlSession.getMapper(RegisterDaoImp.class);
			String okid2=req.getParameter("okid2");
			System.out.println("aaaa===>"+okid2);
			int result=dao.useridChk2(okid2);
			return result;
		}
		@RequestMapping("/useridFChk")
		@ResponseBody
		public int useridFChk(HttpServletRequest req,Model model) {
			RegisterDaoImp dao=sqlSession.getMapper(RegisterDaoImp.class);
			String useridF=req.getParameter("useridF");
			System.out.println("aaaa===>"+useridF);
			int result=dao.useridF(useridF);
			return result;
		}
		@RequestMapping("/userpwdFChk")
		@ResponseBody
		public int userpwdFChk(HttpServletRequest req,Model model) {
			RegisterDaoImp dao=sqlSession.getMapper(RegisterDaoImp.class);
			String userpwdF=req.getParameter("userpwdF");
			System.out.println("aaaa===>"+userpwdF);
			int result=dao.userpwdF(userpwdF);
			return result;
		}
		@RequestMapping(value="/memberLogin",method=RequestMethod.POST)
		public ModelAndView login1(RegisterVO vo,HttpSession ses) {
			RegisterDaoImp dao=sqlSession.getMapper(RegisterDaoImp.class);
			MileageDaoImp mDao=sqlSession.getMapper(MileageDaoImp.class);
			UserInfoDaoImp uDao = sqlSession.getMapper(UserInfoDaoImp.class);
			RegisterVO resultVO=dao.memberLogin(vo);
			String voGrade=dao.selectList(vo);
			ModelAndView mav=new ModelAndView();
			if(resultVO==null) {
				mav.setViewName("loginFalse/loginFalse");
			}else{
					if(voGrade.equals("회원")){
						ses.setAttribute("userid", resultVO.getUserid());
						ses.setAttribute("nickname", resultVO.getNickname());
						ses.setAttribute("grade", resultVO.getGrade());
						ses.setAttribute("mileage", mDao.mileageAllSum(resultVO.getUserid()));
						ses.setAttribute("cntGood", uDao.countGood(resultVO.getUserid()));
						ses.setAttribute("cntClass", uDao.countClass(resultVO.getUserid()));
						ses.setAttribute("logStatus","Y");
						ses.setAttribute("userSort","user");
						mav.setViewName("redirect:/");
				
					}else if(voGrade.equals("크리에이터")){
						ses.setAttribute("userid", resultVO.getUserid());
						ses.setAttribute("nickname", resultVO.getNickname());
						ses.setAttribute("grade", resultVO.getGrade());
						ses.setAttribute("logStatus","Y");
						ses.setAttribute("userSort","creator");
						mav.setViewName("redirect:/");
					}else{
						ses.setAttribute("userid", resultVO.getUserid());
						ses.setAttribute("nickname", resultVO.getNickname());
						ses.setAttribute("grade", resultVO.getGrade());
						ses.setAttribute("logStatus","Y");
						ses.setAttribute("userSort","admin");
						mav.setViewName("redirect:/");
					}
				}
			return mav;
		}
		@RequestMapping("/logout")
		public String logout(HttpSession s) {
			s.invalidate();
			return "home";
		}
		@RequestMapping(value="/telChkOk",method={RequestMethod.GET, RequestMethod.POST})
		@ResponseBody
		public String sendSms(HttpServletRequest request) throws Exception {
			
			String api_key = "NCSADDFSIE3CDS6C";
			String api_secret = "CF5SAJ2PP48LUB3QXHGJJNLZ14MKANFH";

		    com.bitcamp.gachi.register.Coolsms coolsms = new com.bitcamp.gachi.register.Coolsms(api_key, api_secret);
		       
		    HashMap<String, String> set = new HashMap<String, String>();

		    set.put("to", (String)request.getParameter("to")); // 받는 사람
		    set.put("from", "01051141319"); // 발신번호
		    set.put("text", "같이가치 본인인증 \n 인증번호는 ["+(String)request.getParameter("text")+"]입니다"); // 문자내용
		    set.put("type", "sms"); // 문자 타입
		   
		    coolsms.send(set); // 보내기
		    
		    return "suc";
		}
		@RequestMapping(value="/telChkOk2",method={RequestMethod.GET, RequestMethod.POST})
		@ResponseBody
		public String sendSms2(HttpServletRequest request) throws Exception {
			
			String api_key = "NCSADDFSIE3CDS6C";
			String api_secret = "CF5SAJ2PP48LUB3QXHGJJNLZ14MKANFH";

		    com.bitcamp.gachi.register.Coolsms coolsms = new com.bitcamp.gachi.register.Coolsms(api_key, api_secret);
		       
		    HashMap<String, String> set = new HashMap<String, String>();

		    set.put("to", (String)request.getParameter("to")); // 받는 사람
		    set.put("from", "01051141319");// 발신번호
		    set.put("text", "같이가치 본인인증 \n 인증번호는 ["+(String)request.getParameter("text")+"]입니다"); // 문자내용
		    set.put("type", "sms"); // 문자 타입
		   
		    coolsms.send(set); // 보내기
		    
		    return "suc";
		}
		@RequestMapping(value="/telChkOk3",method={RequestMethod.GET, RequestMethod.POST})
		@ResponseBody
		public String sendSms3(HttpServletRequest request) throws Exception {
			
			String api_key = "NCSADDFSIE3CDS6C";
			String api_secret = "CF5SAJ2PP48LUB3QXHGJJNLZ14MKANFH";

		    com.bitcamp.gachi.register.Coolsms coolsms = new com.bitcamp.gachi.register.Coolsms(api_key, api_secret);
		       
		    HashMap<String, String> set = new HashMap<String, String>();

		    set.put("to", (String)request.getParameter("to")); // 받는 사람
		    set.put("from", "01051141319");// 발신번호
		    set.put("text", "같이가치 본인인증 \n 인증번호는 ["+(String)request.getParameter("text")+"]입니다"); // 문자내용
		    set.put("type", "sms"); // 문자 타입
		   
		    coolsms.send(set); // 보내기
		    
		    return "suc";
		}
		@RequestMapping(value="/telChkOk4",method={RequestMethod.GET, RequestMethod.POST})
		@ResponseBody
		public String sendSms4(HttpServletRequest request) throws Exception {
			
			String api_key = "NCSADDFSIE3CDS6C";
			String api_secret = "CF5SAJ2PP48LUB3QXHGJJNLZ14MKANFH";

		    com.bitcamp.gachi.register.Coolsms coolsms = new com.bitcamp.gachi.register.Coolsms(api_key, api_secret);
		       
		    HashMap<String, String> set = new HashMap<String, String>();

		    set.put("to", (String)request.getParameter("to")); // 받는 사람
		    set.put("from", "01051141319");// 발신번호
		    set.put("text", "같이가치 본인인증 \n 인증번호는 ["+(String)request.getParameter("text")+"]입니다"); // 문자내용
		    set.put("type", "sms"); // 문자 타입
		   
		    coolsms.send(set); // 보내기
		    
		    return "suc";
		}
		
}

