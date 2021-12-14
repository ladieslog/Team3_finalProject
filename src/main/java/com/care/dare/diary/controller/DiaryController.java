package com.care.dare.diary.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.care.dare.diary.diaryService.DiaryService;

@Controller
public class DiaryController {
	@Autowired DiaryService ds;
	
	@RequestMapping("diaryBoard")
	public String diaryBoard(HttpServletRequest req, Model model) {
		int pageSize = 10;
		String currentPage = req.getParameter("currentPage");
		if(req.getParameter("currentPage") == null) {
			currentPage = "1";
		}
		int pageNum = Integer.parseInt(currentPage);
		
		int startRow = (pageNum - 1) * pageSize + 1;
		int endRow = pageNum * pageSize;
		
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
	
	
}
