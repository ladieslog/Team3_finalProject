package com.care.dare.diary.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DiaryController {
	@RequestMapping("diaryBoard")
	public String diaryBoard() {
		return "diary/diaryBoard";
	}
}
