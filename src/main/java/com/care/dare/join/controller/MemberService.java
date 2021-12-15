package com.care.dare.join.controller ;

package service;

import java.io.IOException; 
import java.util.List;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession; 
import dto.MemberDTO; 

public interface MemberService { 
	// 회원가입 프로세스 
	public void memberJoinProcess(MemberDTO dto); 
	}


