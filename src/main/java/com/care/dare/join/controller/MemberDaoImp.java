package com.care.dare.join.controller ;

import javax.servlet.http.HttpSession; 
import org.mybatis.spring.SqlSessionTemplate;

import dao.MemberDao;
import com.care.dare.join.controller.*;

public abstract class MemberDaoImp implements MemberDao { 
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
