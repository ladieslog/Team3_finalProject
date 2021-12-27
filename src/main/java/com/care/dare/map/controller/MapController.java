package com.care.dare.map.controller;

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

import com.care.dare.join.controller.MemberDTO;
import com.care.dare.map.dto.MapDTO;
import com.care.dare.map.service.MapService;

@Controller
public class MapController {
	@Autowired
	MapService service;

	@RequestMapping("/map")
	public String viewMap() {
		return"map/map";
	}

	@GetMapping(value = "/ajaxMap.do")
	@ResponseBody
	public JSONArray readDB(HttpServletRequest req, Model model) throws Exception {
		HttpSession session = req.getSession();
		
		MemberDTO dto = (MemberDTO) session.getAttribute("loginUser");
		service.readForMap(model, dto.getId());
		
		@SuppressWarnings("unchecked")
		ArrayList<MapDTO> dataList = (ArrayList<MapDTO>) model.getAttribute("mapData");
		SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy-MM-dd");
		JSONArray jArray = new JSONArray();
		
		
		for(MapDTO data : dataList) {
			
			JSONObject jsonObj = new JSONObject();
			
			jsonObj.put("num", data.getNum());
			
			jsonObj.put("title", data.getTitle());
			
			jsonObj.put("person", data.getPerson());
			
			String indateStr = simpleDate.format( data.getIndate() );
			jsonObj.put("start", indateStr);
			String outdateStr = simpleDate.format( data.getOutdate() );
			jsonObj.put("end", outdateStr);
			
			jsonObj.put("id", data.getId());
			
			jsonObj.put("location1",data.getLocation1());
			jsonObj.put("location2",data.getLocation2());
			jsonObj.put("location3",data.getLocation3());
			
			jsonObj.put("image",data.getImage1());
			
			jArray.add(jsonObj);
		}
		
		return jArray;
	}
}
