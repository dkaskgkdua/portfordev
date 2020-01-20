package com.portfordev.pro.controller;

import java.io.File;
import java.io.PrintWriter;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.portfordev.pro.domain.Profile;
import com.portfordev.pro.service.profile_service_impl;
@Controller
public class profile_controller {
	@Autowired
	private profile_service_impl service;
	
	 @Value("${savefoldername}") 
	 private String saveFolder;
	
	@RequestMapping(value="/profile")
	public String profile_main() throws Exception {
			return "profile/profile";
		
	}
	
	@RequestMapping(value="/profile_form")
	public String profile_form(HttpSession session,HttpServletResponse response) throws Exception {
		//세션 아이디가 있을때 등록 가능
		if(session.getAttribute("id")!=null) {
			System.out.println(session.getAttribute("id"));
			return "profile_form/profile_form";
		}else {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out= response.getWriter();
			out.println("<script>");
			out.println("alert('로그인 해주세요.');");
			out.println("location.href='login'");
			out.println("</script>");
			out.close();
			
				return null;
		}
		
	}
	
	@ResponseBody
	@RequestMapping(value="/profile_insert")
	public Map<String,String> profile_insert(HttpSession session,Profile profile,HttpServletRequest request) throws Exception{
		MultipartFile file= profile.getProfile_img();
		System.out.println("보낸 이름 "+profile.getEng_name());
		String id  = (String) session.getAttribute("id");
		//프로필에 이미 등록됐는지 체크
		int checkid= service.checkid(id);
		if(checkid==0) {
		if (!file.isEmpty()) { // 파일 업로드를 했을 때 
			String fileName=file.getOriginalFilename(); //DB에 저장될 파일이름
			profile.setProfile_img_ori(fileName);
			
			// 새로운 폴더 이름 : 오늘 년-월-일
			Calendar c = Calendar.getInstance();
			int year = c.get(Calendar.YEAR); // 오늘 년도 구한다.
			int month = c.get(Calendar.MONTH) + 1; // 오늘 월 구한다.
			int date = c.get(Calendar.DATE); // 오늘 일 구한다.
			
			// webapp/resources 밑에 upload 파일 만들어놨어야 한다.
			//String saveFolder = request.getSession().getServletContext().getRealPath("resources") + "/upload/";
			
			//2.특정폴더
			//String saveFolder="E:\\final_pro2\\portfordev\\src\\main\\webapp\\resources\\upload\\";
			String homedir = saveFolder + year + "-" + month + "-" + date;
			
			System.out.println(homedir);
			File path1 = new File(homedir);
			if (!(path1.exists())) {
				path1.mkdir();	// 새로운 폴더를 생성
			}
			
			// 난수를 구한다.
			Random r = new Random();
			int random = r.nextInt(100000000);
			
			/**** 확장자 구하기 시작****/
			// 확장자 빼고 파일명 다 바꾸려고 구하는 것임 
			int index = fileName.lastIndexOf(".");
			// 문자열에서 특정 문자열의 위치 값(index)를 반환한다.
			// indexOf가 처음 발견되는 문자열에 대한 index를 반환하는 반면,
			// lastIndexOf는 마지막으로 발견되는 문자열의 index를 반환한다.
			// (파일명에 점이 여러 개 있을 경우 맨 마지막에 발견되는 문자열의 위치를 리턴한다.)
			System.out.println("index = " + index);
			
			String fileExtension = fileName.substring(index + 1);
			System.out.println("fileExtension = " + fileExtension);
			/**** 확장자 구하기 끝 ****/
			
			// 새로운 파일명
			String refileName = "bbs" + year + month + date + random + "." + fileExtension;
			System.out.println("refileName = " + refileName);
			
			// 오라클 디비에 저장될 파일명
			String fileDBName = "/" + year + "-" + month + "-" + date + "/" + refileName;
			System.out.println("fileDBName = " + fileDBName);
			
			// transferTo(File path) : 업로드한 파일을 매개변수의 경로에 저장한다.
			file.transferTo(new File(saveFolder + fileDBName));
			
			// 바뀐 파일명으로 저장
			profile.setProfile_img_file(fileDBName);
		} // if end
		//check if end
		}else {
			//이미 있으면 수정 ㄱ ㄱ 
		}
		
		
		service.insertprofile(id, profile);
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("result","success");
		return map;
		
		
	}

}
