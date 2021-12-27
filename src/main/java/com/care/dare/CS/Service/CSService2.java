package com.care.dare.CS.Service;

import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.care.dare.CS.DTO.NoticeDTO;
import com.care.dare.CS.DTO.QnaDTO;
import com.care.dare.join.controller.MemberDTO;
import com.care.dare.mybatis.QnaMapper;

@Service
public class CSService2 {
	@Autowired
	
	QnaMapper mapper;
	public int QnaWrite(HttpServletRequest requ) {
		QnaDTO dto2= new QnaDTO();
		HttpSession se=requ.getSession();
		MemberDTO dto= (MemberDTO)se.getAttribute("loginUser");
		dto2.setQuestionId(dto.getId());
		dto2.setQuestionTitle(requ.getParameter("title"));
		dto2.setQuestionContent(requ.getParameter("content"));
		int result =mapper.qnaWrite(dto2);
		
		return result;	
	}
	public void QnaList(Model model) {
		model.addAttribute("list2",mapper.list2());
	}
	
	public void qnaInfo(Model model, int num) {
		
	}
	public int qnaDelete(int num) {
		return 0;
	}
	
	public int qnaModify(HttpServletRequest req) {
		QnaDTO dto2 =new QnaDTO();
		dto2.setNum(Integer.parseInt(req.getParameter("num")));
		dto2.setQuestionTitle(req.getParameter("questionTitle"));
		dto2.setQuestionContent(req.getParameter("questionContent"));
		dto2.setQuestionId(req.getParameter("questionId"));
		dto2.setAnswerContent(req.getParameter("answercontent"));
		dto2.setStatus(req.getParameter("status"));
		return mapper.qnaModify(dto2);
	}
	
	
	
	
	
	
	
}
