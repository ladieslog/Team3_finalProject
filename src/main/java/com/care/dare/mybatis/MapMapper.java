package com.care.dare.mybatis;

import java.util.ArrayList;

import com.care.dare.map.dto.MapDTO;

public interface MapMapper {
	public ArrayList<MapDTO> readForMap(String id);
}
