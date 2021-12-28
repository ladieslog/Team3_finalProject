package com.care.dare.join.controller ;

import java.io.IOException; 
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.care.dare.join.controller.*; 

public interface MemberService { 
	// 회원가입 프로세스 
	public void memberJoinProcess(MemberDTO dto); 
	public MemberDTO idcheck(String id);
	public int resister(HttpServletRequest req);
	public MemberDTO loginproc(HttpServletRequest req);
	public void memberList(Model model,String search);
	public void myHome(Model model,String id);
	public int myUpdate(HttpServletRequest req,String id);
	public void accountDelete(MemberDTO dto, HttpServletResponse resp, Model model);
	public int emailCertified(String id);
}


