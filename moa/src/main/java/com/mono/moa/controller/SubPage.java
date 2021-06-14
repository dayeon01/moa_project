package com.mono.moa.controller;

import java.net.*;
import java.util.*;

import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.http.*;
import org.springframework.stereotype.*;
import org.springframework.util.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.*;
import org.springframework.web.servlet.*;
import org.springframework.web.servlet.view.*;
import com.mono.moa.dao.*;
import com.mono.moa.util.*;
import com.mono.moa.vo.*;

@Controller
@RequestMapping("/subpage")
public class SubPage {

	@Autowired
	SubPageDao sbDao;
	@Autowired
	MenuPageDao mpDao;
	@Autowired
	MemberDao mDao;
	@Autowired
	ExhibitDao eDao;
	
	
	
	//이벤트 리스트 요청 처리 전담 함수
	@RequestMapping("/eventpage.moa")
	public ModelAndView eventList(ModelAndView mv, EventVO eVO, MemberVO mVO, PageUtil page, HttpSession session, RedirectView rv) {
		String sid = (String) session.getAttribute("SID");
		
		int total = sbDao.getTotal();
		
		page.setPage(page.getNowPage(), total, 3, 3);
	
		
		List list = sbDao.getEvnList(page);
		
		mv.addObject("PAGE",page);
		mv.addObject("LIST",list);
		/*
		 * System.out.println("edate---" + eVO.getEdate());
		 * System.out.println("enddate---" + eVO.getEnddate());
		 * System.out.println("list--edate" + ((EventVO)list.get(0)).getEdate());
		 * System.out.println("list--enddate" + ((EventVO)list.get(0)).getEnddate());
		 */
		
		mVO.setId(sid);
		if(sid.equals("admin")) {
			rv.setUrl("/moa/subpage/eventpageAdmin.moa");
			mv.setView(rv);
		} else { 
			mv.setViewName("subpage/eventpage"); }
			 
		return mv;
	}
	
	@RequestMapping("/eventpageAdmin.moa")
	//이벤트 등록 폼 보기 요청
	public ModelAndView addEventAdmin(ModelAndView mv, PageUtil page, EventVO eVO, HttpSession session, RedirectView rv) {
		String sid =(String) session.getAttribute("SID");
		if(sid == null) {
			rv.setUrl("/moa/member/login.moa");
			mv.setView(rv);
			return mv;
		}
		int total = sbDao.getTotal();
		
		page.setPage(page.getNowPage(), total, 3, 3);
		
		List list = sbDao.getEvnList(page);
		
		mv.addObject("PAGE",page);
		mv.addObject("LIST",list);
		
		mv.setViewName("subpage/eventpageAdmin");
		return mv;
	}
	
	@RequestMapping("/addEvent.moa")
	//이벤트 폼 보기 요청
	public ModelAndView addEvent(ModelAndView mv, PageUtil page, EventVO eVO, RedirectView rv, HttpSession session) {
		String sid = (String) session.getAttribute("SID");
		if(sid == null) {
			rv.setUrl("/moa/member/login.moa");
			mv.setView(rv);
			return mv;
		}
		int total = mpDao.getTotal();
		page.setPage(page.getNowPage(), total, 6, 6);
		/*
		eVO.setEvtsdate(eVO.getEvtsdate().replaceAll("-", "/"));
		eVO.setEvtedate(eVO.getEvtedate().replaceAll("-", "/"));
		*/
		List list = sbDao.allExhiList(page);
		
		mv.addObject("PAGE", page);
		mv.addObject("LIST", list);
		
		System.out.println("list--" + list.get(0));
		System.out.println("list--" + list.size());
		mv.setViewName("subpage/addEvent");
		return mv;
	}
	
