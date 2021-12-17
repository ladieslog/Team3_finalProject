package com.care.dare.CS.work;

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
		return "Cs/cs01_sign";
	}
	
	@GetMapping("cs2")
	public String cs2() {
		System.out.println("thred");
		return "Cs/cs02_qnaWrite";
	}
	
	@GetMapping("cs3")
	public String cs3() {
		System.out.println("four");
		return "Cs/cs03_signWrite";
	}
	
	@GetMapping("cs4")
	public String cs4() {
		System.out.println("five");
		return "Cs/cs04_qnaList";
	}
	
	@GetMapping("cs5")
	public String cs5() {
		System.out.println("six");
		return "Cs/cs05_signList";
	}
	
	@GetMapping("cs6")
	public String cs6() {
		System.out.println("seven");
		return "Cs/cs06_qnaAnswer";
	}
	
	
	
}
