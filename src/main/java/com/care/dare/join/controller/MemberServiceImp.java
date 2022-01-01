package com.care.dare.join.controller ;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse; 
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.care.dare.join.controller.*;
import com.care.dare.mybatis.DiaryMapper;
import com.care.dare.mybatis.JoinMapper;


@Service
public class MemberServiceImp implements MemberService { 
	//private MemberDao dao;
	@Autowired JoinMapper mapper;
	@Autowired DiaryMapper dm;
	@Autowired JavaMailSender mailSender;
	BCryptPasswordEncoder encoder;
	
	public MemberServiceImp() {
		encoder = new BCryptPasswordEncoder();
	}
	public MemberDTO idcheck(String id) {
		MemberDTO dto= mapper.idcheck(id);
		return dto;
	}
	
	// 회원가입 
	@Override 
	public void memberJoinProcess(MemberDTO dto) {
		//dao.memberJoinMethod(dto);
		} 
	public int resister(HttpServletRequest req) {
		MemberDTO dto=new MemberDTO();
		dto.setId(req.getParameter("id"));
		dto.setPwd(encoder.encode(req.getParameter("pwd")));
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
		if(loginDTO != null) {
			if(encoder.matches(dto.getPwd(), loginDTO.getPwd())) {
				return loginDTO;
			}
		}
		return null;
	}
	public void memberList(Model model,String search) {
		ArrayList<MemberDTO>list=mapper.memberList(search);
		for(MemberDTO DTO: list) {
			DTO.setDiaryCount(dm.userDiaryCount(DTO.getId()));
		}
		model.addAttribute("list", list);
		
	}

	public void myHome(Model model, String id) {
		model.addAttribute("myHome",mapper.myHome(id));
	}

	public int myUpdate(HttpServletRequest req, String id) {
		MemberDTO dto = new MemberDTO();
		HttpSession session = req.getSession();
		dto.setId(id);
		dto.setPwd(encoder.encode(req.getParameter("pwd")));
		dto.setNickname(req.getParameter("nickname"));
		dto.setAddr(req.getParameter("address"));
		dto.setEmail(req.getParameter("email"));
		dto.setMailnumber(Integer.parseInt(req.getParameter("zipcode")));
		dto.setDetailaddr(req.getParameter("detailaddress"));
		int result = mapper.myUpdate(dto);
		if(result == 1) {
			session.setAttribute("loginUser", dto);
		}
		return result;
	}
	
	public void accountDelete(MemberDTO dto, HttpServletResponse resp, Model model) {
		String Certified = "";
		for(int i=1; i<=6; i++) {
			int num = (int)(Math.random()*9)+1;
			Certified += String.valueOf(num);
		}
		MimeMessage message = mailSender.createMimeMessage();
		try {
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
			helper.setTo(dto.getEmail());
			helper.setFrom("tripnote03@gmail.com", "관리자");
			helper.setSubject("트립노트 회원 탈퇴 이메일 인증");
			StringBuffer sb = new StringBuffer();
			sb.append("웹 화면에 해당 인증번호를 입력하고 탈퇴버튼을 클릭해야 탈퇴가 완료됩니다.<br/>");
			sb.append("인증 번호 : ");
			sb.append(Certified);
			helper.setText(sb.toString(), true);
			mailSender.send(message);
			model.addAttribute("certified", Certified);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public int emailCertified(String id) {
		return mapper.accountDelete(id);
	}
}

