package com.care.dare.join.controller ;

import java.io.IOException;  
import java.util.List;
import javax.servlet.http.HttpServletResponse; 
import javax.servlet.http.HttpSession;

import dao.MemberDao;
import com.care.dare.join.controller.*; 

public class MemberServiceImp 
implements MemberService { 
	private MemberDao dao; 
	
	public void setDao(MemberDao dao) { 
		this.dao = dao; 
		} 
	// 회원가입 
	@Override 
	public void memberJoinProcess(MemberDTO dto) {
		dao.memberJoinMethod(dto);
		} 
	
}

