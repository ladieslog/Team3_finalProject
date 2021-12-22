package com.care.dare.CS.DTO;

import java.sql.Timestamp;

public class QnaDTO {
	int num;
	String questionTitle;
	byte[] questionContent;
	String questionId;
	Timestamp questionTime;
	byte[] AnswerContent;
	Timestamp answerTime;
	String status;
	
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getQuestionTitle() {
		return questionTitle;
	}
	public void setQuestionTitle(String questionTitle) {
		this.questionTitle = questionTitle;
	}
	public byte[] getQuestionContent() {
		return questionContent;
	}
	public void setQuestionContent(byte[] questionContent) {
		this.questionContent = questionContent;
	}
	public String getQuestionId() {
		return questionId;
	}
	public void setQuestionId(String questionId) {
		this.questionId = questionId;
	}
	public Timestamp getQuestionTime() {
		return questionTime;
	}
	public void setQuestionTime(Timestamp questionTime) {
		this.questionTime = questionTime;
	}
	public byte[] getAnswerContent() {
		return AnswerContent;
	}
	public void setAnswerContent(byte[] answerContent) {
		AnswerContent = answerContent;
	}
	public Timestamp getAnswerTime() {
		return answerTime;
	}
	public void setAnswerTime(Timestamp answerTime) {
		this.answerTime = answerTime;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
}
