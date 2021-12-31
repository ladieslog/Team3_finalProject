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
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.care.dare.diary.dto.DiaryDTO;
import com.care.dare.join.controller.MemberDTO;
import com.care.dare.mybatis.DiaryMapper;


@Service
public class DiaryService {
	@Autowired DiaryMapper mapper;
	public void writeSave(HttpServletRequest req) throws Exception {	// 다이어리 작성 DB 저장
		DiaryDTO dto = new DiaryDTO();
		HttpSession sessi = req.getSession();
		MemberDTO dt = (MemberDTO)sessi.getAttribute("loginUser");
		
		dto.setId(dt.getId());

		SimpleDateFormat sm = new SimpleDateFormat("yyyy-MM-dd");
		Date date1 = null;
		Date date2 = null;		
		try {
			date1 = new Date(sm.parse(req.getParameter("indate")).getTime());
			date2 = new Date(sm.parse(req.getParameter("outdate")).getTime());
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Timestamp indate = new Timestamp(date1.getTime());
		Timestamp outdate = new Timestamp(date2.getTime());
		dto.setIndate(indate);
		dto.setOutdate(outdate);
		
		dto.setTitle(req.getParameter("title"));

		dto.setLocation1(req.getParameter("place1"));
		if(req.getParameter("place2").equals("")) {
			dto.setLocation2(null);
		}else {
			dto.setLocation2(req.getParameter("place2"));
		}
		if(req.getParameter("place3").equals("")) {
			dto.setLocation3(null);
		}else {
			dto.setLocation3(req.getParameter("place3"));
		}
		dto.setPerson(req.getParameter("who"));
		
		if(req.getParameter("coment1").equals("")) {
			if(!(req.getParameter("fileChk1").equals("") || req.getParameter("fileChk1") == null)) {
				dto.setImage1(req.getParameter("fileChk1"));
				dto.setComent1(req.getParameter("comentimage1"));
			}else {
				dto.setComent1(null);
				dto.setImage1(null);
			}
		}else {
			dto.setComent1(req.getParameter("coment1"));
			dto.setImage1(null);
		}
		
		if(req.getParameter("coment2").equals("")) {
			if(!(req.getParameter("fileChk2").equals("") || req.getParameter("fileChk2") == null)) {
				dto.setImage2(req.getParameter("fileChk2"));
				dto.setComent2(req.getParameter("comentimage2"));
			}else {
				dto.setComent2(null);
				dto.setImage2(null);
			}
		}else {
			dto.setComent2(req.getParameter("coment2"));
			dto.setImage2(null);
		}
		
		if(req.getParameter("coment3").equals("")) {
			if(!(req.getParameter("fileChk3").equals("") || req.getParameter("fileChk3") == null)) {
				dto.setImage3(req.getParameter("fileChk3"));
				dto.setComent3(req.getParameter("comentimage3"));
			}else {
				dto.setComent3(null);
				dto.setImage3(null);
			}
		}else {
			dto.setComent3(req.getParameter("coment3"));
			dto.setImage3(null);
		}
		
		if(req.getParameter("coment4").equals("")) {
			if(!(req.getParameter("fileChk4").equals("") || req.getParameter("fileChk4") == null)) {
				dto.setImage4(req.getParameter("fileChk4"));
				dto.setComent4(req.getParameter("comentimage4"));
			}else {
				dto.setComent4(null);
				dto.setImage4(null);
			}
		}else {
			dto.setComent4(req.getParameter("coment4"));
			dto.setImage4(null);
		}
		
		if(req.getParameter("coment5").equals("")) {
			if(!(req.getParameter("fileChk5").equals("") || req.getParameter("fileChk5") == null)) {
				dto.setImage5(req.getParameter("fileChk5"));
				dto.setComent5(req.getParameter("comentimage5"));
			}else {
				dto.setComent5(null);
				dto.setImage5(null);
			}
		}else {
			dto.setComent5(req.getParameter("coment5"));
			dto.setImage5(null);
		}
		mapper.writeSave(dto);
	}

/*	public File reqtitofile(reqtipartFile mfile) throws Exception {		// 다이어리 작성 이미지 저장 변환
		File file = new File(mfile.getOriginalFilename());
		file.createNewFile();
		FileOutputStream fos = new FileOutputStream(file);
		fos.write(mfile.getBytes());
		fos.close();
		return file;
	}*/
	
	public ArrayList<DiaryDTO> diaryBoard(int start, int end, String id, String search) {
		return mapper.diaryBoard(start, end, id, search);
	}

	

	public DiaryDTO diaryView(int num) throws Exception {
		DiaryDTO dto = mapper.diaryView(num);
		SimpleDateFormat sim = new SimpleDateFormat("yyyy-MM-dd");
		dto.setIndatestr(sim.format(dto.getIndate()));
		dto.setOutdatestr(sim.format(dto.getOutdate()));
		
		return dto;
	}
	
/*	public void imgFile(byte[] bt,int count) throws Exception {
		File file = new File("C:/spring/diaryView/"+count+".png");
		FileOutputStream fos = new FileOutputStream(file);
		DataOutputStream stream = new DataOutputStream(fos);
		stream.write(bt); 
		stream.flush();
		fos.getFD().sync();
		stream.close();
		count++;
	}*/
	
	public void diaryDelete(int num) {
		mapper.diaryDelete(num);
	}
	
	public DiaryDTO diaryModify(int num) throws Exception {
		DiaryDTO dto = mapper.diaryView(num);
		return dto;	
	}
	
	public void writeUpdate(HttpServletRequest req) throws Exception {	// 다이어리 작성 업데이트 DB 저장
		DiaryDTO dto = new DiaryDTO();
		HttpSession sessi = req.getSession();
		MemberDTO dt = (MemberDTO)sessi.getAttribute("loginUser");
		dto.setId(dt.getId());
		System.out.println(req.getParameter("coment3"));
		dto.setNum(Integer.parseInt(req.getParameter("num")));
		SimpleDateFormat sm = new SimpleDateFormat("yyyy-MM-dd");
		Date date1 = null;
		Date date2 = null;		
		try {
			date1 = new Date(sm.parse(req.getParameter("indate")).getTime());
			date2 = new Date(sm.parse(req.getParameter("outdate")).getTime());
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Timestamp indate = new Timestamp(date1.getTime());
		Timestamp outdate = new Timestamp(date2.getTime());
		dto.setIndate(indate);
		dto.setOutdate(outdate);
		
		dto.setTitle(req.getParameter("title"));

		dto.setLocation1(req.getParameter("place1"));
		if(req.getParameter("place2").equals("")) {
			dto.setLocation2(null);
		}else {
			dto.setLocation2(req.getParameter("place2"));
		}
		if(req.getParameter("place3").equals("")) {
			dto.setLocation3(null);
		}else {
			dto.setLocation3(req.getParameter("place3"));
		}
		dto.setPerson(req.getParameter("who"));
	
		if(req.getParameter("coment1").equals("")) {
			if(!(req.getParameter("fileChk1").equals("") || req.getParameter("fileChk1") == null)) {
				dto.setImage1(req.getParameter("fileChk1"));
				dto.setComent1(req.getParameter("comentimage1"));
			}else {
				dto.setComent1(null);
				dto.setImage1(null);
			}
		}else {
			dto.setComent1(req.getParameter("coment1"));
			dto.setImage1(null);
		}
		
		if(req.getParameter("coment2").equals("")) {
			if(!(req.getParameter("fileChk2").equals("") || req.getParameter("fileChk2") == null)) {
				dto.setImage2(req.getParameter("fileChk2"));
				dto.setComent2(req.getParameter("comentimage2"));
			}else {
				dto.setComent2(null);
				dto.setImage2(null);
			}
		}else {
			dto.setComent2(req.getParameter("coment2"));
			dto.setImage2(null);
		}
		
		if(req.getParameter("coment3").equals("")) {
			if(!(req.getParameter("fileChk3").equals("") || req.getParameter("fileChk3") == null)) {
				dto.setImage3(req.getParameter("fileChk3"));
				dto.setComent3(req.getParameter("comentimage3"));
			}else {
				dto.setComent3(null);
				dto.setImage3(null);
			}
		}else {
			dto.setComent3(req.getParameter("coment3"));
			dto.setImage3(null);
		}
		
		if(req.getParameter("coment4").equals("")) {
			if(!(req.getParameter("fileChk4").equals("") || req.getParameter("fileChk4") == null)) {
				dto.setImage4(req.getParameter("fileChk4"));
				dto.setComent4(req.getParameter("comentimage4"));
			}else {
				dto.setComent4(null);
				dto.setImage4(null);
			}
		}else {
			dto.setComent4(req.getParameter("coment4"));
			dto.setImage4(null);
		}
		
		if(req.getParameter("coment5").equals("")) {
			if(!(req.getParameter("fileChk5").equals("") || req.getParameter("fileChk5") == null)) {
				dto.setImage5(req.getParameter("fileChk5"));
				dto.setComent5(req.getParameter("comentimage5"));
			}else {
				dto.setComent5(null);
				dto.setImage5(null);
			}
		}else {
			dto.setComent5(req.getParameter("coment5"));
			dto.setImage5(null);
		}

		mapper.writeUpdate(dto);
	}

	public int diaryCount(String id,String search) {
		return mapper.diaryCount(id,search);
	}
	
}
