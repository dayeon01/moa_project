package com.mono.moa.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.mono.moa.dao.MemberDao;
import com.mono.moa.util.MailUtil;
import com.mono.moa.vo.MemberVO;

@Controller
@RequestMapping("/member")	

public class Member {
	@Autowired
	MemberDao mDao;
	
	@RequestMapping("/login.moa")
	public ModelAndView getLogin(HttpSession session, ModelAndView mv, RedirectView rv) {	
		if(isLogin(session)) {	
			rv.setUrl("/moa/");
			mv.setView(rv);
		} else {
			String view = "member/login";
			mv.setViewName(view);
		}
	
		return mv;
	}
	
	@RequestMapping("/loginProc.moa")
	public ModelAndView loginProc( MemberVO mVO, ModelAndView mv, 
										HttpSession session, RedirectView rv) {
		String view = "/moa/";
		if(!isLogin(session)) {

			int cnt = mDao.getLogin(mVO);
			
			if(cnt == 1) {
				session.setAttribute("SID", mVO.getId());
			} else {
				mv.addObject("MSG", "false");
				mv.setViewName("member/login");
				return mv;
			}
		}
		
		rv.setUrl(view);
		
		mv.setView(rv); 
		return mv;
	}
	
	@RequestMapping("/logout.moa")
	public ModelAndView logout(HttpSession session, ModelAndView mv, RedirectView rv) {
		session.removeAttribute("SID");
		rv.setUrl("/moa/");
		mv.setView(rv);
		return mv;
	}
	
	@RequestMapping("/join.moa")
	public ModelAndView join(ModelAndView mv, RedirectView rv, HttpSession session) {

		if(isLogin(session)) {
			rv.setUrl("/moa/");
			mv.setView(rv);
			return mv;
		}
		
		String view = "member/join";
		
		mv.setViewName(view);
		return mv;
	}
	
	@RequestMapping("/joinProc.moa")
	public ModelAndView joinProc(MemberVO mVO, ModelAndView mv, 
									HttpSession session, RedirectView rv) {
		if(isLogin(session)) {
			rv.setUrl("/moa/");
			mv.setView(rv);
			return mv;
		}
		
		int cnt = mDao.addMember(mVO);
		
		if(cnt == 1) {
			session.setAttribute("SID", mVO.getId());
			rv.setUrl("/moa/");
		} else {
			rv.setUrl("/moa/member/join.moa");
		}
		
		mv.setView(rv);
		return mv;
	}
	

	@RequestMapping("/idCheck.moa")
	@ResponseBody
	public HashMap<String, String> idCheck(String id) {
		int cnt = mDao.idCheck(id);

		HashMap<String, String> map = new HashMap<String, String>();
		map.put("result", "NO");
		if(cnt != 1) {
			map.put("result", "OK");
		}		
		return map;
	}
	
	@RequestMapping("/myPage.moa")
	public ModelAndView myPage(ModelAndView mv, RedirectView rv, HttpSession session) {
		
		if(isLogin(session)) {	
			rv.setUrl("/moa/");
			mv.setView(rv);
		}
		mv.addObject(session.getAttribute("SID"));
		mv.setViewName("member/myPage");
		return mv;
	}
	
	@RequestMapping("/myInfo.moa")
	public ModelAndView myInfo(ModelAndView mv, RedirectView rv, HttpSession session) {
		
		if(!isLogin(session)) {	
			rv.setUrl("/moa/");
			mv.setView(rv);
			return mv;
		}
		String id = (String) session.getAttribute("SID");
		MemberVO mVO = mDao.getMyInfo(id);
		
		mv.addObject("DATA", mVO);
		mv.setViewName("member/myInfo");
		return mv;
	}
	
	@RequestMapping("/myInfoEdit.moa")
	public ModelAndView myInfoEdit(ModelAndView mv, RedirectView rv, HttpSession session) {
		
		if(!isLogin(session)) {	
			rv.setUrl("/moa/");
			mv.setView(rv);
			return mv;
		}
		String id = (String) session.getAttribute("SID");
		MemberVO mVO = mDao.getMyInfo(id);
		
		mv.addObject("DATA", mVO);
		mv.setViewName("member/myInfoEdit");
		return mv;
	}
	
