package com.care.dare.CS.Service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

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
	public void QnaList(Model model, int currentPage, MemberDTO userDto) {
		int pageSize = 10; // 한 페이지에 보여줄 게시글 수
		int startRow = (currentPage - 1) * pageSize + 1; // 해당 페이지에서 시작할 게시글 번호
		int endRow = currentPage * pageSize; // 해당 페이지에서 마지막 게시글 번호
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm"); // 시간 형식 포맷
		
		int count = 0; //총 게시글 수
		
		if(userDto.getId().equals("3333")) {
			count = mapper.qnaCount();
		} else {
			count = mapper.userQnaCount(userDto.getId());
		}
		
		
		List<QnaDTO> list = new ArrayList<>(); // 게시글들을 저장할 리스트
		
		if(count > 0) {
			if(userDto.getId().equals("3333")) {
				list = mapper.qnaBoard(startRow, endRow); // 해당 페이지의 게시글들을 가져와서 저장 (ex : 1~10까지의 게시글들을 가져와서 저장)
			} else {
				list = mapper.userQnaBoard(startRow, endRow, userDto.getId());
			}
			for(QnaDTO dto : list) {
				dto.setQuestionTimeStr(sdf.format(dto.getQuestionTime())); // 시간 타입을 String 변경해서 저장
				if(dto.getAnswerTime() != null) {
					dto.setAnswerTimeStr(sdf.format(dto.getAnswerTime()));
				}
				if(dto.getStatus().equals("1")) {
					dto.setStatusStr("답변 완료");
				} else {
					dto.setStatusStr("답변 대기");
				}
			}
		}
		// model(request)에 값들을 저장
		model.addAttribute("list2", list);
		model.addAttribute("currentPage2", currentPage);
		model.addAttribute("count2", count);
	}
	
	public QnaDTO qnaInfo(int num) {
		return mapper.qnaInfo(num);
	}
	public int qnaDelete(int num) {
		return mapper.qnaDelete(num);
	}
	
	
	public int qnaModify(HttpServletRequest req) {
		QnaDTO dto2 =new QnaDTO();
		dto2.setNum(Integer.parseInt(req.getParameter("num")));
		dto2.setQuestionTitle(req.getParameter("title"));
		dto2.setQuestionContent(req.getParameter("content"));
		return mapper.qnaModify(dto2);
	}
	
	public int answerWrite(HttpServletRequest req) {
		QnaDTO dto = new QnaDTO();
		dto.setNum(Integer.parseInt(req.getParameter("num")));
		dto.setAnswerContent(req.getParameter("content"));
		return mapper.answerWrite(dto);
	}
	
	
	
	
	
	
	
}
