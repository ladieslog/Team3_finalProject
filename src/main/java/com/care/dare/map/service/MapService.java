package com.care.dare.map.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.care.dare.map.dto.MapDTO;

@Service
public class MapService implements MapServiceImpl{
	@Autowired
	MapDTO dto;
}
