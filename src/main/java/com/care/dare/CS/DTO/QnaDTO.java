package com.care.dare.CS.DTO;

import java.sql.Timestamp;

public class QnaDTO {
	int num;
	String questionTitle;
	String questionContent;
	String questionId;
	Timestamp questionTime;
	String answerContent;
	Timestamp answerTime;
	String status;
	String questionTimeStr;
	String answerTimeStr;
	String statusStr;
	
	public String getStatusStr() {
		return statusStr;
	}
	public void setStatusStr(String statusStr) {
		this.statusStr = statusStr;
	}
	public String getQuestionTimeStr() {
		return questionTimeStr;
	}
	public void setQuestionTimeStr(String questionTimeStr) {
		this.questionTimeStr = questionTimeStr;
	}
	public String getAnswerTimeStr() {
		return answerTimeStr;
	}
	public void setAnswerTimeStr(String answerTimeStr) {
		this.answerTimeStr = answerTimeStr;
	}
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

	public String getQuestionContent() {
		return questionContent;
	}
	public void setQuestionContent(String questionContent) {
		this.questionContent = questionContent;
	}
	public String getAnswerContent() {
		return answerContent;
	}
	public void setAnswerContent(String answerContent) {
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
	
}
