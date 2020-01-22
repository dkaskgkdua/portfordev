package com.portfordev.pro.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.Calendar;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.xslf.usermodel.XMLSlideShow;
import org.apache.poi.xslf.usermodel.XSLFPictureData;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.portfordev.pro.domain.Portfolio;
import com.portfordev.pro.service.portfolio_service;

@Controller
public class portfolio_controller
{
	@Autowired
	private portfolio_service po_service;
	
	@Value("${savefoldername}")
	private String save_folder;
	
	@GetMapping("portfolio_add")
	public ModelAndView portfolio_add(HttpSession session,	HttpServletResponse response, 
			ModelAndView mv) throws Exception {
		if(session.getAttribute("id") == null) {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('로그인을 해주세요.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
		}
		mv.setViewName("portfolio/portfolio_add");
		return mv;
	}
	
	
	@PostMapping("/portfolio_add_action")
	public String portfolio_add_action(Portfolio portfolio, HttpServletResponse response, HttpServletRequest request) throws Exception {
		MultipartFile upload_image = portfolio.getPORT_SUM_UPLOADIMAGE();
		MultipartFile upload_file = portfolio.getPORT_UPLOADFILE();
		// 썸네일 이미지 파일 저장
		if (!upload_image.isEmpty()) {
			String fileName = upload_image.getOriginalFilename(); // 원래 파일명
			portfolio.setPORT_ORI_SUM_IMAGE(fileName); // 원래 파일명 저장
			String fileDBName = fileDBName(fileName,save_folder);
			System.out.println("fileDBName = " + fileDBName);
			upload_image.transferTo(new File(save_folder + fileDBName));
			portfolio.setPORT_SUM_IMAGE(fileDBName);
		}
		if(!upload_file.isEmpty()) {
			String fileName = upload_file.getOriginalFilename(); // 원래 파일명
			portfolio.setPORT_ORI_FILE(fileName); // 원래 파일명 저장
			String fileDBName = fileDBName(fileName,save_folder);
			System.out.println("fileDBName = " + fileDBName);
			upload_file.transferTo(new File(save_folder + fileDBName));
			portfolio.setPORT_FILE(fileDBName);
			
			File file = new File(save_folder+fileDBName);
			XMLSlideShow ppt = new XMLSlideShow(new FileInputStream(file));
			
			for(XSLFPictureData data : ppt.getPictureData()) {
				byte[] bytes = data.getData();
				String image_fileName = data.getFileName();
				System.out.println("picture name : " + image_fileName);
			}
			
			OutputStream out = new FileOutputStream(file);
			ppt.write(out);
			out.close();
			
			
			
			
			
			 
			
		}
		
		//boardService.insertBoard(board); // 저장 메서드 호출
		return "redirect:pro";
	}
	
	@RequestMapping(value="/portfolio/collection")
	public String project_collection()
	{
		return "portfolio/portfolio_collection";	
	}
	
	private String fileDBName(String fileName, String saveFolder) {
		Calendar c = Calendar.getInstance();
		int year = c.get(Calendar.YEAR);
		int month = c.get(Calendar.MONTH);
		int date = c.get(Calendar.DATE);

		String homedir = saveFolder + year + "-" + month + "-" + date;
		System.out.println(homedir);
		File path1 = new File(homedir);
		if (!(path1.exists())) {
			path1.mkdir();
		}
		Random r = new Random();
		int random = r.nextInt(100000000);

		int index = fileName.lastIndexOf(".");

		String fileExtension = fileName.substring(index + 1);
		System.out.println("fileExtension = " + fileExtension);

		String refileName = "bbs" + year + month + date + random + "." + fileExtension;
		System.out.println("refileName = " + refileName);

		String fileDBName = "/" + year + "-" + month + "-" + date + "/" + refileName;
		System.out.println("fileDBName = " + fileDBName);

		return fileDBName;
	}

}
