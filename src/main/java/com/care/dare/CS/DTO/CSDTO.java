package com.care.dare.CS.DTO;

import java.sql.Timestamp;

public class CSDTO {
	
	public int num1;
	public String questionTitle;
	public byte[] questionContent;
	public String questionId;
	public Timestamp questionTime;
	public byte[] answerContent;
	public Timestamp answerTime;
	public String status;
	
	public int num2;
	public String title;
	public byte[] content;
	public Timestamp time;
	
	
	public int getNum1() {
		return num1;
	}
	public void setNum1(int num1) {
		this.num1 = num1;
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
		return answerContent;
	}
	public void setAnswerContent(byte[] answerContent) {
		this.answerContent = answerContent;
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
	public int getNum2() {
		return num2;
	}
	public void setNum2(int num2) {
		this.num2 = num2;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public byte[] getContent() {
		return content;
	}
	public void setContent(byte[] content) {
		this.content = content;
	}
	public Timestamp getTime() {
		return time;
	}
	public void setTime(Timestamp time) {
		this.time = time;
	}

}