	@RequestMapping("/addEventProc.moa")
	//이벤트 등록 처리 함수
	public ModelAndView addEventProc(ModelAndView mv, RedirectView rv, HttpSession session, EventVO evnVO) {
		String sid = (String) session.getAttribute("SID");
		if(sid == null) {
			rv.setUrl("/moa/member/login.moa");
			mv.setView(rv);
			return mv;
		
		}
/*		
		if(evnVO.getEvtcode().equals("D")) {
			evnVO.setEvtcontent("50");
		} else {
			evnVO.setEvtcontent("1+1");
		}
*/		
		int cnt = sbDao.getAddEvent(evnVO);
		System.out.println("######## cnt : " + cnt);
		if(cnt == 1) {
			rv.setUrl("/moa/subpage/eventpageAdmin.moa");
		}else {
			rv.setUrl("/moa/subpage/addEvent.moa");
		}
		mv.setView(rv);
		return mv;
	}
	
	
	
	
	//등록된 이벤트 삭제 전담 처리 함수.
	@RequestMapping("/eventDelProc.moa")
	public ModelAndView eventDelProc(ModelAndView mv, HttpSession session, RedirectView rv, int evtexino, PageUtil page) {
		String sid =(String)session.getAttribute("SID");
		if(sid == null) {
			rv.setUrl("/moa/member/login.moa");
			mv.setView(rv);
			return mv;
		}
		int cnt = sbDao.getEvtDel(evtexino);
		System.out.println("cnt--"+cnt);
		
		if(cnt == 0) {
			rv.setUrl("/moa/subpage/addEvent.moa");
		}else {
			rv.setUrl("/moa/subpage/eventpageAdmin.moa");
			
		}
		
		mv.addObject("PAGE", page);
		mv.setView(rv);
		
		return mv;
	}
	
	
	
	
	
	
	