	@RequestMapping("/myInfoEditProc.moa")
	public ModelAndView myInfoEdit(ModelAndView mv, RedirectView rv, 
									HttpSession session, MemberVO mVO) {
		
		if(!isLogin(session)) {	
			rv.setUrl("/moa/");
			mv.setView(rv);
			return mv;
		}
		String id = (String) session.getAttribute("SID");
		mVO.setId(id);
		int cnt = mDao.myInfoEdit(mVO);
		if(cnt != 1) {
			rv.setUrl("/moa/member/myInfoEdit.moa");
		}
		rv.setUrl("/moa/member/myInfo.moa");
		mv.setView(rv);
		return mv;
	}
	
	@RequestMapping("/myInfoDel.moa")
	public ModelAndView myInfoDel(ModelAndView mv, RedirectView rv, HttpSession session) {
		
		if(!isLogin(session)) {	
			rv.setUrl("/moa/");
			mv.setView(rv);
			return mv;
		}
		String id = (String) session.getAttribute("SID");
		MemberVO mVO = mDao.getMyInfo(id);
		
		mv.addObject("DATA", mVO);
		mv.setViewName("member/myInfoDel");
		return mv;
	}
	
	@RequestMapping("/myInfoDelProc.moa")
	public ModelAndView myInfoDelProc(ModelAndView mv, RedirectView rv, 
									HttpSession session, MemberVO mVO) {
		
		if(!isLogin(session)) {	
			rv.setUrl("/moa/");
			mv.setView(rv);
			return mv;
		}
		String id = (String) session.getAttribute("SID");
		int cnt = mDao.myInfoDel(id);
		if(cnt != 1) {
			rv.setUrl("/moa/member/myInfoDel.moa");
		}
		session.removeAttribute("SID");
		rv.setUrl("/moa/");
		mv.setView(rv);
		return mv;
	}
	
	@RequestMapping("/loginFindId.moa")
	public ModelAndView loginFindId(HttpSession session, ModelAndView mv, RedirectView rv) {
		
		if(isLogin(session)) {	
			rv.setUrl("/moa/");
			mv.setView(rv);
		} else {
			String view = "member/loginFindId";
			mv.setViewName(view);
		}
	
		return mv;
	}
	
	@RequestMapping("/loginFindIdProc.moa")
	@ResponseBody
	public HashMap<String, String> loginFindIdProc(MemberVO mVO) {
		MemberVO tVO = mDao.loginFindId(mVO);
		String id = tVO.getId();
		String email = tVO.getEmail();
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("result", "NO");
		if(id != null) {
		
			String tmp = MailUtil.gmailSend(email);
			map.put("result", "OK");
			map.put("result1", tmp);
			map.put("result2", id);
		}		
		return map;
	}
	
	
	@RequestMapping("/loginFindPw.moa")
	public ModelAndView loginFindPw(HttpSession session, ModelAndView mv, RedirectView rv) {
		
		if(isLogin(session)) {	
			rv.setUrl("/moa/");
			mv.setView(rv);
		} else {
			String view = "member/loginFindPw";
			mv.setViewName(view);
		}
	
		return mv;
	}
	
	@RequestMapping("/loginFindPwProc.moa")
	@ResponseBody
	public HashMap<String, String> loginFindPwProc(MemberVO mVO) {
		String email = mDao.loginFindPw(mVO);
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("result", "NO");
		if(email != null) {
		
			String tmp = MailUtil.gmailSend(email);
			mVO.setPw(tmp);
			mDao.editPw(mVO);
			map.put("result", "OK");
			map.put("result1", tmp);
		}
		
		return map;
	}
	
	public boolean isLogin(HttpSession session) {
		String sid = (String) session.getAttribute("SID");
		
		return (sid == null) ? false : true;
	}
	
}
