package com.care.dare.mybatis;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.care.dare.CS.DTO.QnaDTO;

public interface QnaMapper {
	public ArrayList<QnaDTO> list2();
	
	public ArrayList<QnaDTO> userList(String id);

	public int qnaWrite(QnaDTO dto);

	public int qnaCount();
	
	public int userQnaCount(String id);
	
	public ArrayList<QnaDTO> qnaBoard(@Param("s") int startRow, @Param("e") int endRow);
	
	public ArrayList<QnaDTO> userQnaBoard(@Param("s") int startRow, @Param("e") int endRow, @Param("id") String id);
	
	public QnaDTO qnaInfo(int num);
	
	public int qnaDelete(int num);

	public int qnaModify(QnaDTO dto);
	
	public int answerWrite(QnaDTO dto);
	
}
