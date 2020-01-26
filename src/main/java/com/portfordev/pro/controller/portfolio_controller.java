package com.portfordev.pro.controller;

import java.io.File;
import java.io.PrintWriter;
import java.util.Calendar;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.portfordev.pro.domain.Member_log;
import com.portfordev.pro.domain.Portfolio;
import com.portfordev.pro.service.MemberService;
import com.portfordev.pro.service.log_service;
import com.portfordev.pro.service.portfolio_service;

@Controller
public class portfolio_controller
{
	@Autowired
	private MemberService member_service;
	
	@Autowired
	private portfolio_service po_service;
	
	@Autowired
	private log_service log_service;
	
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
		List<MultipartFile> Upload_file = portfolio.getPORT_UPLOADFILE();
		int portfolio_id = po_service.select_max_id();
		System.out.println(portfolio.getPORT_END_DAY());
		portfolio.setPORT_ID(portfolio_id);
		// 확장자 확인
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		if(!Upload_file.isEmpty()) {
			for (MultipartFile file : Upload_file) {
				int ext = file.getOriginalFilename().lastIndexOf(".");
				String fileExtension = file.getOriginalFilename().substring(ext + 1);
				if(!(fileExtension.equals("jpg") || fileExtension.equals("png")||fileExtension.equals("jpeg")||fileExtension.equals("gif")||file.getOriginalFilename().equals(""))) {
					out.println("<script>");
					out.println("alert('jpg, png, jpeg, gif 파일을 올려주세요.');");
					out.println("location.href='/pro/portfolio_add';");
					out.println("</script>");
					out.close();
					return null;
				}
			}
		}
		int file_index = 0;
		for (MultipartFile mf : Upload_file) {
			if(mf.getSize() == 0) {
				break;
			}
			String fileName = mf.getOriginalFilename(); // 원래 파일명
			String fileDBName = fileDBName(fileName, save_folder, portfolio_id, file_index++);
			mf.transferTo(new File(save_folder + fileDBName));
		}
		portfolio.setPORT_FILE_PATH(portfolio_id+"/");
		member_service.add_write_act(portfolio.getMEMBER_ID(), 20);
		log_service.insert_log(new Member_log(portfolio.getMEMBER_ID(), 3, portfolio_id));
		po_service.insert_portfolio(portfolio);
		return "redirect:pro";
	}
	
	@RequestMapping(value="/portfolio/collection")
	public String project_collection()
	{
		return "portfolio/portfolio_collection";	
	}
	
	private String fileDBName(String fileName, String saveFolder, int portfolio_id, int file_index) {
		
		File path1 = new File(saveFolder+portfolio_id);
		if (!(path1.exists())) {
			path1.mkdir();
		}
		int index = fileName.lastIndexOf(".");

		String fileExtension = fileName.substring(index + 1);
		System.out.println("fileExtension = " + fileExtension);

		String refileName = ""+ file_index + "." + fileExtension;
		System.out.println("refileName = " + refileName);

		String fileDBName = "/" +portfolio_id + "/" + refileName;
		System.out.println("fileDBName = " + fileDBName);

		return fileDBName;
	}

}
