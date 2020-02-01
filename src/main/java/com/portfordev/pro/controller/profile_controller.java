package com.portfordev.pro.controller;

import java.io.File;
import java.io.FilenameFilter;
import java.io.PrintWriter;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.portfordev.pro.domain.Portfolio;
import com.portfordev.pro.domain.Profile;
import com.portfordev.pro.service.portfolio_service;
import com.portfordev.pro.service.profile_service_impl;
@Controller
public class profile_controller {
	@Autowired
	private profile_service_impl service;
	
	@Autowired
	private portfolio_service po_service;
	
	 @Value("${savefoldername}") 
	public String save_folder;
	
	@RequestMapping(value="/profile")
	public ModelAndView profile_main(ModelAndView model,Profile profile,HttpSession session,String idch) throws Exception {
		profile =  service.profile_view(idch);
		
		
		if(profile!=null) {
			String s[]=profile.getPROFILE_TECH_FRONT().split(",");
			String ss[]=profile.getPROFILE_TECH_BACK().split(",");
			model.addObject("front",s);
			model.addObject("frontcnt",s.length);
			model.addObject("back",ss);
			
			
		}
		
		/*프로젝트 가져오기*/
		List<Portfolio> myList = po_service.getMyPortfolioList(idch);
		for(Portfolio port : myList)
		{
			String PORT_FILE_PATH = port.getPORT_FILE_PATH();
			
			
			String[] fileList =getFiles(PORT_FILE_PATH);
			String PORT_THUMBNAIL = "Image/no_img.png";
			if(fileList!= null) 
				PORT_THUMBNAIL = "upload/" + PORT_FILE_PATH + fileList[0];
			String PORT_WRITER_IMG = port.getPORT_WRITER_IMG();
			if(PORT_WRITER_IMG == null || PORT_WRITER_IMG.equals("none")) {
				PORT_WRITER_IMG = "Image/userdefault.png";
			}else{
				PORT_WRITER_IMG = "upload/" + PORT_WRITER_IMG;
			}
			if(port.getPORT_WRITER_JOB() == null)
				port.setPORT_WRITER_JOB("개발자");
			port.setPORT_WRITER_IMG(PORT_WRITER_IMG);
			port.setPORT_THUMBNAIL(PORT_THUMBNAIL);
		}
		
//		List<Profile> portList = service.portfolioImg(idch);
		model.setViewName("profile/profile");
		model.addObject("profile",profile);
//		model.addObject("portfolio",portList);
		model.addObject("myList", myList);
		model.addObject("idch",idch);
		
		return model;
		
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
		String s =profile.getPROFILE_REAL_NAME().replace(",","");
		profile.setPROFILE_REAL_NAME(s);
		String s1 =profile.getPROFILE_BLOG().replace(",","");
		profile.setPROFILE_BLOG(s1);
		String s2 = profile.getPROFILE_PHONE().replace(",","");
		profile.setPROFILE_PHONE(s2);
		String s3 = profile.getPROFILE_GIT().replace(",","");
		profile.setPROFILE_GIT(s3);
		String s4 = profile.getPROFILE_INTRO().replace(",","");
		profile.setPROFILE_INTRO(s4);
		String s5 = profile.getPROFILE_YEAR().replace(",","");
		profile.setPROFILE_YEAR(s5);
		String s6 = profile.getPROFILE_STRENGTH1().replace(",","");
		profile.setPROFILE_STRENGTH1(s6);
		String s7 = profile.getPROFILE_STRENGTH2().replace(",","");
		profile.setPROFILE_STRENGTH2(s7);
		String s8 = profile.getPROFILE_EMAIL().replace(",", "");
		profile.setPROFILE_EMAIL(s8);
		System.out.println("강점왜 널들어감 "+profile.getPROFILE_STRENGTH1());
		
		MultipartFile file= profile.getProfile_img();
		System.out.println("보낸 이름 "+profile.getPROFILE_REAL_NAME());
		String id  = (String) session.getAttribute("id");
		//프로필에 이미 등록됐는지 체크
		int checkid= service.checkid(id);
		if(checkid==0) {
			
			
			
			
		if (!file.isEmpty()) { // 파일 업로드를 했을 때 
			String fileName=file.getOriginalFilename(); //DB에 저장될 파일이름
			profile.setPROFILE_IMG_ORI(fileName);
			
			// 새로운 폴더 이름 : 오늘 년-월-일
			Calendar c = Calendar.getInstance();
			int year = c.get(Calendar.YEAR); // 오늘 년도 구한다.
			int month = c.get(Calendar.MONTH) + 1; // 오늘 월 구한다.
			int date = c.get(Calendar.DATE); // 오늘 일 구한다.
			
			// webapp/resources 밑에 upload 파일 만들어놨어야 한다.
			//String saveFolder = request.getSession().getServletContext().getRealPath("resources") + "/upload/";
			
			//2.특정폴더
			//String saveFolder="E:\\final_pro2\\portfordev\\src\\main\\webapp\\resources\\upload\\";
			String homedir = save_folder + year + "-" + month + "-" + date;
			
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
			
			String fileExtension = fileName.substring(index + 1);
			System.out.println("fileExtension = " + fileExtension);
			/**** 확장자 구하기 끝 ****/
			
			// 새로운 파일명
			String refileName = "bbs" + year + month + date + random + "." + fileExtension;
			System.out.println("refileName = " + refileName);
			
			// 오라클 디비에 저장될 파일명
			String fileDBName = year + "-" + month + "-" + date + "/" + refileName;
			System.out.println("fileDBName = " + fileDBName);
			
			// transferTo(File path) : 업로드한 파일을 매개변수의 경로에 저장한다.
			file.transferTo(new File(save_folder + fileDBName));
			
			// 바뀐 파일명으로 저장
			profile.setPROFILE_IMG_FILE(fileDBName);
		} // if end
		//check if end
		service.insertprofile(id, profile);
		
		}
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("result","success");
		return map;
		
		
	}
	
