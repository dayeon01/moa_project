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
	
	
	
	//이벤트 리스트 요청 처리 전담 함수
	@RequestMapping("/eventpage.moa")
	public ModelAndView eventList(ModelAndView mv, EventVO eVO,PageUtil page) {
		int total = sbDao.getTotal();
		
		page.setPage(page.getNowPage(), total, 3, 3);
		/*
		 * System.out.println("########## " + page.getStartCont() + " ------- " +
		 * page.getEndCont());
		 */
		
		List list = sbDao.getEvnList(page);
		/*
		 * System.out.println("*********** " + ((EventVO)list.get(0)).getIdir() +
		 * ((EventVO)list.get(0)).getImgname());
		 */
		mv.addObject("PAGE",page);
		mv.addObject("LIST",list);
		System.out.println("edate---" + eVO.getEdate());
		System.out.println("enddate---" + eVO.getEnddate());
		System.out.println("list--edate" + ((EventVO)list.get(0)).getEdate());
		System.out.println("list--enddate" + ((EventVO)list.get(0)).getEnddate());
		mv.setViewName("subpage/eventpage");
		
		return mv;
	}
	
	@RequestMapping("/eventpageAdmin.moa")
	//이벤트 등록 폼 보기 요청
	public ModelAndView addEventAdmin(ModelAndView mv, PageUtil page, EventVO eVO) {
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
	public ModelAndView addEvent(ModelAndView mv, PageUtil page, EventVO eVO) {
		int total = mpDao.getTotal();
		page.setPage(page.getNowPage(), total, 6, 6);
		
		List list = sbDao.getExhiList(page);
		
		mv.addObject("PAGE", page);
		mv.addObject("LIST", list);
		System.out.println("list--" + list);
		mv.setViewName("subpage/addEvent");
		return mv;
	}
	
	@RequestMapping("/addEventProc.moa")
	//이벤트 등록 처리 함수
	public ModelAndView addEventProc(ModelAndView mv, RedirectView rv, HttpSession session, EventVO eVO) {
		String sid = (String) session.getAttribute("SID");
		if(sid == null) {
			rv.setUrl("moa/member/login.moa");
			mv.setView(rv);
			return mv;
		
		}

		int cnt = sbDao.getAddEvent(eVO);
		
		if(cnt == 1) {
			rv.setUrl("moa/subpage/eventpageAdmin.moa");
		}else {
			rv.setUrl("moa/subpage/addEvent.moa");
		}
		return mv;
	}
}


















