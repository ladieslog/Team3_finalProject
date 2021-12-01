package com.care.dare.Cs_work;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class Controller01 {

	@GetMapping("cs")
	public String cs() {
		System.out.println("frist");
		return "Cs/cs_main";
	}
	
	@GetMapping("cs1")
	public String cs1() {
		System.out.println("two");
		return "Cs/cs01";
	}
	
	@GetMapping("cs2")
	public String cs2() {
		System.out.println("thred");
		return "Cs/cs02";
	}
	
	@GetMapping("cs3")
	public String cs3() {
		System.out.println("four");
		return "Cs/cs03";
	}
	
	@GetMapping("cs4")
	public String second() {
		System.out.println("five");
		return "Cs/cs04";
	}
	
	
	
}
