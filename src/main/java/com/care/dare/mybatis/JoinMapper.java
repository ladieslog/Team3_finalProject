package com.care.dare.mybatis;

import java.util.ArrayList;

import com.care.dare.join.controller.MemberDTO;

public interface JoinMapper {
	public MemberDTO idcheck(String id);
	public int resister(MemberDTO dto);
	public MemberDTO loginproc(MemberDTO dto);
	public ArrayList<MemberDTO>memberList();
	public MemberDTO myHome(String id);
	public int myUpdate(MemberDTO dto);
	public int accountDelete(String id);
}
