package com.care.dare.mybatis;

import java.io.FileInputStream;

import com.care.dare.diary.dto.DiaryDTO;

public interface DiaryMapper {
	public int writeSave(DiaryDTO dto);
}
