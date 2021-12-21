package com.care.dare.mybatis;

import com.care.dare.join.controller.MemberDTO;

public interface JoinMapper {
	public MemberDTO idcheck(String id);
	public int resister(MemberDTO dto);
}
