package com.care.dare.mybatis;

import java.util.ArrayList;

import com.care.dare.CS.DTO.QnaDTO;

public interface QnaMapper {
		public ArrayList<QnaDTO> list2();
		public int qnaWrite(QnaDTO dto );
		
}
