package com.care.dare.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class DefaultController {

	@GetMapping("main")
	public String login() {
		return "default/main";
	}
	
	@GetMapping("first")
	public String main() {
		return "main/first";
	}
	
	
}
