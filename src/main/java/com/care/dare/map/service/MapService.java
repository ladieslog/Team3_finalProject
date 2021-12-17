package com.care.dare.map.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.care.dare.map.dao.MapDao;

@Service
public class MapService implements MapServiceImpl{
	@Autowired
	MapDao dao;
}
