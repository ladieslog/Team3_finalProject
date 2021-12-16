package com.care.dare.diary.dto;

import java.io.FileInputStream;
import java.sql.Timestamp;

public class DiaryDTO {
	private int num;
	private String title;
	private String person;
	private String id;
	private String location1;
	private String location2;
	private String location3;
	private Timestamp time;
	private Timestamp indate;
	private Timestamp outdate;
	private String coment1;
	private String coment2;
	private String coment3;
	private String coment4;
	private String coment5;
	private byte[] image1;
	private byte[] image2;
	private byte[] image3;
	private byte[] image4;
	private byte[] image5;
	FileInputStream fis1;
	FileInputStream fis2;
	FileInputStream fis3;
	FileInputStream fis4;
	FileInputStream fis5;
	private String indatestr;
	private String outdatestr;
	public String getIndatestr() {
		return indatestr;
	}
	public void setIndatestr(String indatestr) {
		this.indatestr = indatestr;
	}
	public String getOutdatestr() {
		return outdatestr;
	}
	public void setOutdatestr(String outdatestr) {
		this.outdatestr = outdatestr;
	}
	public FileInputStream getFis1() {
		return fis1;
	}
	public void setFis1(FileInputStream fis1) {
		this.fis1 = fis1;
	}
	public FileInputStream getFis2() {
		return fis2;
	}
	public void setFis2(FileInputStream fis2) {
		this.fis2 = fis2;
	}
	public FileInputStream getFis3() {
		return fis3;
	}
	public void setFis3(FileInputStream fis3) {
		this.fis3 = fis3;
	}
	public FileInputStream getFis4() {
		return fis4;
	}
	public void setFis4(FileInputStream fis4) {
		this.fis4 = fis4;
	}
	public FileInputStream getFis5() {
		return fis5;
	}
	public void setFis5(FileInputStream fis5) {
		this.fis5 = fis5;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getPerson() {
		return person;
	}
	public void setPerson(String person) {
		this.person = person;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getLocation1() {
		return location1;
	}
	public void setLocation1(String location1) {
		this.location1 = location1;
	}
	public String getLocation2() {
		return location2;
	}
	public void setLocation2(String location2) {
		this.location2 = location2;
	}
	public String getLocation3() {
		return location3;
	}
	public void setLocation3(String location3) {
		this.location3 = location3;
	}
	public Timestamp getTime() {
		return time;
	}
	public void setTime(Timestamp time) {
		this.time = time;
	}
	public Timestamp getIndate() {
		return indate;
	}
	public void setIndate(Timestamp indate) {
		this.indate = indate;
	}
	public Timestamp getOutdate() {
		return outdate;
	}
	public void setOutdate(Timestamp outdate) {
		this.outdate = outdate;
	}
	public String getComent1() {
		return coment1;
	}
	public void setComent1(String coment1) {
		this.coment1 = coment1;
	}
	public String getComent2() {
		return coment2;
	}
	public void setComent2(String coment2) {
		this.coment2 = coment2;
	}
	public String getComent3() {
		return coment3;
	}
	public void setComent3(String coment3) {
		this.coment3 = coment3;
	}
	public String getComent4() {
		return coment4;
	}
	public void setComent4(String coment4) {
		this.coment4 = coment4;
	}
	public String getComent5() {
		return coment5;
	}
	public void setComent5(String coment5) {
		this.coment5 = coment5;
	}
	public byte[] getImage1() {
		return image1;
	}
	public void setImage1(byte[] image1) {
		this.image1 = image1;
	}
	public byte[] getImage2() {
		return image2;
	}
	public void setImage2(byte[] image2) {
		this.image2 = image2;
	}
	public byte[] getImage3() {
		return image3;
	}
	public void setImage3(byte[] image3) {
		this.image3 = image3;
	}
	public byte[] getImage4() {
		return image4;
	}
	public void setImage4(byte[] image4) {
		this.image4 = image4;
	}
	public byte[] getImage5() {
		return image5;
	}
	public void setImage5(byte[] image5) {
		this.image5 = image5;
	}
	
}