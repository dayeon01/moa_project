package com.mono.moa.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.mono.moa.dao.ReviewDao;
import com.mono.moa.util.PageUtil;
import com.mono.moa.vo.MemberVO;
import com.mono.moa.vo.ReviewVO;

@Controller
@RequestMapping("/review")
public class Review {

	@Autowired
	ReviewDao reDao;
	@Autowired
	PageUtil page;
	
	// 문의 리스트 보기
	@RequestMapping("/qnaList.moa")
	public ModelAndView getList(PageUtil page, ModelAndView mv, HttpSession session, RedirectView rv) {
		
		if(!isLogin(session)) {	
			rv.setUrl("/moa/");
			mv.setView(rv);
			return mv;
		}
		String id = (String) session.getAttribute("SID");
		ReviewVO rVO = new ReviewVO();
		rVO.setId(id);
		int nowPage = page.getNowPage();
		int total = reDao.getTotal(rVO);

		page.setPage(nowPage, total, 1, 3);
		page.setId(id);

		List list = reDao.qnaList(page); 
		/* rno, bno, title, body, mno, wdate, reply, redate */

		mv.addObject("LIST", list);
		mv.addObject("PAGE", page);
		
		if(id.equals("admin")) {
			mv.setViewName("review/qnaListAdmin");
		} else {
			mv.setViewName("review/qnaList");
		}	
		return mv;
	}
	
	// 문의 리스트 상세보기
	@RequestMapping("/qnaListDetail.moa")
	public ModelAndView getListDetail(int nowPage, ReviewVO rVO /* bno */ 
									, ModelAndView mv, HttpSession session, RedirectView rv) {
		
		if(!isLogin(session)) {	
			rv.setUrl("/moa/");
			mv.setView(rv);
			return mv;
		}
		
		String id = (String) session.getAttribute("SID");
		rVO = reDao.qnaListDetail(rVO);
		/* bno, title, body, mno, wdate, reply, redate */
		
		rVO.setId(reDao.getId(rVO.getBno()));
		mv.addObject("DATA", rVO);
		mv.addObject("nowPage", nowPage);
		
		if(id.equals("admin")) {
			mv.setViewName("review/qnaListDetailAdmin");
		} else {
			mv.setViewName("review/qnaListDetail");
		}	
		
		return mv;
	}
	
	// 문의글 쓰기 폼보기
	@RequestMapping("/qnaWrite.moa")
	public ModelAndView qnaWrite(ModelAndView mv, HttpSession session, RedirectView rv) {
		
		if(!isLogin(session)) {	
			rv.setUrl("/moa/");
			mv.setView(rv);
			return mv;
		}

		mv.setViewName("review/qnaWrite");
		
		return mv;
	}
	
	
	// 문의글 쓰기 처리요청
	@RequestMapping("/qnaWriteProc.moa")
	public ModelAndView qnaWriteProc(ReviewVO rVO /* title, body / admin-nowPage, bno, reply */
									,int nowPage, ModelAndView mv, HttpSession session, RedirectView rv) {
		if(!isLogin(session)) {
			rv.setUrl("/moa/");
			mv.setView(rv);
			return mv;
		}
		
		String id = (String) session.getAttribute("SID");
		rVO.setId(id);
		
		int cnt = 0;
		if(id.equals("admin")) {
			cnt = reDao.qnaWriteAdmin(rVO);
			mv.addObject("nowPage", nowPage);
		} else {
			cnt = reDao.qnaWrite(rVO);
		}
		
		String view = "/moa/review/qnaList.moa";
		
		if(cnt != 1) {
			view = "/moa/review/qnaWrite.moa";
		}
		rv.setUrl(view);
		mv.setView(rv);
		return mv;
	}
	
	// 문의글 수정 폼보기
	@RequestMapping("/qnaEdit.moa")
	public ModelAndView qnaEdit(int nowPage, ReviewVO rVO /* bno */
								, ModelAndView mv, HttpSession session, RedirectView rv) {
		
		if(!isLogin(session)) {	
			rv.setUrl("/moa/");
			mv.setView(rv);
			return mv;
		}
		rVO = reDao.qnaListDetail(rVO);
		mv.addObject("DATA", rVO);
		mv.addObject("nowPage", nowPage);
		
		mv.setViewName("review/qnaEdit");
		
		return mv;
	}
	
	// 문의글 수정처리 요청
	@RequestMapping("/qnaEditProc.moa")
	public ModelAndView qnaEditProc(int nowPage, ReviewVO rVO, ModelAndView mv, HttpSession session, RedirectView rv) {
		
		if(!isLogin(session)) {	
			rv.setUrl("/moa/");
			mv.setView(rv);
			return mv;
		}	
		
		String id = (String) session.getAttribute("SID");
		if(id.equals("admin")) {
			reDao.qnaEditAdmin(rVO);
		} else {
			reDao.qnaEdit(rVO);
		}
	
		mv.addObject("PATH", "/moa/review/qnaList.moa");
		mv.addObject("nowPage", nowPage);

		mv.setViewName("review/redirectView");
		return mv;
	}
	
	
	// 문의글 삭제요청
	@RequestMapping("/qnaDel.moa")
	public ModelAndView myInfoDelProc(int bno, ModelAndView mv, RedirectView rv, 
									HttpSession session, MemberVO mVO) {
		
		if(!isLogin(session)) {	
			rv.setUrl("/moa/");
			mv.setView(rv);
			return mv;
		}

		int cnt = reDao.qnaDel(bno);
		
		rv.setUrl("/moa/review/qnaList.moa");
		mv.setView(rv);
		return mv;
	}
	
	// 로그인 검사
	public boolean isLogin(HttpSession session) {
		String sid = (String) session.getAttribute("SID");
		
		return (sid == null) ? false : true;
	}
}
