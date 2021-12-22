package com.care.dare.CS.DTO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Timestamp;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class CSDAO {
	DataSource dataSource;
	public CSDAO() {
		try { 
			InitialContext initContext =new InitialContext();
			Context envContext =(Context) initContext.lookup("java:/comp/env");
			dataSource = (DataSource) envContext.lookup("jdbc/UserChat");
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
/*	public double register(int num1, String questTitle, byte[] questionContent,
			String questionId, Timestamp questionTime, byte[] answerContent,
			Timestamp answerTime, String status) {
		Connection conn =null;
		PreparedStatement pstmt =null;
//		String SQL = "INSERT INTO CUSTOMER_SERVICE SELECT 
		try {
			conn =dataSource.getConnection();
//			pstmt =conn.prepareStatement(SQL);
			pstmt.setInt(1, num1);
			pstmt.setString(2, questTitle);
			pstmt.setBytes(3, questionContent);
			pstmt.setString(4, questionId);
			pstmt.setTimestamp(5, questionTime);
			pstmt.setBytes(6,answerContent);
			pstmt.setTimestamp(7, answerTime);
			pstmt.setString(7,status);
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt !=null) pstmt.close();
				if(conn!=null) conn.close();
				
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		return -1;	
	}
		
	public getCs(String  )
	*/
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
