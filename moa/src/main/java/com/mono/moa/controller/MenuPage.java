package com.mono.moa.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.mono.moa.dao.MenuPageDao;
import com.mono.moa.util.PageUtil;

/**
 * 	이 클래스는 댓글 게시판 관련 요청 처리 컨트롤러 클래스
 * @author	한수연
 * @since	2021.06.01
 * @version	v.1.0
 * @see
 * 			작업이력 ]
 * 				2021.06.01 
 * 					- 담당자 	: 한수연
 * 					- 작업내용 	: 클래스 제작
 *
 */

@Controller
@RequestMapping("/menupage")	

public class MenuPage {
	@Autowired
	MenuPageDao mDao;

	// 전시목록 보기 요쳥 처리함수
	@RequestMapping("/menu1.moa")
	public ModelAndView oPageList(PageUtil page, ModelAndView mv) {
		int nowPage = page.getNowPage();
		if(nowPage == 0) {
			nowPage = 1;
		}
		
		int total = mDao.getTotal();
		
 		// PageUtil 셋팅
		page.setPage(nowPage, total, 9, 3);
		
		// 리스트 조회
		List list = mDao.getExiList(page);
		
		// 데이터 전달하고
		mv.addObject("LIST", list);
		mv.addObject("PAGE", page);
		
		// 뷰 부르고
		mv.setViewName("menupage/menu1");
		
		return mv;
	}
	
	@RequestMapping("/menu2.moa")
	public ModelAndView aPageList(PageUtil page, ModelAndView mv) {
		int nowPage = page.getNowPage();
		if(nowPage == 0) {
			nowPage = 1;
		}
		
		int total = mDao.getTotal();
		
		// PageUtil 셋팅
		page.setPage(nowPage, total, 9, 3);
		
		// 리스트 조회
		List list = mDao.getArtList(page);
		
		// 데이터 전달하고
		mv.addObject("LIST", list);
		mv.addObject("PAGE", page);
		
		// 뷰 부르고
		mv.setViewName("menupage/menu2");
		
		return mv;
	}
	
	@RequestMapping("/menu3.moa")
	public ModelAndView tPageList(PageUtil page, ModelAndView mv) {
		int nowPage = page.getNowPage();
		if(nowPage == 0) {
			nowPage = 1;
		}
		
		int total = mDao.getTotal();
		
		// PageUtil 셋팅
		page.setPage(nowPage, total, 9, 1);
		
		// 리스트 조회
		List list = mDao.getThemeList(page);
		
		// 데이터 전달하고
		mv.addObject("LIST", list);
		mv.addObject("PAGE", page);
		
		// 뷰 부르고
		mv.setViewName("menupage/menu3");
		
		return mv;
	}
}
