package com.care.dare.map.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.care.dare.map.dto.MapDTO;
import com.care.dare.mybatis.MapMapper;

@Service
public class MapService implements MapServiceImpl{
	@Autowired MapMapper mapper;
	MapDTO dto = new MapDTO();
	
	public void readForMap(Model model, String id) {
		ArrayList<MapDTO> dto= mapper.readForMap(id);
		model.addAttribute("mapData",dto);
	}
}