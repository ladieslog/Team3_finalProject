package com.care.dare.join.controller ;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse; 
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import dao.MemberDao;
import com.care.dare.join.controller.*;
import com.care.dare.mybatis.DiaryMapper;
import com.care.dare.mybatis.JoinMapper; 

@Service
public class MemberServiceImp 
implements MemberService { 
	private MemberDao dao;
	@Autowired JoinMapper mapper;
	@Autowired DiaryMapper dm;
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
		dto.setAddr(req.getParameter("address"));
		dto.setEmail(req.getParameter("email"));
		dto.setMailnumber(Integer.parseInt(req.getParameter("zipcode")));
		dto.setDetailaddr(req.getParameter("detailaddress"));
		return mapper.resister(dto); 
	}
	public MemberDTO loginproc(HttpServletRequest req){
		MemberDTO dto= new MemberDTO();
		dto.setId(req.getParameter("id"));
		dto.setPwd(req.getParameter("pwd"));
		MemberDTO loginDTO= mapper.loginproc(dto);
		return loginDTO;
	}
	public void memberList(Model model) {
		ArrayList<MemberDTO>list=mapper.memberList();
		for(MemberDTO DTO: list) {
			DTO.setDiaryCount(dm.diaryCount(DTO.getId()));
		}
		model.addAttribute("list", list);
		
	}

	public void myHome(Model model, String id) {
		model.addAttribute("myHome",mapper.myHome(id));
	}

	public int myUpdate(HttpServletRequest req, String id) {
		MemberDTO dto = new MemberDTO();
		dto.setId(id);
		dto.setPwd(req.getParameter("pwd"));
		dto.setNickname(req.getParameter("nickname"));
		dto.setAddr(req.getParameter("address"));
		dto.setEmail(req.getParameter("email"));
		dto.setMailnumber(Integer.parseInt(req.getParameter("zipcode")));
		dto.setDetailaddr(req.getParameter("detailaddress"));
		return mapper.myUpdate(dto);
	}
}

