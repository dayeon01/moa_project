package com.mono.moa.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.mono.moa.dao.StarDao;
import com.mono.moa.util.FileUtil;
import com.mono.moa.util.PageUtil;
import com.mono.moa.vo.FileVO;
import com.mono.moa.vo.ReviewVO;

@Controller
@RequestMapping("/star")	

public class Star {
	@Autowired
	StarDao sDao;
	@Autowired
	PageUtil page;
	@Autowired
	FileUtil fUtil;
	
	@RequestMapping("/reviewList.moa")
	public ModelAndView getList(PageUtil page, ModelAndView mv, HttpSession session, RedirectView rv) {
		
		if(!isLogin(session)) {	
			rv.setUrl("/moa/");
			mv.setView(rv);
			return mv;
		}
		
		int nowPage = page.getNowPage();
		int total = sDao.getTotal();

		page.setPage(nowPage, total, 10, 5);

		List list = sDao.reviewList(page);

		mv.addObject("LIST", list);
		mv.addObject("PAGE", page);
		
		mv.setViewName("star/reviewList");
		return mv;
	}
	
	@RequestMapping("/reviewListDetail.moa")
	public ModelAndView getListDetail(int nowPage, ReviewVO rVO, 
									ModelAndView mv, HttpSession session, RedirectView rv) {
		
		if(!isLogin(session)) {	
			rv.setUrl("/moa/");
			mv.setView(rv);
			return mv;
		}
		ArrayList<ReviewVO> list = (ArrayList<ReviewVO>) sDao.replyList(rVO);
		
		for(ReviewVO l : list) {
			ArrayList<FileVO> flist = (ArrayList<FileVO>) sDao.subFileList(l.getBno());
			l.setFlist(flist);
		}
		
		rVO = sDao.reviewListDetail(rVO);
		rVO.setList(list);
	
		mv.addObject("DATA", rVO);
		mv.addObject("nowPage", nowPage);
		mv.setViewName("star/reviewListDetail");
		return mv;
	}
	
	
	@RequestMapping("/reviewWriteProc.moa")
	public ModelAndView qnaWriteProc(ReviewVO rVO, ModelAndView mv, 
									HttpSession session, RedirectView rv) {
		if(!isLogin(session)) {
			rv.setUrl("/moa/");
			mv.setView(rv);
			return mv;
		}
		
		String id = (String) session.getAttribute("SID");
		rVO.setId(id);
		int cnt = sDao.addReply(rVO);
		
		ArrayList<FileVO> list = null;
		if(cnt == 1) {
			try {
				int count = 0;
				list = fUtil.saveProc(rVO.getFile(), rVO.getBno(), "/img/upload/");

				for(FileVO vo : list) {
					count = sDao.addFile(vo);
				}
			} catch (Exception e) {}
		}

		mv.addObject("PATH", "/moa/star/reviewListDetail.moa");
		mv.addObject("BNO", rVO.getBno());
		mv.addObject("nowPage", rVO.getNowPage());
		mv.setViewName("star/redirectView");
		return mv;
	}
	
	public boolean isLogin(HttpSession session) {
		String sid = (String) session.getAttribute("SID");
		
		return (sid == null) ? false : true;
	}
	
}