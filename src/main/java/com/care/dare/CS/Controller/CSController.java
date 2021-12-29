package com.care.dare.CS.Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.care.dare.CS.DTO.NoticeDTO;
import com.care.dare.CS.DTO.QnaDTO;
import com.care.dare.CS.Service.CSService;
import com.care.dare.CS.Service.CSService2;
import com.care.dare.join.controller.MemberDTO;

@Controller
public class CSController {
	@Autowired
	CSService service;
	
	@Autowired
	CSService2 service2;
	
	@RequestMapping(value = "csMain")
	public String csMain(Model model, HttpServletRequest req) {
		HttpSession session = req.getSession();
		String noticePageNumber = (String) session.getAttribute("noticePageNumber"); // noticePageNumber 세션값을 받아옴 페이지 번호가 들어있음
		int noticeCurrentPage = 0;
		
		MemberDTO dto = (MemberDTO) session.getAttribute("loginUser");
		if(dto == null) {
			return "redirect:error";
		}
		
		if(noticePageNumber == null) {
			noticeCurrentPage = 1; // 만약 noticePageNumber 세션값이 없다면 현재 페이지를 1페이지로 설정
		} else {
			noticeCurrentPage = Integer.parseInt(noticePageNumber); // noticePageNumber 페이지 번호를 int로 변경
		}
		
		String qnaPageNumber = (String) session.getAttribute("qnaPageNumber"); // noticePageNumber 세션값을 받아옴 페이지 번호가 들어있음
		int qnaCurrentPage = 0;
		if(qnaPageNumber == null) {
			qnaCurrentPage = 1; // 만약 noticePageNumber 세션값이 없다면 현재 페이지를 1페이지로 설정
		} else {
			qnaCurrentPage = Integer.parseInt(qnaPageNumber); // noticePageNumber 페이지 번호를 int로 변경
		}
		
		service.csMain(model, noticeCurrentPage);
		service2.QnaList(model, qnaCurrentPage, dto);
		return "Cs/cs01_sign";
	}
	
	@RequestMapping(value = "notice")
	public String notice() {
		return "Cs/cs03_signWrite";
	}
	
	@RequestMapping(value = "qna")
	public String qna() {
		return "Cs/cs02_qnaWrite";
	}
	
	@RequestMapping(value = "an1")
	public String an1() {
		return "Cs/cs04_qnaList";
	}
	
	@RequestMapping(value = "an2")
	public String an2() {
		return "Cs/cs05_signList";
	}
	
	@RequestMapping(value = "qnaAnswer")
	public String answer() {
		return "Cs/cs06_qnaAnswer";
	}
	
	
	@RequestMapping(value = "noticeWrite", method = RequestMethod.POST)
	public void noticeWrite(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		int result = service.noticeWrite(req);
		resp.setContentType("text/html; charset=utf-8"); // 응답 설정 변경
		PrintWriter out = resp.getWriter(); // 화면에 출력할 스트림
		System.out.println(result);
		if(result == 0) { // 공지 작성에 실패했을 경우
			out.print("<script> alert('공지 작성에 실패했습니다.');"
					+"location.href='csMain'; </script>");
		} else { // 공지 작성에 성공했을경우
			out.print("<script> alert('공지 작성이 완료되었습니다.');"
					+"location.href='csMain'; </script>");
		}
	}
	
