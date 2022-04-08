package com.care.dare.diary.controller;

import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.UUID;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.care.dare.diary.diaryService.DiaryService;
import com.care.dare.diary.dto.DiaryDTO;
import com.care.dare.join.controller.MemberDTO;
import com.google.gson.JsonObject;

@Controller
public class DiaryController {
	@Autowired DiaryService ds;
	
	@RequestMapping("diaryBoard")
	public String diaryBoard(HttpServletRequest req, Model model, HttpServletResponse resp) throws Exception {
		resp.setContentType("text/html; charset=utf-8"); // 응답 설정 변경
        PrintWriter out = resp.getWriter(); // 화면 출력용 객체
		HttpSession session = req.getSession();
		String search = req.getParameter("search");
		if(search == null) {
			search = "";
		}
		if(session.getAttribute("loginUser")==null) {
			return "error/loginError";
		}else {
		MemberDTO dto1 = (MemberDTO)session.getAttribute("loginUser");
		int pageSize = 0;
		int diaryCount = ds.diaryCount(dto1.getId(),search);
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
		
		ArrayList<DiaryDTO> arr = ds.diaryBoard(startRow, endRow, dto1.getId(),search);
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
		//	stream.write(dto.getImage1()); 
			stream.flush();
			fos.getFD().sync();
			stream.close();
			count++;	
		}
		if(currentPage.equals("1")) {
			model.addAttribute("pageChk",1);
		}
		model.addAttribute("diaryList", arr);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("search", search);
		}
		return "diary/diaryBoard";
	}
	
	@RequestMapping("diaryWrite")
	public String diaryWrite(HttpServletRequest req) {
		HttpSession session = req.getSession();
		if(session.getAttribute("loginUser") == null) {
			return "error/loginError";
		}
		return "diary/diaryWrite";
	}
	@RequestMapping("error")
	public String Notsession() {
		return "error/Notsession";
	}
	@RequestMapping("500error")
	public String Not500() {
		return "error/Not500";
	}
	@RequestMapping("loginError")
	public String loginError() {
		return "error/loginError";
	}
	
	
	@RequestMapping("diaryView")
	public String diaryView(HttpServletRequest req, Model model, @RequestParam("num")int num) throws Exception {
		HttpSession session = req.getSession();
		MemberDTO loginUser = (MemberDTO) session.getAttribute("loginUser");
		if(loginUser == null) {
			return "error/loginError";
		}
		DiaryDTO dto = null;
		dto = ds.diaryView(num);
		if(!(dto.getId().equals(loginUser.getId()))) {
			return "error/Notsession";
		}
		model.addAttribute("diary",dto);
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
		public String diaryModify(@RequestParam("num")int num, Model model, HttpServletRequest req) throws Exception {
			HttpSession session = req.getSession();
			MemberDTO userDto = (MemberDTO) session.getAttribute("loginUser");
			if(userDto == null) {
				return "error/loginError";
			}
			DiaryDTO dto = ds.diaryModify(num);
			if(!(dto.getId().equals(userDto.getId()))) {
				return "error/Notsession";
			}
			model.addAttribute("diary",dto);
			return "diary/diaryModify";
		}
	
	@PostMapping("writeUpdate")
	public String writeUpdate(HttpServletRequest req) throws Exception  {
		ds.writeUpdate(req);
		return "redirect:diaryBoard";
		
	}

	@RequestMapping(value="imgUp", produces="application/json; charset=utf-8")
	@ResponseBody
	public String imgUp(@RequestParam("file")MultipartFile file,HttpServletRequest req) {

		JsonObject json = new JsonObject();
		String root = "C:/spring/diary/";
		String originalname = file.getOriginalFilename();
		String savename = UUID.randomUUID()+originalname;
		File target = new File(root+savename);
		InputStream is;
		try {
			is = file.getInputStream();
			FileUtils.copyInputStreamToFile(is, target);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		json.addProperty("url", savename);
		String result = json.toString();
		return result;
	}
}

