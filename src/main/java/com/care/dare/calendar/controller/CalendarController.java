package com.care.dare.calendar.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.care.dare.calendar.dto.CalendarDTO;
import com.care.dare.calendar.service.CalendarService;
import com.care.dare.join.controller.MemberDTO;

@Controller
public class CalendarController {
	@Autowired
	CalendarService service;

	@RequestMapping("/calendar")
	public String viewCalendar() {
		return"calendar/calendar";
	}
	
	@GetMapping(value = "/ajaxCal.do")
	@ResponseBody
	public JSONArray readDB(HttpServletRequest req, Model model) throws Exception {
		HttpSession session = req.getSession();
	
		MemberDTO dto = (MemberDTO) session.getAttribute("loginUser");
		service.readForCalendar(model, dto.getId());
		
		@SuppressWarnings("unchecked")
		ArrayList<CalendarDTO> dataList = (ArrayList<CalendarDTO>) model.getAttribute("calendarData");
		JSONArray jArray = new JSONArray();
		SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy-MM-dd");
		
		for(CalendarDTO data : dataList) {
			
			JSONObject jsonObj = new JSONObject();
			jsonObj.put("title", data.getTitle());
			String indateStr = simpleDate.format( data.getIndate() );
			jsonObj.put("indate", indateStr);
			String outdateStr = simpleDate.format( data.getOutdate() );
			jsonObj.put("outdate", outdateStr);
			jsonObj.put("location1",data.getLocation1());
			jArray.add(jsonObj);
		}
		
		return jArray;
	}
}
