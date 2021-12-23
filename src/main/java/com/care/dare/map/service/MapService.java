package com.care.dare.map.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.care.dare.map.dto.MapDTO;
import com.care.dare.mybatis.MapMapper;

@Service
public class MapService implements MapServiceImpl{
	@Autowired MapMapper mapper;
	MapDTO dto;
	@Override
	public MapDTO readForMap(String id) {
		MapDTO dto= mapper.readForMap(id);
		return dto;
	}
}