	@RequestMapping(value = "qnaWrite", method = RequestMethod.POST)
	public void qnaWrite(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		int result = service2.QnaWrite(req);
		resp.setContentType("text/html; charset=utf-8"); // 응답 설정 변경
		PrintWriter out = resp.getWriter(); // 화면에 출력할 스트림
		if(result == 0) { // 공지 작성에 실패했을 경우
			out.print("<script> alert('질문 작성에 실패했습니다.');"
					+"location.href='csMain'; </script>");
		} else { // 공지 작성에 성공했을경우
			out.print("<script> alert('질문 작성이 완료되었습니다.');"
					+"location.href='csMain'; </script>");
		}
	}
	
	
	
	
	@RequestMapping(value = "pageSet", method = RequestMethod.POST, produces="application/json; charset=utf-8")
	@ResponseBody
	public List<NoticeDTO> pageSet(@RequestBody Map form, Model model, HttpServletRequest req) {
		//int currentPage = (Integer) form.get("currentPage");
		String PageNum = (String) form.get("currentPage"); // csMain페이지로부터 이동할 페이지 값을 받음
		int currentPage = Integer.parseInt(PageNum); // PageNum를 int로 변경
		service.csMain(model, currentPage);
		List<NoticeDTO> list = (List<NoticeDTO>) model.getAttribute("list"); // 이동할 페이지의 게시글들이 저장된 리스트임 ajax 통신땜에 또 List 변수를 만들어서 저장
		HttpSession session = req.getSession(); // 세션
		session.setAttribute("noticePageNumber", PageNum); // 세션에 페이지 번호 저장(현재 페이지 값임)
		return list;
	}
	
	@RequestMapping(value = "pageSet2", method = RequestMethod.POST, produces="application/json; charset=utf-8")
	@ResponseBody
	public List<QnaDTO> pageSet2(@RequestBody Map form, Model model, HttpServletRequest req) {
		HttpSession session = req.getSession();
		MemberDTO dto = (MemberDTO) session.getAttribute("loginUser");
		String PageNum = (String) form.get("currentPage2");
		int currentPage = Integer.parseInt(PageNum);
		service2.QnaList(model, currentPage, dto);
		List<QnaDTO> list2 = (List<QnaDTO>) model.getAttribute("list2"); 
		session.setAttribute("qnaPageNumber", PageNum); 
		return list2;
	}
	
	
	
	
	@RequestMapping(value = "noticeInfo")
	public String noticeInfo(HttpServletRequest req, Model model, HttpServletResponse resp) throws IOException {
		resp.setContentType("text/html; charset=utf-8"); // 응답 설정 변경
		PrintWriter out = resp.getWriter(); // 화면 출력용 객체
		HttpSession session = req.getSession();
		MemberDTO dto = (MemberDTO) session.getAttribute("loginUser");
		if(dto == null) {
			return "error/loginError";
		}
		
		String parameterNum = req.getParameter("num"); // 게시글 번호를 받아옴
		if(parameterNum == null) { // 게시글 번호가 없다면 잘못된 접근임
			out.print("<script> alert('잘못된 접근입니다.');"
					+"location.href='csMain'; </script>");
		}
		int num = Integer.parseInt(parameterNum); // 게시글 번호를 int로 변경
		service.noticeInfo(model, num);
		return "Cs/cs_noticeInfo";
	}
	
	
	@RequestMapping(value = "qnaInfo")
	public String qnaInfo(HttpServletRequest req, Model model, HttpServletResponse resp) throws IOException {
		resp.setContentType("text/html; charset=utf-8"); // 응답 설정 변경
		PrintWriter out = resp.getWriter(); // 화면 출력용 객체
		HttpSession session = req.getSession();
		MemberDTO userDto = (MemberDTO) session.getAttribute("loginUser");
		if(userDto == null) {
			return "error/loginError";
		}
		String parameterNum = req.getParameter("num"); // 게시글 번호를 받아옴
		if(parameterNum == null) { // 게시글 번호가 없다면 잘못된 접근임
			return "error/accessError";
		}
		int num = Integer.parseInt(parameterNum); // 게시글 번호를 int로 변경
		QnaDTO dto = service2.qnaInfo(num);
		if(dto == null) {
			return "error/accessError";
		}
		if(!(dto.getQuestionId().equals(userDto.getId()))) {
			if(!(userDto.getId().equals("3333"))) {
				return "error/accessError";
			}
		}
		model.addAttribute("qna", dto);
		return "Cs/cs_qnaInfo";
	}
	
	
	
	
	
	
	@RequestMapping(value = "noticeDelete", method=RequestMethod.POST)
	public void infoDelete(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		resp.setContentType("text/html; charset=utf-8"); // 응답 설정 변경
		PrintWriter out = resp.getWriter(); // 화면 출력용 객체
		String numstr = req.getParameter("num");
		if(numstr == null) {
			out.print("<script> alert('잘못된 접근입니다.');location.href='csMain';</script>");
		} else {
			int num = Integer.parseInt(numstr);
			int result = service.noticeDelete(num);
			
			if(result == 0) {
				out.print("<script> alert('게시글 삭제에 실패했습니다.');location.href='csMain';</script>");
			} else {
				out.print("<script> alert('게시글이 삭제되었습니다.');location.href='csMain';</script>");
				
			}
		}
		
	}
	
	
	@RequestMapping(value = "qnaDelete", method=RequestMethod.POST)
	public void qnaDelete(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		resp.setContentType("text/html; charset=utf-8"); // 응답 설정 변경
		PrintWriter out = resp.getWriter(); // 화면 출력용 객체
		String numstr = req.getParameter("num");
		if(numstr == null) {
			out.print("<script> alert('잘못된 접근입니다.');location.href='csMain';</script>");
		} else {
			int num = Integer.parseInt(numstr);
			int result = service2.qnaDelete(num);
			
			if(result == 0) {
				out.print("<script> alert('질문글 삭제에 실패했습니다.');location.href='csMain';</script>");
			} else {
				out.print("<script> alert('질문글이 삭제되었습니다.');location.href='csMain';</script>");
				
			}
		}
		
	}
	
