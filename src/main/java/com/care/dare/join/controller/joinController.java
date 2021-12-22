package com.care.dare.join.controller;


import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller 

public class joinController { 
	private List<User> users = new ArrayList<User>();	
	@Autowired MemberService service;
	@PostMapping(value="idcheck", produces="application/json; charset=utf-8")
	@ResponseBody
	public Map idcheck(@RequestBody Map dto ) {
		String id= (String)dto.get("id");
		Map map= new HashMap();
		map.put("idcheck", service.idcheck(id));
		return map;
	}
	@PostMapping("memberProc")
	public void resister(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		resp.setContentType("text/html; charset=utf-8"); // 응답 설정 변경
        PrintWriter out = resp.getWriter(); // 화면 출력용 객체
        int result= service.resister(req);
        if(result==0) {
        	out.print("<script> alert('회원가입에 실패했습니다.');location.href='membership';</script>");    	
        }else {
        	out.print("<script> alert('회원가입에 성공하였습니다.');location.href='login';</script>");
        }
	}
	@GetMapping("membership")
	public String membership() {
		return "join/member";
	}
	@GetMapping("login")
	public String login() {
		return "join/login";
	}
	@GetMapping("memberList")
	public String memberList(Model md) {
		service.memberList(md);
		return "join/memberList";
	}
	@PostMapping("loginproc")
	public void loginproc(HttpServletRequest req, HttpServletResponse resp, Model model) throws IOException {
		resp.setContentType("text/html; charset=utf-8"); // 응답 설정 변경
        PrintWriter out = resp.getWriter(); // 화면 출력용 객체
        MemberDTO DTO= service.loginproc(req);
        if(DTO==null) {
        	out.print("<script> alert('ID 또는 비밀번호가 다릅니다.');location.href='login';</script>");  
        }else {
        	HttpSession session= req.getSession();
        	session.setAttribute("loginUser",DTO);
        	out.print("<script> alert('로그인 되었습니다.');location.href='diaryBoard';</script>"); 
        }
	}
	
	@GetMapping("logout")
	public void logout(HttpServletResponse resp, HttpServletRequest req) throws IOException {
		resp.setContentType("text/html; charset=utf-8"); // 응답 설정 변경
        PrintWriter out = resp.getWriter(); // 화면 출력용 객체
        HttpSession se = req.getSession();
        MemberDTO dto2 = (MemberDTO)se.getAttribute("loginUser");
        if(dto2==null) {
        	out.print("<script>;location.href='error';</script>");  
        }else {
        	se.invalidate();
        	out.print("<script> alert('로그아웃 되었습니다.');location.href='first';</script>"); 
        }
	}
	
	@GetMapping("MyHome")
	public String MyHome(Model model, HttpServletRequest req) {
		HttpSession ses = req.getSession();
		
		if(ses.getAttribute("loginUser")==null) {
			return "redirect:error";
		}else {
			MemberDTO dto5 = (MemberDTO)ses.getAttribute("loginUser");
			service.myHome(model, dto5.getId());
		}
		return "my/myHome";
	}
	
	@PostMapping("myUpdate")
	public void myUpdate(HttpServletRequest req,HttpServletResponse resp) throws IOException {
		HttpSession sess = req.getSession();
		resp.setContentType("text/html; charset=utf-8"); // 응답 설정 변경
        PrintWriter out = resp.getWriter(); // 화면 출력용 객체
        MemberDTO dto4 = (MemberDTO)sess.getAttribute("loginUser");
		if(dto4==null) {
			out.print("<script> location.href='error';</script>");  
		}else {
			int result = service.myUpdate(req,dto4.getId());
			if(result == 0) {
				out.print("<script> alert('회원정보 수정을 실패했습니다');location.href='MyHome';</script>");
			}else {
				out.print("<script> alert('회원정보 수정이 완료되었습니다');location.href='MyHome';</script>");
			}
		}
		
	}
	
}








