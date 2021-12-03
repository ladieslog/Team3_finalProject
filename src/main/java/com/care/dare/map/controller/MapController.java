package com.care.dare.map.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/view")
public class MapController {
	@GetMapping("/firstmap")
	public String gosimplemap() {
		System.out.println("Map 실행");
		return "map/simpleMap";
	}
	@GetMapping("/detailmap")
	public String godetailmap() {
		System.out.println("Map 실행");
		return "map/detailMap";
	}
}
