package com.care.dare.join.controller ;

import java.io.IOException;  
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse; 
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.MemberDao;
import com.care.dare.join.controller.*;
import com.care.dare.mybatis.JoinMapper; 

@Service
public class MemberServiceImp 
implements MemberService { 
	private MemberDao dao;
	@Autowired JoinMapper mapper;
	public MemberDTO idcheck(String id) {
		MemberDTO dto= mapper.idcheck(id);
		return dto;
	}
	public void setDao(MemberDao dao) { 
		this.dao = dao; 
		} 
	// 회원가입 
	@Override 
	public void memberJoinProcess(MemberDTO dto) {
		dao.memberJoinMethod(dto);
		} 
	public int resister(HttpServletRequest req) {
		MemberDTO dto=new MemberDTO();
		dto.setId(req.getParameter("id"));
		dto.setPwd(req.getParameter("pwd"));
		dto.setNickname(req.getParameter("nickname"));
		dto.setAddr(req.getParameter("address")+req.getParameter("detailaddress"));
		dto.setEmail(req.getParameter("email"));
		
		return mapper.resister(dto); 
	}

}

