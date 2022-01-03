package com.care.dare.map.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Stack;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.care.dare.join.controller.MemberDTO;
import com.care.dare.map.dto.MapDTO;
import com.care.dare.map.service.MapService;

@Controller
public class MapController {
	@Autowired
	MapService service;

	@RequestMapping("/map")
	public String viewMap(HttpServletRequest req) {
		HttpSession session = req.getSession();
		
		if (session.getAttribute("loginUser") == null) {
			return "error/loginError";
		}
		return "map/map";
	}

	@GetMapping(value = "/ajaxMap.do")
	@ResponseBody
	public JSONArray readDB(HttpServletRequest req, Model model) throws Exception {
		HttpSession session = req.getSession();

		MemberDTO dto = (MemberDTO) session.getAttribute("loginUser");
		service.readForMap(model, dto.getId());

		ArrayList<MapDTO> dataList = (ArrayList<MapDTO>) model.getAttribute("mapData");
		SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy-MM-dd");
		JSONArray jArray = new JSONArray();

		String[] beforeWordsList = { "강원", "경기", "경남", "경북", "광주시", "광주", "부산", "대전", "대구", "서울", "울산", "인천", "전남",
				"전북", "제주", "충남", "충북", "세종", "세종시" };

		String[] AfterWordsList = { "강원도", "경기도", "경상남도", "경상북도", "광주시", "광주광역시", "부산광역시", "대전광역시", "대구광역시", "서울특별시",
				"울산광역시", "인천광역시", "전라남도", "전라북도", "제주특별자치도", "충청남도", "충청북도", "세종특별자치시", "세종특별자치시", "" };

		String testtest = "지하";
		String aftertest = "";
		String replace1, replace2, replace3;

		for (MapDTO data : dataList) {
			boolean completeFlag1 = true, completeFlag2 = true, completeFlag3 = true;
			int locationNullFlag = 0;

			for (int i = 0; i < beforeWordsList.length; i++) { // 도, 광역시 줄임 이름을 풀네임으로 변환

				if (data.getLocation1() != null) {
					if (data.getLocation1().indexOf(beforeWordsList[i]) != -1 && completeFlag1) {

						if (data.getLocation1().indexOf(AfterWordsList[i]) == -1) { // ex) 서울특별시의 경우 "서울"과 "서울특별시"모두
																					// 포함되기 때문에 구분하기 위함
							replace1 = data.getLocation1().replace(beforeWordsList[i], AfterWordsList[i]);
							data.setLocation1(replace1);
						}

						if (data.getLocation1().indexOf(testtest) != -1) {
							replace1 = data.getLocation1().replace(testtest, aftertest);
							data.setLocation1(replace1);
						}
						completeFlag1 = false;
					}
				}

				if (data.getLocation2() != null) {
					if (data.getLocation2().indexOf(beforeWordsList[i]) != -1 && completeFlag2) {

						if (data.getLocation2().indexOf(AfterWordsList[i]) == -1) {
							replace2 = data.getLocation2().replace(beforeWordsList[i], AfterWordsList[i]);
							data.setLocation2(replace2);
						}

						if (data.getLocation1().indexOf(testtest) != -1) {
							replace1 = data.getLocation1().replace(testtest, aftertest);
							data.setLocation1(replace1);
						}

						completeFlag2 = false;
					}
				}

				if (data.getLocation3() != null) {
					if (data.getLocation3().indexOf(beforeWordsList[i]) != -1 && completeFlag3) {

						if (data.getLocation3().indexOf(AfterWordsList[i]) == -1) {
							replace3 = data.getLocation3().replace(beforeWordsList[i], AfterWordsList[i]);
							data.setLocation3(replace3);
						}

						if (data.getLocation1().indexOf(testtest) != -1) {
							replace1 = data.getLocation1().replace(testtest, aftertest);
							data.setLocation1(replace1);
						}
					}
				}

				if (data.getLocation2() == null && data.getLocation3() == null) {
					locationNullFlag = 1;
				}

				if (data.getLocation2() != null && data.getLocation3() == null) {
					locationNullFlag = 2;
				}
			}

			JSONObject jsonObj = new JSONObject();

			jsonObj.put("num", data.getNum());
			jsonObj.put("title", data.getTitle());
			jsonObj.put("person", data.getPerson());

			jsonObj.put("id", data.getId());

			jsonObj.put("location1", data.getLocation1());

			if (locationNullFlag == 0) {
				jsonObj.put("location2", data.getLocation2());
				jsonObj.put("location3", data.getLocation3());
			}

			else if (locationNullFlag == 1) {
				jsonObj.put("location2", data.getLocation1());
				jsonObj.put("location3", data.getLocation1());
			}

			else {
				jsonObj.put("location2", data.getLocation2());
				jsonObj.put("location3", data.getLocation2());
			}

			String outdateStr = simpleDate.format(data.getOutdate());
			jsonObj.put("end", outdateStr);
			String indateStr = simpleDate.format(data.getIndate());
			jsonObj.put("start", indateStr);

			jsonObj.put("image", data.getImage1());
			jArray.add(jsonObj);
		}

		return jArray;
	}
}
