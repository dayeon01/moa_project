package com.mono.moa.controller;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;

import com.mono.moa.dao.*;

/**
 * 	
 * @author	한수연
 * @since	2021.06.03
 * @version	v.1.0
 * @see
 * 			작업이력 ]
 * 				2021.06.03
 * 					- 담당자 	: 한수연
 * 					- 작업내용 	: 클래스 제작
 *
 */

@Controller
public class MainMoa {
	@Autowired
	MenuPageDao mDao;
	
//	@RequestMapping("/main.moa")
	public String main() { //메인 페이지 테스트
		
		return "main";
	}
	
	@RequestMapping("/main.moa")
	public ModelAndView mainExi(ModelAndView mv) {
		List list = mDao.mainExi();
		List brd = mDao.mainNotice();
		List evt = mDao.mainEvent();
		/* List cal = mDao.getCalendar(); */

		mv.addObject("LIST", list);
		mv.addObject("BRD", brd);
		mv.addObject("EVT", evt);
		/* mv.addObject("ARR", cal); */
		mv.setViewName("main");
		return mv;
	}
}
