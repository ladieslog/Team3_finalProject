package com.care.dare.calendar.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.care.dare.calendar.dto.CalendarDTO;
import com.care.dare.calendar.service.CalendarService;
import com.care.dare.join.controller.MemberDTO;

@Controller
public class CalendarController {
	@Autowired CalendarService service;
	
	@RequestMapping("/calendar")
	public String viewCalendar(HttpServletRequest req, Model model) throws Exception {
		HttpSession session = req.getSession();

		MemberDTO dto = (MemberDTO) session.getAttribute("loginUser");
		service.readForCalendar(model, dto.getId());
		
		ArrayList<CalendarDTO> test = (ArrayList<CalendarDTO>) model.getAttribute("calendarData");
		
		for(CalendarDTO tete : test) {
			System.out.println(tete.getTitle());
		}
		
		return "calendar/calendar";
	}
}
