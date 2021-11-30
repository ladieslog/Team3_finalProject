package com.care.dare.Cs_work;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class Controller01 {

	@GetMapping("index")
	public String frist() {
		System.out.println("index");
		return "Cs/cs_main";
	}
	
	@GetMapping("index1")
	public String second() {
		System.out.println("index1");
		return "Cs/cs01";
	}
	
	
	
}
