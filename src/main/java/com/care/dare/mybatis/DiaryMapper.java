package com.care.dare.mybatis;

import java.io.FileInputStream;
import java.util.ArrayList;

import com.care.dare.diary.dto.DiaryDTO;

public interface DiaryMapper {
	public int writeSave(DiaryDTO dto);
	public ArrayList<DiaryDTO> diaryList();
}
