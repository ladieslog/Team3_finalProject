package com.care.dare.diary.diaryService;

import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.care.dare.diary.dto.DiaryDTO;
import com.care.dare.mybatis.DiaryMapper;


@Service
public class DiaryService {
	@Autowired DiaryMapper mapper;
	public void writeSave(MultipartHttpServletRequest mul) throws Exception {	// 다이어리 작성 DB 저장
		DiaryDTO dto = new DiaryDTO();
		dto.setId("3333");	
		System.out.println(mul.getParameter("indate"));
		SimpleDateFormat sm = new SimpleDateFormat("yyyy-MM-dd");
		Date date1 = null;
		Date date2 = null;		
		try {
			date1 = new Date(sm.parse(mul.getParameter("indate")).getTime());
			date2 = new Date(sm.parse(mul.getParameter("outdate")).getTime());
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Timestamp indate = new Timestamp(date1.getTime());
		Timestamp outdate = new Timestamp(date2.getTime());
		dto.setIndate(indate);
		dto.setOutdate(outdate);
		
		dto.setTitle(mul.getParameter("title"));

		dto.setLocation1(mul.getParameter("place1"));
		if(mul.getParameter("place2").equals("")) {
			dto.setLocation2(null);
		}else {
			dto.setLocation2(mul.getParameter("place2"));
		}
		if(mul.getParameter("place3").equals("")) {
			dto.setLocation3(null);
		}else {
			dto.setLocation3(mul.getParameter("place3"));
		}
		dto.setPerson(mul.getParameter("who"));
		
		FileInputStream fis1 = null;
		FileInputStream fis2 = null;
		FileInputStream fis3 = null;
		FileInputStream fis4 = null;
		FileInputStream fis5 = null;
		
		if(mul.getParameter("coment1").equals("")) {
			if(!mul.getFile("image_file_name1").isEmpty()) {
				File file = multitofile(mul.getFile("image_file_name1"));
				dto.setImage1(Files.readAllBytes(file.toPath()));
				dto.setComent1(mul.getParameter("comentimage1"));
				dto.setFis1(new FileInputStream(file)); 
			}else {
				dto.setComent1(null);
				dto.setImage1(null);
			}
		}else {
			dto.setComent1(mul.getParameter("coment1"));
			dto.setImage1(null);
		}
		
		if(mul.getParameter("coment2").equals("")) {
			if(!mul.getFile("image_file_name2").isEmpty()) {
				File file = multitofile(mul.getFile("image_file_name2"));
				dto.setImage2(Files.readAllBytes(file.toPath()));
				dto.setComent2(mul.getParameter("comentimage2"));
				dto.setFis2(new FileInputStream(file)); 
			}else {
				dto.setComent2(null);
				dto.setImage2(null);
			}
		}else {
			dto.setComent2(mul.getParameter("coment2"));
			dto.setImage2(null);
		}
		
		if(mul.getParameter("coment3").equals("")) {
			if(!mul.getFile("image_file_name3").isEmpty()) {
				File file = multitofile(mul.getFile("image_file_name3"));
				dto.setImage3(Files.readAllBytes(file.toPath()));
				dto.setComent3(mul.getParameter("comentimage3"));
				dto.setFis3(new FileInputStream(file)); 
			}else {
				dto.setComent3(null);
				dto.setImage3(null);
			}
		}else {
			dto.setComent3(mul.getParameter("coment3"));
			dto.setImage3(null);
		}
		
		if(mul.getParameter("coment4").equals("")) {
			if(!mul.getFile("image_file_name4").isEmpty()) {
				File file = multitofile(mul.getFile("image_file_name4"));
				dto.setImage4(Files.readAllBytes(file.toPath()));
				dto.setComent4(mul.getParameter("comentimage4"));
				dto.setFis4(new FileInputStream(file)); 
			}else {
				dto.setComent4(null);
				dto.setImage4(null);
			}
		}else {
			dto.setComent4(mul.getParameter("coment4"));
			dto.setImage4(null);
		}
		
		if(mul.getParameter("coment5").equals("")) {
			if(!mul.getFile("image_file_name5").isEmpty()) {
				File file = multitofile(mul.getFile("image_file_name5"));
				dto.setImage5(Files.readAllBytes(file.toPath()));
				dto.setComent5(mul.getParameter("comentimage5"));
				dto.setFis5(new FileInputStream(file)); 
			}else {
				dto.setComent5(null);
				dto.setImage5(null);
			}
		}else {
			dto.setComent5(mul.getParameter("coment5"));
			dto.setImage5(null);
		}
		mapper.writeSave(dto);
	}

	public File multitofile(MultipartFile mfile) throws Exception {		// 다이어리 작성 이미지 저장 변환
		File file = new File(mfile.getOriginalFilename());
		file.createNewFile();
		FileOutputStream fos = new FileOutputStream(file);
		fos.write(mfile.getBytes());
		fos.close();
		return file;
	}
	
	public ArrayList<DiaryDTO> diaryBoard(int start, int end) {
		return mapper.diaryBoard(start, end);
	}
	
	public int diaryCount() {
		return mapper.diaryCount();
	}

	public void diaryView(Model model, int num) throws Exception {
		DiaryDTO dto = mapper.diaryView(num);
		SimpleDateFormat sim = new SimpleDateFormat("yyyy-MM-dd");
		dto.setIndatestr(sim.format(dto.getIndate()));
		dto.setOutdatestr(sim.format(dto.getOutdate()));
		
		if(dto.getImage1() != null) {
			imgFile(dto.getImage1(),1);
		}
		if(dto.getImage2() != null) {
			imgFile(dto.getImage2(),2);
		}
		if(dto.getImage3() != null) {
			imgFile(dto.getImage3(),3);
		}
		if(dto.getImage4() != null) {
			imgFile(dto.getImage4(),4);
		}
		if(dto.getImage5() != null) {
			imgFile(dto.getImage5(),5);
		}
		
		model.addAttribute("diary",dto);
	}
	
	public void imgFile(byte[] bt,int count) throws Exception {
		File file = new File("C:/spring/diaryView/"+count+".png");
		FileOutputStream fos = new FileOutputStream(file);
		DataOutputStream stream = new DataOutputStream(fos);
		stream.write(bt); 
		stream.flush();
		fos.getFD().sync();
		stream.close();
		count++;
	}
	
	public void diaryDelete(int num) {
		mapper.diaryDelete(num);
	}
	
	public void diaryModify(int num,Model model) throws Exception {
		DiaryDTO dto = mapper.diaryView(num);
		if(dto.getImage1() != null) {
			imgFile(dto.getImage1(),1);
		}
		if(dto.getImage2() != null) {
			imgFile(dto.getImage2(),2);
		}
		if(dto.getImage3() != null) {
			imgFile(dto.getImage3(),3);
		}
		if(dto.getImage4() != null) {
			imgFile(dto.getImage4(),4);
		}
		if(dto.getImage5() != null) {
			imgFile(dto.getImage5(),5);
		}
		model.addAttribute("diary",dto);
		
	}
	
	public void writeUpdate(MultipartHttpServletRequest mul) throws Exception {	// 다이어리 작성 업데이트 DB 저장
		DiaryDTO dto = new DiaryDTO();
		dto.setId("3333");	
		
		dto.setNum(Integer.parseInt(mul.getParameter("num")));
		System.out.println(mul.getParameter("indate"));
		SimpleDateFormat sm = new SimpleDateFormat("yyyy-MM-dd");
		Date date1 = null;
		Date date2 = null;		
		try {
			date1 = new Date(sm.parse(mul.getParameter("indate")).getTime());
			date2 = new Date(sm.parse(mul.getParameter("outdate")).getTime());
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Timestamp indate = new Timestamp(date1.getTime());
		Timestamp outdate = new Timestamp(date2.getTime());
		dto.setIndate(indate);
		dto.setOutdate(outdate);
		
		dto.setTitle(mul.getParameter("title"));

		dto.setLocation1(mul.getParameter("place1"));
		if(mul.getParameter("place2").equals("")) {
			dto.setLocation2(null);
		}else {
			dto.setLocation2(mul.getParameter("place2"));
		}
		if(mul.getParameter("place3").equals("")) {
			dto.setLocation3(null);
		}else {
			dto.setLocation3(mul.getParameter("place3"));
		}
		dto.setPerson(mul.getParameter("who"));
		
		FileInputStream fis1 = null;
		FileInputStream fis2 = null;
		FileInputStream fis3 = null;
		FileInputStream fis4 = null;
		FileInputStream fis5 = null;
		
		if(mul.getParameter("coment1").equals("")) {
			if(!mul.getFile("image_file_name1").isEmpty()) {
				File file = multitofile(mul.getFile("image_file_name1"));
				dto.setImage1(Files.readAllBytes(file.toPath()));
				dto.setComent1(mul.getParameter("comentimage1"));
				dto.setFis1(new FileInputStream(file)); 
			}else {
				dto.setComent1(null);
				dto.setImage1(null);
			}
		}else {
			dto.setComent1(mul.getParameter("coment1"));
			dto.setImage1(null);
		}
		
		if(mul.getParameter("coment2").equals("")) {
			if(!mul.getFile("image_file_name2").isEmpty()) {
				File file = multitofile(mul.getFile("image_file_name2"));
				dto.setImage2(Files.readAllBytes(file.toPath()));
				dto.setComent2(mul.getParameter("comentimage2"));
				dto.setFis2(new FileInputStream(file)); 
			}else {
				dto.setComent2(null);
				dto.setImage2(null);
			}
		}else {
			dto.setComent2(mul.getParameter("coment2"));
			dto.setImage2(null);
		}
		
		if(mul.getParameter("coment3").equals("")) {
			if(!mul.getFile("image_file_name3").isEmpty()) {
				File file = multitofile(mul.getFile("image_file_name3"));
				dto.setImage3(Files.readAllBytes(file.toPath()));
				dto.setComent3(mul.getParameter("comentimage3"));
				dto.setFis3(new FileInputStream(file)); 
			}else {
				dto.setComent3(null);
				dto.setImage3(null);
			}
		}else {
			dto.setComent3(mul.getParameter("coment3"));
			dto.setImage3(null);
		}
		
		if(mul.getParameter("coment4").equals("")) {
			if(!mul.getFile("image_file_name4").isEmpty()) {
				File file = multitofile(mul.getFile("image_file_name4"));
				dto.setImage4(Files.readAllBytes(file.toPath()));
				dto.setComent4(mul.getParameter("comentimage4"));
				dto.setFis4(new FileInputStream(file)); 
			}else {
				dto.setComent4(null);
				dto.setImage4(null);
			}
		}else {
			dto.setComent4(mul.getParameter("coment4"));
			dto.setImage4(null);
		}
		
		if(mul.getParameter("coment5").equals("")) {
			if(!mul.getFile("image_file_name5").isEmpty()) {
				File file = multitofile(mul.getFile("image_file_name5"));
				dto.setImage5(Files.readAllBytes(file.toPath()));
				dto.setComent5(mul.getParameter("comentimage5"));
				dto.setFis5(new FileInputStream(file)); 
			}else {
				dto.setComent5(null);
				dto.setImage5(null);
			}
		}else {
			dto.setComent5(mul.getParameter("coment5"));
			dto.setImage5(null);
		}
		mapper.writeUpdate(dto);
	}
	
}
