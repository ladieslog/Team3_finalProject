package com.care.dare.diary.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DiaryController {
	@RequestMapping("diaryBoard")
	public String diaryBoard() {
		return "diary/diaryBoard";
	}
	
	@RequestMapping("diaryWrite")
	public String diaryWrite() {
		return "diary/diaryWrite";
	}
	
	@RequestMapping("diaryView")
	public String diaryView() {
		return "diary/diaryView";
	}
}
