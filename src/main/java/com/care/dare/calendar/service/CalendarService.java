package com.care.dare.calendar.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.care.dare.calendar.dto.CalendarDTO;
import com.care.dare.mybatis.CalendarMapper;

@Service
public class CalendarService implements CalendarServiceImpl{
	@Autowired CalendarMapper mapper;
	CalendarDTO dto;
	@Override
	public CalendarDTO readForCalendar(String id) {
		CalendarDTO dto= mapper.readForCalendar(id);
		return dto;
	}
	
}
