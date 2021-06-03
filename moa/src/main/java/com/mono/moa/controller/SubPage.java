package com.mono.moa.controller;

import java.util.*;

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
	
	@RequestMapping("/addEvent.moa")
	//이벤트 등록 폼 보기 요청
	public ModelAndView addEvent(ModelAndView mv) {
		mv.setViewName("subpage/addEvent");
		return mv;
	}
}


















