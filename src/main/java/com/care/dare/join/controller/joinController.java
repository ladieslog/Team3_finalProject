package com.care.dare.join.controller;


import java.util.ArrayList;
import java.util.List;

import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller 

public class joinController { 
	private List<User> users = new ArrayList<User>();	

	
	@GetMapping("membership")
	public String membership()
	{
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
