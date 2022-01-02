package com.care.dare.join.controller;


import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
	public String login(HttpServletRequest req) {
		HttpSession session = req.getSession();
		MemberDTO dto = (MemberDTO) session.getAttribute("loginUser");
		if(dto == null) {
			return "join/login";
		} else {
			return "redirect:diaryBoard";
		}
		
	}

	@GetMapping("memberList")
	public String memberList(Model md, HttpServletRequest req) {
		String search = req.getParameter("search");
		if(search == null) {
			search = "";
		}
		HttpSession session = req.getSession();
		MemberDTO dto = (MemberDTO) session.getAttribute("loginUser");
		if(dto == null) {
			return "redirect:error";
		}
		service.memberList(md,search);
		md.addAttribute("search1",search);
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
        	session.setMaxInactiveInterval(60 * 60 * 24);
        	out.print("<script> alert('로그인 되었습니다.');location.href='map';</script>"); 
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
	public void myUpdate(HttpServletRequest req,HttpServletResponse resp, Model model) throws IOException {
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
	
	@RequestMapping("accountDelete")
	@ResponseBody
	public ArrayList accountDelete(HttpServletRequest req, HttpServletResponse resp, Model model) throws IOException {
		ArrayList list = new ArrayList();
		
		HttpSession session = req.getSession();
		MemberDTO ssDto = (MemberDTO) session.getAttribute("loginUser");
		if(ssDto == null) {
			model.addAttribute("error", "1491184513467160054");
		}
		service.accountDelete(ssDto, resp, model);
		list.add(model.getAttribute("certified"));
		return list;
	}
	
	
	@RequestMapping(value = "emailCertified", method = RequestMethod.POST)
	public void emailCertified(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		resp.setContentType("text/html; charset=utf-8"); // 응답 설정 변경
        PrintWriter out = resp.getWriter(); // 화면 출력용 객체
		HttpSession session = req.getSession();
		MemberDTO dto = (MemberDTO) session.getAttribute("loginUser");
		int result = service.emailCertified(dto.getId());
		if(result == 0) {
			out.print("<script> alert('회원 탈퇴에 실패했습니다');location.href='MyHome';</script>");
		} else {
			session.invalidate();
			out.print("<script> alert('탈퇴되었습니다.');location.href='first';</script>");
		}
	}
}








