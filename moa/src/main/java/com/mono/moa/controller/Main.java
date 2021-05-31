package com.mono.moa.controller;

import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;

@Controller
public class Main {
	
	@RequestMapping("/main.moa")
	public String main() { //메인 페이지 테스트
		
		return "/main";
	}
}
