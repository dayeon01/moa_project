package com.mono.moa.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.mono.moa.dao.SurveyDao;
import com.mono.moa.vo.SurveyVO;

@Controller
@RequestMapping("/survey")
public class Survey {
	@Autowired
	SurveyDao svDao;
	
	// 전시정보 지도
	@RequestMapping("/surveyMap.moa")
	@ResponseBody
	public ModelAndView surveyMap(ModelAndView mv) {
		List list = svDao.getMapList();
		
		Gson gson = new GsonBuilder().create();
		String ListJson = gson.toJson(list);
		mv.addObject("LIST", ListJson);
		mv.addObject("LIST_A", list);
		mv.addObject("LEN", list.size());
		mv.setViewName("survey/surveyMap");
		System.out.println(ListJson);
		return mv;
	}

	// 설문리스트 조회
	@RequestMapping("/surveyList.moa")
	public ModelAndView surveyList(ModelAndView mv) {
		List list = svDao.getList();
		mv.addObject("LIST", list);
		mv.setViewName("survey/surveyList");
		return mv;
	}
	
	// 설문조사 상세 페이지
	@RequestMapping("/survey.moa")  //sino, title
	public ModelAndView surveyDetail(SurveyVO svVO, ModelAndView mv, HttpSession session, RedirectView rv) {
		
		String id = (String) session.getAttribute("SID");
		svVO.setId(id);
		int cnt = svDao.answerCnt(svVO);
		if(cnt == 1) {
			mv.addObject("PATH", "/moa/survey/surveyResult.moa");
			mv.addObject("TITLE", svVO.getTitle());
			mv.addObject("SINO", svVO.getSino());
			mv.setViewName("survey/redirectPage");
			return mv;
		}
		ArrayList<SurveyVO> list = (ArrayList<SurveyVO>) svDao.questList(svVO.getSino());		
		
		for(SurveyVO s : list) {
			int qno = s.getQno();
			ArrayList<SurveyVO> l = (ArrayList<SurveyVO>) svDao.exList(qno);
			s.setList(l);
		}
		mv.addObject("TITLE", svVO.getTitle());
		mv.addObject("LIST", list);
		mv.addObject("LEN", list.size());
		mv.setViewName("survey/survey");
		return mv;
	}
	
	@RequestMapping("/surveyProc.moa")
	public ModelAndView surveyProc(SurveyVO svVO, ModelAndView mv, RedirectView rv, HttpSession session) {
		
		rv.setUrl("/moa/survey/survey.moa");
		String sid = (String) session.getAttribute("SID");
		svVO.setId(sid);
		int[] arr =svVO.getQnolist();
		for(int i=0; i<arr.length; i++) {
			svVO.setQno(arr[i]);
			svDao.insertAnswer(svVO);
		}
		
		rv.setUrl("/moa/survey/surveyList.moa");
		mv.setView(rv);
		return mv;
	}
	
	@RequestMapping(value = "/surveyResult.moa", params= { "title", "sino" })
	public ModelAndView surveyResult(SurveyVO svVO, ModelAndView mv) {
		
		ArrayList<SurveyVO> list = (ArrayList<SurveyVO>) svDao.questList(svVO.getSino());
		for(SurveyVO s : list) {
			ArrayList<SurveyVO> l = (ArrayList<SurveyVO>) svDao.getExResult(s);
			s.setList(l);
		}
		
		mv.addObject("TITLE", svVO.getTitle());
		mv.addObject("LIST", list);
		mv.addObject("LEN", list.size());
		mv.setViewName("survey/surveyResult");
		return mv;
	}
}
