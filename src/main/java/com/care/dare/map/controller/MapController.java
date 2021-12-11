package com.care.dare.map.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/view")
public class MapController {
	
	@GetMapping("/firstmap")
	public String List() {
		// System.out.println("firstmap 실행");
		return "map/simpleMap";
	}
	
	
}
