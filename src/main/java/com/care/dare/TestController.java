package com.care.dare;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TestController {
	@RequestMapping(value="test5")
	public String test2() {
		return "test/localTest";
	}
}
