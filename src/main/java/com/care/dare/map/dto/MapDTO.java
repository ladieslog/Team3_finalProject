package com.care.dare.map.dto;

import java.io.FileInputStream;

import org.springframework.stereotype.Component;

@Component
public class MapDTO implements MapDTOImpl{
	private int num;
	private String title;
	
	private String location1;
	private String location2;
	private String location3;
	
	private String coment1;
	
	private byte[] image1;
	
	FileInputStream fis1;
}
