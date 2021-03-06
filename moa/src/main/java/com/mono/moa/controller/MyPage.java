package com.mono.moa.controller;

import java.util.*;

import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;
import org.springframework.web.servlet.view.*;

import com.mono.moa.dao.*;
import com.mono.moa.vo.*;

@Controller
@RequestMapping("/myPage")
public class MyPage {
	@Autowired
	MyPageDao mypDao;
	@Autowired
	MemberDao mDao;
	
	@RequestMapping("/myPage.moa")
	public ModelAndView myPayList(ModelAndView mv, HttpSession session, RedirectView rv, PayVO payVO) {
		String id = (String)session.getAttribute("SID");
		if(id == null) {
			rv.setUrl("moa/member/login.moa");
			mv.setView(rv);
			return mv;
		}
		
		List list = mypDao.getPayList(id);
		
		mv.addObject("LIST", list);
		mv.setViewName("mypage/myPage");
		return mv;
	}
	
	
	
	
}
