package com.care.dare.my.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MyController {
	@RequestMapping("MyHome")
	public String myHome() {
		return "my/myHome";
	}
}
