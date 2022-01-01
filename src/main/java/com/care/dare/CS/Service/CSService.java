package com.care.dare.CS.Service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.care.dare.CS.DTO.NoticeDTO;
import com.care.dare.mybatis.CSMapper;

@Service
public class CSService {
	@Autowired
	CSMapper mapper;
	public int noticeWrite(HttpServletRequest req) {
		NoticeDTO dto = new NoticeDTO(); // 공지글의 정보가 저장되는 객체(클래스)
		dto.setTitle(req.getParameter("title")); // 게시글 제목
		dto.setContent(req.getParameter("content")); // 게시글 내용(본문)
		return mapper.noticeWrite(dto); // 게시글 저장
	}
	
	public void csMain(Model model, int currentPage) {
		int pageSize = 10; // 한 페이지에 보여줄 게시글 수
		int startRow = (currentPage - 1) * pageSize + 1; // 해당 페이지에서 시작할 게시글 번호
		int endRow = currentPage * pageSize; // 해당 페이지에서 마지막 게시글 번호
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm"); // 시간 형식 포맷
		
		int count = 0; //총 게시글 수
		count = mapper.noticeCount(); // 총 게시글 수를 가져옴
		
		List<NoticeDTO> list = new ArrayList<>(); // 게시글들을 저장할 리스트
		
		if(count > 0) {
			list = mapper.noticeBoard(startRow, endRow); // 해당 페이지의 게시글들을 가져와서 저장 (ex : 1~10까지의 게시글들을 가져와서 저장)
			for(NoticeDTO dto : list) {
				dto.setTimestr(sdf.format(dto.getTime())); // 시간 타입을 String 변경해서 저장
			}
		}
		// model(request)에 값들을 저장
		model.addAttribute("list", list);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("count", count);
	}
	
	public NoticeDTO noticeInfo(int num) {
		return mapper.noticeInfo(num);
	}
	public int noticeDelete(int num) {
		return mapper.noticeDelete(num);
	}
	
	public int noticeModify(HttpServletRequest req) {
		NoticeDTO dto = new NoticeDTO();
		dto.setNum(Integer.parseInt(req.getParameter("num")));
		dto.setTitle(req.getParameter("title"));
		dto.setContent(req.getParameter("content"));
		return mapper.noticeModify(dto);
	}
	
	public void noticeHit(int num) {
		mapper.noticeHit(num);
	}
}
