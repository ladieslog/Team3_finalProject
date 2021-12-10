package com.care.dare.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class DefaultController {

	@GetMapping("main")
	public String login() {
		System.out.println("main1");
		return "default/main";
	}
	
	@GetMapping("first")
	public String main() {
		System.out.println("main");
		return "main/first";
	}
	
	
}
