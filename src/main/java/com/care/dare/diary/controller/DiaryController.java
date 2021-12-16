package com.care.dare.diary.controller;

import java.io.DataOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.care.dare.diary.diaryService.DiaryService;
import com.care.dare.diary.dto.DiaryDTO;

@Controller
public class DiaryController {
	@Autowired DiaryService ds;
	
	@RequestMapping("diaryBoard")
	public String diaryBoard(HttpServletRequest req, Model model) throws Exception {
		int pageSize = 0;
		int diaryCount = ds.diaryCount();
		model.addAttribute("diaryCount", diaryCount);
		String currentPage = req.getParameter("currentPage");
		if(req.getParameter("currentPage") == null) {
			currentPage = "1";
		}
		if(currentPage.equals("1")) {
			pageSize = 3;
		}else {
			pageSize = 4;
		}
		int pageNum = Integer.parseInt(currentPage);
		int startRow = 0;
		int endRow = 0;
		if(pageSize==3) {
			startRow = (pageNum - 1) * pageSize + 1;
			endRow = pageNum * pageSize;
		}else {
			startRow = (pageNum - 1) * pageSize;
			endRow = pageNum * pageSize - 1;
		}
		ArrayList<DiaryDTO> arr = ds.diaryBoard(startRow, endRow);
		SimpleDateFormat sim = new SimpleDateFormat("yyyy-MM-dd");
		int count = 0;
		if(pageNum == 1) {
			count = 2;
		}else {
			count = 1;
		}
		for(DiaryDTO dto:arr) {
			dto.setIndatestr(sim.format(dto.getIndate()));
			dto.setOutdatestr(sim.format(dto.getOutdate()));
			if(dto.getImage1() == null) {
				count++;
				continue;
			}
			File file = new File("C:/spring/diary/"+count+".png");
			FileOutputStream fos = new FileOutputStream(file);
			DataOutputStream stream = new DataOutputStream(fos);
			stream.write(dto.getImage1()); 
			stream.flush();
			fos.getFD().sync();
			stream.close();
			count++;	
		}
		model.addAttribute("diaryList", arr);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("pageSize", pageSize);
		return "diary/diaryBoard";
	}
	
	@RequestMapping("diaryWrite")
	public String diaryWrite() {
		return "diary/diaryWrite";
	}
	
	@RequestMapping("diaryView")
	public String diaryView(Model model, @RequestParam("num")int num) {
		try {
			ds.diaryView(model, num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "diary/diaryView";
	}
	
	@PostMapping("writeSave")
	public String writeSave(MultipartHttpServletRequest mul) throws Exception {
		ds.writeSave(mul);
		return "redirect:diaryBoard";
	}
	
	@PostMapping("diaryDelete")
	public void diaryDelete(@RequestParam("deleteCheck")String deleteCheck, @RequestParam("deleteNum")int deleteNum,HttpServletResponse res) throws Exception{
		res.setContentType("text/html; charset=utf-8");
		PrintWriter out = res.getWriter();
		if(deleteCheck.equals("1")) {
			ds.diaryDelete(deleteNum);
			out.print("<script> alert('게시글이 삭제되었습니다.');"
					+"location.href='diaryBoard'; </script>");
		}else {
			out.print("<script> alert('잘못된 접근입니다');"
					+"location.href='diaryBoard'; </script>");
		}
	}
	
	@RequestMapping("diaryModify")
		public String diaryModify(@RequestParam("num")int num, Model model) throws Exception {
			ds.diaryModify(num, model);
			return "diary/diaryModify";
		}
	
	@RequestMapping("writeUpdate")
	public String writeUpdate(MultipartHttpServletRequest mul) throws Exception {
		ds.writeUpdate(mul);
		return "redirect:diaryBoard";
		
	}
	
}





