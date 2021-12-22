package com.care.dare.CS.Service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.care.dare.CS.DTO.QnaDTO;
import com.care.dare.mybatis.CSMapper;

@Service
public class CSService2 {
	@Autowired
	CSMapper mapper;
	public  int QnaWrite(HttpServletRequest requ) {
		QnaDTO dto= new QnaDTO();
		return 0;
		
	}
	
}
