package com.mono.moa.controller;

import java.util.*;

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
	
	// 로그인 폼보기
	@RequestMapping("/login.moa")
	public ModelAndView getLogin(HttpSession session, ModelAndView mv, RedirectView rv) {	
		
		// 로그인 검사
		if(isLogin(session)) {	
			rv.setUrl("/moa/");
			mv.setView(rv);	
		} else {
			String view = "member/login";
			mv.setViewName(view);
		}
		
		return mv;
	}
	
	// 로그인 처리
	@RequestMapping("/loginProc.moa")      
	public ModelAndView loginProc( MemberVO mVO /*(id, pw)*/, 
								ModelAndView mv, HttpSession session, RedirectView rv) {
		String view = "/moa/main.moa";
		if(!isLogin(session)) {

			int cnt = mDao.getLogin(mVO) /*(id, pw)*/;
			
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
	
	
	//로그아웃 처리
	@RequestMapping("/logout.moa")
	public ModelAndView logout(HttpSession session, ModelAndView mv, RedirectView rv) {
		session.removeAttribute("SID");
		rv.setUrl("/moa/main.moa");
		mv.setView(rv);
		return mv;
	}
	
	
	//회원가입 폼보기
	@RequestMapping("/join.moa")
	public ModelAndView join(ModelAndView mv, RedirectView rv, HttpSession session) {

		if(isLogin(session)) {
			rv.setUrl("/moa/main");
			mv.setView(rv);
			return mv;
		}
		
		String view = "member/join";
		
		mv.setViewName(view);
		return mv;
	}
	
	// 회원가입 요청처리
	@RequestMapping("/joinProc.moa")
	public ModelAndView joinProc(MemberVO mVO /*(name, id, pw, tel, email, gen, birth)*/
								,ModelAndView mv, HttpSession session, RedirectView rv) {
		if(isLogin(session)) {
			rv.setUrl("/moa/main.moa");
			mv.setView(rv);
			return mv;
		}
		
		int cnt = mDao.addMember(mVO);
		
		if(cnt == 1) {
			session.setAttribute("SID", mVO.getId());
			rv.setUrl("/moa/main.moa");
		} else {
			rv.setUrl("/moa/member/join.moa");
		}
		
		mv.setView(rv);
		return mv;
	}
	
	// 아이디, 메일, 전화번호 중복검사
	@RequestMapping("/ukCheck.moa")
	@ResponseBody
	public HashMap<String, String> ukCheck(MemberVO mVO) {
		int cnt = mDao.ukCheck(mVO);
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("result", "NO");
		map.put("cnt", cnt+"");
		if(cnt != 1) {
			map.put("result", "OK");
		}		
		return map;
	}
	
	
	// 마이페이지 폼보기
	@RequestMapping("/myPage.moa")
	public ModelAndView myPage(ModelAndView mv, RedirectView rv, HttpSession session) {
		
		if(!isLogin(session)) {	
			rv.setUrl("/moa/main.moa");
			mv.setView(rv);
			return mv;
		}
		mv.addObject(session.getAttribute("SID"));
		mv.setViewName("member/myPage");
		return mv;
	}
	
	// 내정보 조회
	@RequestMapping("/myInfo.moa")
	public ModelAndView myInfo(ModelAndView mv, RedirectView rv, HttpSession session) {
		
		if(!isLogin(session)) {	
			rv.setUrl("/moa/main.moa");
			mv.setView(rv);
			return mv;
		}
		String id = (String) session.getAttribute("SID");
		MemberVO mVO = mDao.getMyInfo(id);
		
		mv.addObject("DATA", mVO);
		mv.setViewName("member/myInfo");
		return mv;
	}
	
	
	// 내 정보 수정
	@RequestMapping("/myInfoEdit.moa")
	public ModelAndView myInfoEdit(ModelAndView mv, RedirectView rv, HttpSession session) {
		
		if(!isLogin(session)) {	
			rv.setUrl("/moa/main.moa");
			mv.setView(rv);
			return mv;
		}
		String id = (String) session.getAttribute("SID");
		MemberVO mVO = mDao.getMyInfo(id);
		
		mv.addObject("DATA", mVO);
		mv.setViewName("member/myInfoEdit");
		return mv;
	}
	
	// 내정보 수정처리
	@RequestMapping("/myInfoEditProc.moa")
	public ModelAndView myInfoEdit(MemberVO mVO /* name, pw, tel, email, gen, birth */
								,ModelAndView mv, RedirectView rv, HttpSession session) {
		
		if(!isLogin(session)) {	
			rv.setUrl("/moa/main.moa");
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
	
	
	//회원탈퇴 폼보기
	@RequestMapping("/myInfoDel.moa")
	public ModelAndView myInfoDel(ModelAndView mv, RedirectView rv, HttpSession session) {
		
		if(!isLogin(session)) {	
			rv.setUrl("/moa/main.moa");
			mv.setView(rv);
			return mv;
		}
		String id = (String) session.getAttribute("SID");
		MemberVO mVO = mDao.getMyInfo(id);
		/* mno, id, pw, name, email, tel, gen, birth, jdate */
		
		mv.addObject("DATA", mVO);
		mv.setViewName("member/myInfoDel");
		return mv;
	}
	
	
	//회원탈퇴 처리요청
	@RequestMapping("/myInfoDelProc.moa")
	public ModelAndView myInfoDelProc(MemberVO mVO /* id, name, pw */
								,ModelAndView mv, RedirectView rv, HttpSession session ) {
		
		if(!isLogin(session)) {	
			rv.setUrl("/moa/main.moa");
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
	
	// 아이디 찾기 폼보기
	@RequestMapping("/loginFindId.moa")
	public ModelAndView loginFindId(HttpSession session, ModelAndView mv, RedirectView rv) {
		
		if(isLogin(session)) {	
			rv.setUrl("/moa/main.moa");
			mv.setView(rv);
		} else {
			String view = "member/loginFindId";
			mv.setViewName(view);
		}
	
		return mv;
	}
	
	//아이디 찾기 처리요청
	@RequestMapping("/loginFindIdProc.moa")
	@ResponseBody
	public HashMap<String, String> loginFindIdProc(MemberVO mVO /* name, tel */) {
		
		MemberVO tVO = mDao.loginFindId(mVO);
		/* id, email */
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("result", "NO");
		if(tVO == null) {
			return map;
		}
		String tmp = MailUtil.gmailSend(tVO.getEmail());
		map.put("result", "OK");
		map.put("result1", tmp);
		map.put("result2", tVO.getId());	
		return map;
	}
	
	//비밀번호 찾기 폼보기
	@RequestMapping("/loginFindPw.moa")
	public ModelAndView loginFindPw(HttpSession session, ModelAndView mv, RedirectView rv) {
		
		if(isLogin(session)) {	
			rv.setUrl("/moa/main.moa");
			mv.setView(rv);
		} else {
			String view = "member/loginFindPw";
			mv.setViewName(view);
		}
	
		return mv;
	}
	
	// 비밀번호 찾기 요청처리
	@RequestMapping("/loginFindPwProc.moa")
	@ResponseBody
	public HashMap<String, String> loginFindPwProc(MemberVO mVO /* id, email */) {
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
	
	// 로그인 검사
	public boolean isLogin(HttpSession session) {
		String sid = (String) session.getAttribute("SID");
		
		return (sid == null) ? false : true;
	}
	
}
