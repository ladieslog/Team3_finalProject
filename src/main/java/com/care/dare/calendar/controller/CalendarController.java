package com.care.dare.calendar.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/view")
public class CalendarController {

	@GetMapping("/calendar")
	public String index() {
		System.out.println("calendar 실행");
		return "calendar/calendar";
	}
}
