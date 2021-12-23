package com.care.dare.mybatis;

import com.care.dare.calendar.dto.CalendarDTO;

public interface CalendarMapper {
	public CalendarDTO readForCalendar(String id);
}
