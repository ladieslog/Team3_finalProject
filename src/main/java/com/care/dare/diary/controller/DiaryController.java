package com.care.dare.diary.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.care.dare.diary.diaryService.DiaryService;

@Controller
public class DiaryController {
	@Autowired DiaryService ds;
	
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
	
	@PostMapping("writeSave")
	public String writeSave(MultipartHttpServletRequest mul) throws Exception {
		ds.writeSave(mul);
		return "home";
	}
	
	@GetMapping("writeList")
	public String writeList(Model model) {
		ds.memberInfo(model);
		return "home";
	}
	
	
	
}
