package com.care.dare.join.controller ;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MemberDTO {
   private String id;
   private String pwd;
   private String nickname;
   private String email;
   private String addr;
   private int diaryCount;
   private int mailnumber;
   private String detailaddr;
   
public int getMailnumber() {
	return mailnumber;
}
public void setMailnumber(int mailnumber) {
	this.mailnumber = mailnumber;
}
public String getDetailaddr() {
	return detailaddr;
}
public void setDetailaddr(String detailaddr) {
	this.detailaddr = detailaddr;
}
public int getDiaryCount() {
	return diaryCount;
}
public void setDiaryCount(int diaryCount) {
	this.diaryCount = diaryCount;
}
public String getId() {
	return id;
}
public void setId(String id) {
	this.id = id;
}
public String getPwd() {
	return pwd;
}
public void setPwd(String pwd) {
	this.pwd = pwd;
}
public String getNickname() {
	return nickname;
}
public void setNickname(String nickname) {
	this.nickname = nickname;
}
public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}
public String getAddr() {
	return addr;
}
public void setAddr(String addr) {
	this.addr = addr;
}
   
   
}