	@RequestMapping(value = "noticeModifyForm", method=RequestMethod.POST)
	public String noticeModifyForm(HttpServletRequest req, HttpServletResponse resp, Model model) throws IOException {
		resp.setContentType("text/html; charset=utf-8"); // 응답 설정 변경
		PrintWriter out = resp.getWriter(); // 화면 출력용 객체
		String numstr = req.getParameter("num");
		if(numstr == null) {
			out.print("<script> alert('잘못된 접근입니다.');</script>");
			return "redirect:csMain";
		} else {
			int num = Integer.parseInt(numstr);
			service.noticeInfo(model, num);
			return "Cs/cs_noticeModify";
		}
	}
	
	@RequestMapping(value="noticeModify", method=RequestMethod.POST)
	public void noticeModify(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		resp.setContentType("text/html; charset=utf-8"); // 응답 설정 변경
		PrintWriter out = resp.getWriter(); // 화면 출력용 객체
		int result = service.noticeModify(req);
		if(result == 0) {
			out.print("<script> alert('공지 수정에 실패했습니다.');location.href='csMain';</script>");
		} else {
			out.print("<script> alert('공지 수정이 완료되었습니다.');location.href='csMain';</script>");
		}
	}
	
	@RequestMapping(value="test")
	public String test() {
		return "test/Test";
	}
	
	@RequestMapping(value="test2")
	public String test2() {
		return "test/Test2";
	}
	
	@RequestMapping(value = "qnaModifyForm", method=RequestMethod.POST)
	public String qnaModifyForm(HttpServletRequest req, HttpServletResponse resp, Model model) throws IOException {
		resp.setContentType("text/html; charset=utf-8"); // 응답 설정 변경
		PrintWriter out = resp.getWriter(); // 화면 출력용 객체
		String numstr = req.getParameter("num");
		if(numstr == null) {
			out.print("<script> alert('잘못된 접근입니다.');</script>");
			return "redirect:csMain";
		} else {
			int num = Integer.parseInt(numstr);
			service.noticeInfo(model, num);
			return "Cs/cs_qnaModify";
		}
	}
	
	@RequestMapping(value="qnaModify", method=RequestMethod.POST)
	public void qnaModify(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		resp.setContentType("text/html; charset=utf-8"); // 응답 설정 변경
		PrintWriter out = resp.getWriter(); // 화면 출력용 객체
		int result = service2.qnaModify(req);
		if(result == 0) {
			out.print("<script> alert('공지 수정에 실패했습니다.');location.href='csMain';</script>");
		} else {
			out.print("<script> alert('공지 수정이 완료되었습니다.');location.href='csMain';</script>");
		}
	}
	

	
	
	
	
}
