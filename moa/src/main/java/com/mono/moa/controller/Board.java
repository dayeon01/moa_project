package com.mono.moa.controller;

import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;

import com.mono.moa.dao.*;
import com.mono.moa.util.*;
import com.mono.moa.vo.*;

@Controller
@RequestMapping("/board")
public class Board {
@Autowired
BoardDao bDao;

/*
 * //게시글 리스트 보기 요청 처리함수
 * 
 * @RequestMapping("/allboardlist.moa") public ModelAndView
 * nboardList(ModelAndView mv, PageUtil page) { int total = bDao.getTotal();
 * 
 * page.setPage(page.getNowPage(), total, 3, 3);
 * 
 * List list = bDao.nboardList(page); for(Object o : list) { BoardVO bVO =
 * (BoardVO) o; }
 * 
 * mv.addObject("PAGE", page); mv.addObject("LIST", list);
 * 
 * mv.setViewName("board/allboardlist");
 * 
 * return mv; }
 */
	
}






