	// ----------------------------------------
	// 검색페이지
	@RequestMapping("/searchpage.moa")
	public ModelAndView search(ExinfoVO eVO, PageUtil page, ModelAndView mv) {

		/*
		 * // 페이징 처리 int nowPage = page.getNowPage(); if (nowPage == 0) { nowPage = 1; }
		 * 
		 * int total = mpDao.getTotal();
		 * 
		 * page.setPage(nowPage, total, 9, 3);
		 */
		

		// 검색 데이터
		List list = sbDao.selClass();
		List city = sbDao.selCity();
		
				 
		mv.addObject("LIST", list);
		mv.addObject("CITY", city);	
		
		System.out.println("######### list : " + list);
		System.out.println("######### city : " + city);
		
		
		// 결과 처리			
		List elist = null;
		
		
		if(eVO.getSelClass() != null && eVO.getSelCity() != null && eVO.getsMonth() != 0 && eVO.geteMonth() != 0) {		
			
			elist = sbDao.selResult(eVO);
			System.out.println("######### eVO : " + eVO);
			
			mv.addObject("RST", elist); 
			
			System.out.println("######### elist : " + elist);
			
			
			mv.setViewName("subpage/searchpage");
			
		} else {
			// 데이터 호출되지 않을때 dao 금지
			elist = null;		
		}

		return mv;
	}
	
	
	
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	/*	
		//kakaopay2결제
		private static final String HOST = "https://kapi.kakao.com";
		private KakaoPayReadyVO kakaoPayReadyVO;
		@RequestMapping("/kakaopay2.moa")
		public String kakapPayReady() {
			
			RestTemplate restTemplate = new RestTemplate();
			
			//서버로 요청할 header
			HttpHeaders headers = new HttpHeaders();
			headers.add("Authorization", "KakaoAK " + "e9a6099c951349f7eb36c22fb8227482");
			headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
		    headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
			
		   //서버로 요청할 body
		    MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();    
		    params.add("cid", "TC0ONETIME");
	        params.add("partner_order_id", "1001");
	        params.add("partner_user_id", "gorany");
	        params.add("item_name", "전시");
	        params.add("quantity", "1");
	        params.add("total_amount", "21000");
	        params.add("tax_free_amount", "100");
	        params.add("approval_url", "http://localhost/moa/main.moa");
	        params.add("cancel_url", "http://localhost/moa/subpage/payFail.moa");
	        params.add("fail_url", "http://localhost/moa/subpage/paypage.moa");	
				
	        HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);
	        try {
	        	kakaoPayReadyVO = restTemplate.postForObject(new URI(HOST +  "/v1/payment/ready"), body, KakaoPayReadyVO.class);
	        	
	        	return kakaoPayReadyVO.getNext_redirect_pc_url();
	        }catch (RestClientException e) {
	        	e.printStackTrace();
	        }catch(URISyntaxException e) {
	        	e.printStackTrace();
	        }
	        
	        return "/moa/subpage/papage.moa";
		
		}
		
		public KakaoPayApprovalVO kakaoPayInfo(String pg_token, KakaoPayApprovalVO kakaoPayApprovalVO) {
			RestTemplate restTemplate = new RestTemplate();
			
			//서버로 요청할 header
			HttpHeaders headers = new HttpHeaders();
			headers.add("Authorization", "KakaoAK " + "e9a6099c951349f7eb36c22fb8227482");
			headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
		    headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
		
		    //서버로 요청할 body
		    MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
	        params.add("cid", "TC0ONETIME");
	        params.add("tid", kakaoPayReadyVO.getTid());
	        params.add("partner_order_id", "1001");
	        params.add("partner_user_id", "gorany");
	        params.add("pg_token", pg_token);
	        params.add("total_amount", "2100");
	        
	        HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);
		
	        try {
	            kakaoPayApprovalVO = restTemplate.postForObject(new URI(HOST + "/v1/payment/approve"), body, KakaoPayApprovalVO.class);
	          
	            return kakaoPayApprovalVO;
	        
	        } catch (RestClientException e) {
	            e.printStackTrace();
	        } catch (URISyntaxException e) {
	            e.printStackTrace();
	        }
	        
	        return null;
		}
		
		*/

		
		/*
		// 테스트
		@RequestMapping(value="/aa.moa", method=RequestMethod.POST)
		@ResponseBody
		public HashMap<String, Object> aaa(String id) {
			System.out.println("111111");
			HashMap<String, Object> map = new HashMap<String, Object>();
			System.out.println("222222");
			
			map.put("result", "OK");
			System.out.println("33333");
			return map;
		}
		*/
		/*
		//kakaopay결제 처리 
		@RequestMapping("/kakaopay.moa")
		@ResponseBody
		public String kakaopay(ModelAndView mv, RedirectView rv, HttpSession session , MemberVO mVO, PayVO pVO, EventVO eVO ) {
		 String sid = (String)session.getAttribute("SID"); 
		 System.out.println("11");
			try {
				URL adr = new URL("http://kapi.kakao.com/v1/payment/ready HTTP/1.1");
				HttpURLConnection con =(HttpURLConnection) adr.openConnection();
				con.setRequestMethod("POST");
				con.setRequestProperty("Authorization", "KakaoAK e9a6099c951349f7eb36c22fb8227482");
				con.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
				con.setDoOutput(true);
				String param = "cid=TC0ONETIME&partner_order_id=partner_order_id&partner_user_id=partner_user_id&item_name=초코파이&quantity=1&total_amount=2200&vat_amount=200&tax_free_amount=0&approval_url=https://localhost/moa/member/myPage.moa&fail_url=https://localhost/subpage/payFail.moa/fail&cancel_url=https://localhost/subpage/paypage.moa";
				OutputStream giv = con.getOutputStream();
				DataOutputStream dgiv = new DataOutputStream(giv);
				System.out.println("dgiv=="+ dgiv);
				dgiv.writeBytes(param);
				System.out.println("param=="+ param);
				dgiv.close();
				System.out.println("dgiv=="+ dgiv);
				
				int resultcode = con.getResponseCode();
				System.out.println(resultcode);
				InputStream tak ;
				if(resultcode == 200) {
					tak = con.getInputStream();
				}else {
					tak = con.getErrorStream();
				}
				System.out.println("tak=="+tak );
				InputStreamReader reader = new InputStreamReader(tak);
				System.out.println("reader==" + reader);
				BufferedReader buff = new BufferedReader(reader);
				System.out.println("buff==" + buff);

				return buff.readLine();
				
			} catch (MalformedURLException e) {
				e.printStackTrace(); 
				Console();
			}	catch (IOException e) {
					e.printStackTrace();
				Console();
			}
			
			MemberVO memb = mDao.getMyInfo(sid);
			List exinfo = eDao.getExhList();
			
			mv.addObject(session.getAttribute("SID"));
			mv.addObject("MEMB", memb);
			mv.addObject("EXINFO", exinfo);
			
			return ("/moa/main.moa");
		}
*/
	
	
}




















