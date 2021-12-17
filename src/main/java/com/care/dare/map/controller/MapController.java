package com.care.dare.map.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.care.dare.map.service.MapService;

@Controller
@RequestMapping("/view")
public class MapController {
	
	@Autowired
	MapService map;
	
	@GetMapping("/seoul")
	public String Seoul() {
		return "map/seoul";
	}
	
	@GetMapping("/gyeongbuk")
	public String Gyeongbuk() {
		return "map/gyeongbuk";
	}
	
	@GetMapping("/detailmap")
	public String Detail() {
		return "map/detailMap";
	}
}
