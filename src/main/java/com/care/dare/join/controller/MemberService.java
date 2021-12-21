package com.care.dare.join.controller ;

import java.io.IOException; 
import java.util.List;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession; 
import com.care.dare.join.controller.*; 

public interface MemberService { 
	// 회원가입 프로세스 
	public void memberJoinProcess(MemberDTO dto); 
	}


