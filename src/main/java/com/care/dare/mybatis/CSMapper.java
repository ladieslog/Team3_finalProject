package com.care.dare.mybatis;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.care.dare.CS.DTO.NoticeDTO;

public interface CSMapper {
	public int noticeWrite(NoticeDTO dto);
	public ArrayList<NoticeDTO> noticeBoard(@Param("s") int startRow, @Param("e") int endRow);
	public int noticeCount();
	public NoticeDTO noticeInfo(int num);
	public int noticeDelete(int num);
	public int noticeModify(NoticeDTO dto);
	public int noticeHit(int num);
}

