package com.portfordev.pro.controller;

import java.io.File;
import java.io.FilenameFilter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.portfordev.pro.domain.Portfolio;
import com.portfordev.pro.service.portfolio_service;

@Controller
public class main_controller 
{
	@Autowired
	private portfolio_service po_service;
	
	@Value("${savefoldername}")
	private String save_folder;
	
	@RequestMapping(value = "/pro")
	public ModelAndView main(ModelAndView mv) {
		String condition = "daily";
		List<Portfolio> bestList = po_service.getBestPort5List(condition);
		if(bestList == null || bestList.size() == 0)
		{
			condition = "weekly";
			bestList = po_service.getBestPort5List(condition);
			if(bestList == null || bestList.size() == 0) {
				condition = "monthly";
				bestList = po_service.getBestPort5List(condition);
				if(bestList == null || bestList.size() == 0) {
					condition = "recent";
				}
			}
		}
		for(Portfolio port : bestList)
		{
			String PORT_FILE_PATH = port.getPORT_FILE_PATH();
			String[] fileList = getFiles(PORT_FILE_PATH);
			String PORT_THUMBNAIL = "Image/no_img.png";
			if(fileList != null) 
				PORT_THUMBNAIL = "upload/" + PORT_FILE_PATH + fileList[0];
			String PORT_WRITER_IMG = port.getPORT_WRITER_IMG();
			if(PORT_WRITER_IMG == null || PORT_WRITER_IMG.equals("none"))
				PORT_WRITER_IMG = "Image/userdefault.png";
			else
				PORT_WRITER_IMG = "upload/" + PORT_WRITER_IMG;
			if(port.getPORT_WRITER_JOB() == null)
				port.setPORT_WRITER_JOB("개발자");
			port.setPORT_WRITER_IMG(PORT_WRITER_IMG);
			port.setPORT_THUMBNAIL(PORT_THUMBNAIL);
		}
		List<Portfolio> recentList = po_service.getBestPort5List("recent");
		for(Portfolio port : recentList)
		{
			String PORT_FILE_PATH = port.getPORT_FILE_PATH();
			String[] fileList = getFiles(PORT_FILE_PATH);
			String PORT_THUMBNAIL = "Image/no_img.png";
			if(fileList != null) 
				PORT_THUMBNAIL = "upload/" + PORT_FILE_PATH + fileList[0];
			String PORT_WRITER_IMG = port.getPORT_WRITER_IMG();
			if(PORT_WRITER_IMG == null || PORT_WRITER_IMG.equals("none"))
				PORT_WRITER_IMG = "Image/userdefault.png";
			else
				PORT_WRITER_IMG = "upload/" + PORT_WRITER_IMG;
			if(port.getPORT_WRITER_JOB() == null)
				port.setPORT_WRITER_JOB("개발자");
			port.setPORT_WRITER_IMG(PORT_WRITER_IMG);
			port.setPORT_THUMBNAIL(PORT_THUMBNAIL);
		}
		mv.addObject("condition", condition);
		mv.addObject("bestList", bestList);
		mv.addObject("recentList", recentList);
		mv.setViewName("main/main");
		return mv;
	}
	@RequestMapping(value = "/TeamPFD")
	public ModelAndView teamPFD(ModelAndView mv) {
		mv.setViewName("main/team_pfd");
		return mv;	
	}
	@ResponseBody
	@PostMapping(value = "/best_port")
	public List<Portfolio> best_port(@RequestParam("condition") String condition){
		List<Portfolio> bestList = po_service.getBestPort5List(condition);
		for(Portfolio port : bestList)
		{
			String PORT_FILE_PATH = port.getPORT_FILE_PATH();
			String[] fileList = getFiles(PORT_FILE_PATH);
			String PORT_THUMBNAIL = "Image/no_img.png";
			if(fileList != null) 
				PORT_THUMBNAIL = "upload/" + PORT_FILE_PATH + fileList[0];
			String PORT_WRITER_IMG = port.getPORT_WRITER_IMG();
			if(PORT_WRITER_IMG == null || PORT_WRITER_IMG.equals("none"))
				PORT_WRITER_IMG = "Image/userdefault.png";
			else
				PORT_WRITER_IMG = "upload/" + PORT_WRITER_IMG;
			if(port.getPORT_WRITER_JOB() == null)
				port.setPORT_WRITER_JOB("개발자");
			port.setPORT_WRITER_IMG(PORT_WRITER_IMG);
			port.setPORT_THUMBNAIL(PORT_THUMBNAIL);
		}
		return bestList;
	}

	// 경로를 통해 파일들 가져오기
	public String[] getFiles(String PORT_FILE_PATH) {
		File path = new File(save_folder+PORT_FILE_PATH);
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