	@PostMapping("profile_modify")
	public String profile_modify(Profile profile,HttpSession session, String chkimg)throws Exception {
		
		MultipartFile file= profile.getProfile_img();
		String id  = (String) session.getAttribute("id");
		
		
		if (!file.isEmpty()&& !chkimg.equals(profile.getPROFILE_IMG_ORI())) { // 파일 업로드를 했을 때 
			String fileName=file.getOriginalFilename(); //DB에 저장될 파일이름
			profile.setPROFILE_IMG_ORI(fileName);
			
			// 새로운 폴더 이름 : 오늘 년-월-일
			Calendar c = Calendar.getInstance();
			int year = c.get(Calendar.YEAR); // 오늘 년도 구한다.
			int month = c.get(Calendar.MONTH) + 1; // 오늘 월 구한다.
			int date = c.get(Calendar.DATE); // 오늘 일 구한다.
			
			// webapp/resources 밑에 upload 파일 만들어놨어야 한다.
			//String saveFolder = request.getSession().getServletContext().getRealPath("resources") + "/upload/";
			
			//2.특정폴더
			//String saveFolder="E:\\final_pro2\\portfordev\\src\\main\\webapp\\resources\\upload\\";
			String homedir = save_folder + year + "-" + month + "-" + date;
			
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
			
			String fileExtension = fileName.substring(index + 1);
			System.out.println("fileExtension = " + fileExtension);
			/**** 확장자 구하기 끝 ****/
			
			// 새로운 파일명
			String refileName = "bbs" + year + month + date + random + "." + fileExtension;
			System.out.println("refileName = " + refileName);
			
			// 오라클 디비에 저장될 파일명
			String fileDBName = year + "-" + month + "-" + date + "/" + refileName;
			System.out.println("fileDBName = " + fileDBName);
			
			// transferTo(File path) : 업로드한 파일을 매개변수의 경로에 저장한다.
			file.transferTo(new File(save_folder + fileDBName));
			
			// 바뀐 파일명으로 저장
			profile.setPROFILE_IMG_FILE(fileDBName);
		} // if end
		else if(chkimg.equals(profile.getPROFILE_IMG_ORI())){
			System.out.println("11111111프로필 사진 일치 ");
			profile.setPROFILE_IMG_ORI(chkimg);
		}else {
			profile.setPROFILE_IMG_ORI("");
			profile.setPROFILE_IMG_FILE("");
		}

		System.out.println("$$$$$$$$$$$$$$원래 이미지"+profile.getPROFILE_IMG_ORI());
		System.out.println("##############인풋 값"+chkimg);
		System.out.println("프로필 블로그 수정 : "+profile.getPROFILE_BLOG());
		service.updateprofile(id, profile);
		System.out.println("프로필 페이지로 넘어가는 아이디:"+profile.getMEMBER_ID());
		
	
		
		
		return "redirect:profile?idch="+profile.getMEMBER_ID();
		
	}
	
	// 경로를 통해 파일들 가져오기
		public String[] getFiles(String PORT_FILE_PATH) {
			System.out.println("파일 패스 "+PORT_FILE_PATH);
			File path = new File(save_folder+PORT_FILE_PATH);
			System.out.println("경로"+save_folder+PORT_FILE_PATH);
			String fileList[] = path.list(new FilenameFilter() {
				@Override
				public boolean accept(File dir, String name) {
					return (name.endsWith("jpg") || 
							name.endsWith("jpeg") || 
							name.endsWith("gif") || 
							name.endsWith("png"));
				}
			});
			return fileList;
		}
}