package com.mono.moa.controller;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;

import com.mono.moa.dao.*;

/**
 * 	이 클래스는 댓글 게시판 관련 요청 처리 컨트롤러 클래스
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

		mv.addObject("LIST", list);
		mv.addObject("BRD", brd);
		mv.setViewName("main");
		return mv;
	}
}
