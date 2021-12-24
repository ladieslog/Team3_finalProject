package com.care.dare.calendar.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.care.dare.calendar.dto.CalendarDTO;
import com.care.dare.mybatis.CalendarMapper;

@Service
public class CalendarService implements CalendarServiceImpl{
	@Autowired CalendarMapper mapper;
	CalendarDTO dto = new CalendarDTO(); 

	public void readForCalendar(Model model, String id) {
		ArrayList<CalendarDTO> dto= mapper.readForCalendar(id);
		model.addAttribute("calendarData",dto);
	}
	
}
