package com.care.dare.map.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.care.dare.join.controller.MemberDTO;
import com.care.dare.map.dto.MapDTO;
import com.care.dare.map.service.MapService;

@Controller
public class MapController {
	@Autowired MapService service;
	
	@RequestMapping("/map")
	public String viewMap(HttpServletRequest req, Model model) throws Exception {
		HttpSession session = req.getSession();
		
		MemberDTO dto = (MemberDTO) session.getAttribute("loginUser");
		service.readForMap(model, dto.getId());
		
		ArrayList<MapDTO> test = (ArrayList<MapDTO>) model.getAttribute("mapData");
				
		for(MapDTO tete : test) {
			System.out.println(tete.getTitle());
		}
				 
		return "map/map";
	}
}
