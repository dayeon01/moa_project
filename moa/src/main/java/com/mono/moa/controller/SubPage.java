package com.mono.moa.controller;

import java.util.*;

import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
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
	//이벤트 등록 폼 보기 요청
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
	
}


















