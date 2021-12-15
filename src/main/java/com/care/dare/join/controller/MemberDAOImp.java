package com.care.dare.join.controller ;

import javax.servlet.http.HttpSession; 
import org.mybatis.spring.SqlSessionTemplate; 
import dto.MemberDTO; 

public class MemberDaoImp implements MemberDAO { 
	private SqlSessionTemplate sqlSession; 
	public MemberDaoImp() { 
		
	} 
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession; 
		} 
	@Override 
	public void memberJoinMethod(MemberDTO dto) { 
		sqlSession.insert("member.join", dto);
		} 
	}
