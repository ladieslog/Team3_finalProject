package com.care.dare.mybatis;

import java.io.FileInputStream;
import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.care.dare.diary.dto.DiaryDTO;


public interface DiaryMapper {
	
	public int writeSave(DiaryDTO dto);
	public ArrayList<DiaryDTO> diaryBoard(@Param("s")int start, @Param("e")int end);
	public int diaryCount();
	public DiaryDTO diaryView(int num);
	public void diaryDelete(int num);
	public int writeUpdate(DiaryDTO dto);
}
