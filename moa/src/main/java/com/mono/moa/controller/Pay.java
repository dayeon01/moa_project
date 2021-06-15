package com.mono.moa.controller;

import java.util.*;

import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;
import org.springframework.web.servlet.view.*;

import com.fasterxml.jackson.databind.*;
import com.mono.moa.dao.*;
import com.mono.moa.vo.*;

@Controller
@RequestMapping("/pay")

public class Pay {
	public static final String IMPORT_TOKEN_URL = "https://api.iamport.kr/users/getToken"; 
	public static final String IMPORT_PAYMENTINFO_URL = "https://api.iamport.kr/payments/find/"; 
	public static final String IMPORT_CANCEL_URL = "https://api.iamport.kr/payments/cancel"; 
	public static final String IMPORT_PREPARE_URL = "https://api.iamport.kr/payments/prepare";

	public static final String KEY = "0212558148262524";
	public static final String SECRET = "phaaeLmg2wyD5oLxgZdvyuUgEhhU1fIqxSAMDX3GtBjz057g4lLCQGTuXboZq7pYZ0KDYNjspD2pI9FN";
	
@Autowired
ExhibitDao eDao;
@Autowired
MemberDao mDao;
@Autowired
SubPageDao sbDao;
@Autowired
PayDao pDao;
	

	//결제페이지----------------------------------------------
		//결제페이지 폼보기
		@RequestMapping("/paypage.moa")
		public ModelAndView payPage(ModelAndView mv, HttpSession session, RedirectView rv, EventVO eVO, PayVO payVO) {
			//System.out.println("######## eVO.exino : " + eVO.getExino()); 
			String sid = (String)session.getAttribute("SID");
			if(sid ==null) {
				rv.setUrl("/moa/member/login.moa");
				mv.setView(rv);
				return mv;
			}
			EventVO data = eDao.getExhDetail(eVO.getExino());
			MemberVO memb = mDao.getMyInfo(sid);
			
			mv.addObject("MEMB", memb);
			mv.addObject("DATA", data);
			mv.setViewName("/pay/paypage");
			return mv;
		}


		//결제 성공 데이터 받기
		@RequestMapping("/paySuccess.moa")
		public ModelAndView addPay(PayVO payVO, ModelAndView mv, HttpSession session, RedirectView rv) {
			String sid = (String)session.getAttribute("SID");
			System.out.println("#### payVO : " + payVO);
			
			int addp = pDao.addpayinfo(payVO);
			
			if(addp == 1) {
				rv.setUrl("/moa/member/myPage.moa");
				mv.setView(rv);
			}else {
				rv.setUrl("/moa/pay/payFail.moa");
			}
			
			return mv;
			
			
		}
			
		//결제취소 폼보기
			@RequestMapping("/payFail.moa")
			public ModelAndView payFail(ModelAndView mv, HttpSession session, RedirectView rv, EventVO eVO) {
				String sid = (String)session.getAttribute("SID");
				
				mv.setViewName("pay/payFail");
				return mv;
			}
			
		
}
