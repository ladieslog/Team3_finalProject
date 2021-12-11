package com.care.dare.join.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class joinController {
	
	@GetMapping("membership")
	public String membership() {
		return "join/member";
	}

	@GetMapping("login")
	public String login() {
		return "join/login";
	}

	@GetMapping("memberList")
	public String memberList() {
		return "join/memberList";
	}
}
