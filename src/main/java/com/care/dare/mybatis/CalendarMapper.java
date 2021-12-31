package com.care.dare.mybatis;

import java.util.ArrayList;

import com.care.dare.calendar.dto.CalendarDTO;

public interface CalendarMapper {
	public ArrayList<CalendarDTO> readForCalendar(String id);
}