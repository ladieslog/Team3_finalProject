package com.care.dare.calendar.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;

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
	public String viewCalendar(HttpServletRequest req) {
		HttpSession session = req.getSession();
		
		if (session.getAttribute("loginUser") == null) {
			return "error/loginError";
		}
		return "calendar/calendar";
	}

	@GetMapping(value = "/ajaxCal.do")
	@ResponseBody
	public JSONArray readDB(HttpServletRequest req, Model model) throws Exception {

		HttpSession session = req.getSession();
		MemberDTO dto = (MemberDTO) session.getAttribute("loginUser");
		service.readForCalendar(model, dto.getId());

		ArrayList<CalendarDTO> dataList = (ArrayList<CalendarDTO>) model.getAttribute("calendarData");
		SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy-MM-dd");
		JSONArray jArray = new JSONArray();

		for (CalendarDTO data : dataList) {

			JSONObject jsonObj = new JSONObject();

			jsonObj.put("num", data.getNum());

			jsonObj.put("title", data.getTitle());

			String indateStr = simpleDate.format(data.getIndate());
			jsonObj.put("start", indateStr);

			String outdateStr = null;
			Calendar cal = Calendar.getInstance();
			cal.setTime(data.getOutdate());
			cal.add(Calendar.DATE, 1);
			outdateStr = simpleDate.format(cal.getTime());
			jsonObj.put("end", outdateStr);

			jsonObj.put("location", data.getLocation1());

			if (Integer.parseInt(data.getPerson()) == 1) {	// red
				jsonObj.put("color", "#F15F5F");
			} 
			
			else if (Integer.parseInt(data.getPerson()) == 2) {	//green
				jsonObj.put("color", "#BCE55C");
			} 
			
			else if (Integer.parseInt(data.getPerson()) == 3) {	// purple
				jsonObj.put("color", "#6B66FF");
			}
			
			else {	// yellow
				jsonObj.put("color", "#F2CB61");	
			}

			jArray.add(jsonObj);
		}

		return jArray;
	}
}
