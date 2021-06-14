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
@RequestMapping("/exhibit")
public class Exhibit {
	@Autowired
	ExhibitDao exhDao;
	
	
	//전시 상세보기 페이지 요청 함수
	 @RequestMapping("/exhDetail.moa") 
	public ModelAndView exhDetail(ModelAndView mv, RedirectView rv, int exino) {
		 EventVO data = exhDao.getExhDetail(exino);
		
		
		mv.addObject("DATA", data);
		
		mv.setViewName("exhibit/exhDetail");
		
		return mv;
	}
	
	
}
