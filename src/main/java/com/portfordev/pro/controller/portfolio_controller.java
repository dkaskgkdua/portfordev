package com.portfordev.pro.controller;

import java.io.File;
import java.io.FilenameFilter;
import java.io.PrintWriter;
import java.text.ParseException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.portfordev.pro.domain.Member_log;
import com.portfordev.pro.domain.Port_recommend;
import com.portfordev.pro.domain.Port_scrap;
import com.portfordev.pro.domain.Portfolio;
import com.portfordev.pro.service.MemberService;
import com.portfordev.pro.service.feedback_service;
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
	private feedback_service fb_service;
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
		log_service.insert_log(new Member_log(portfolio.getMEMBER_ID(), 2, portfolio_id));
		po_service.insert_portfolio(portfolio);
		return "redirect:pro";
	}
	
	// 포트폴리오 collection
	@RequestMapping(value="/portfolio/collection")
	public ModelAndView portfolio_collection(ModelAndView mv, HttpSession session)
	{
		Map<String, String> map = new HashMap<String, String>();
		map.put("page", "1");
		map.put("category", "cateAll");
		map.put("order", "newest");
		map.put("from", "all");
		List<Portfolio> portList = po_service.getPortfolioList(map);
		for(Portfolio port : portList)
		{
			int PORT_SCRAP = 0;
			if(session.getAttribute("id") != null) {
				Map<String, String> pschk = new HashMap<String, String>();
				pschk.put("PORT_ID", ""+port.getPORT_ID());
				pschk.put("MEMBER_ID", (String)session.getAttribute("id"));
				PORT_SCRAP = po_service.checkScrapPortfolio(pschk);
			}
			String PORT_WRITER = member_service.get_name(port.getMEMBER_ID());
			int PORT_LIKECOUNT = po_service.getPortRecommendCount(port.getPORT_ID());
			int PORT_FEEDCOUNT = fb_service.getFeedbackCount(port.getPORT_ID());
			String PORT_FILE_PATH = port.getPORT_FILE_PATH();
			String[] fileList = getFiles(PORT_FILE_PATH);
			String PORT_THUMBNAIL = "Image/no_img.png";
			if(fileList != null) 
				PORT_THUMBNAIL = "upload/" + PORT_FILE_PATH + fileList[0];
			String PORT_WRITER_IMG = port.getPORT_WRITER_IMG();
			if(PORT_WRITER_IMG.equals("none"))
				PORT_WRITER_IMG = "Image/userdefault.png";
			else
				PORT_WRITER_IMG = "upload/" + PORT_WRITER_IMG;
			port.setPORT_WRITER_IMG(PORT_WRITER_IMG);
			port.setPORT_SCRAP(PORT_SCRAP);
			port.setPORT_WRITER(PORT_WRITER);
			port.setPORT_LIKECOUNT(PORT_LIKECOUNT);
			port.setPORT_FEEDCOUNT(PORT_FEEDCOUNT);
			port.setPORT_THUMBNAIL(PORT_THUMBNAIL);
		}
		mv.addObject("portList",portList);
		mv.setViewName("portfolio/portfolio_collection");
		return mv;	
	}
	
	// 포트폴리오 리스트 가져오기
	@ResponseBody
	@PostMapping(value="/portfolio/getPortList")
	public List<Portfolio> getList(	@RequestParam("page") int page, 
									@RequestParam("category") String category, 
									@RequestParam("order") String order, 
									@RequestParam("from") String from, HttpSession session)
	{
		Map<String, String> map = new HashMap<String, String>();
		map.put("page", ""+page);
		if(category.equals("scrapOnly"))
		{
			if(session.getAttribute("id") != null)
				map.put("MEMBER_ID", ""+session.getAttribute("id"));
			else
				return null;
		}
		map.put("category", category);
		map.put("order", order);
		map.put("from", from);
		List<Portfolio> portList = po_service.getPortfolioList(map);
		for(Portfolio port : portList)
		{
			int PORT_SCRAP = 0;
			if(session.getAttribute("id") != null) {
				Map<String, String> pschk = new HashMap<String, String>();
				pschk.put("PORT_ID", ""+port.getPORT_ID());
				pschk.put("MEMBER_ID", (String)session.getAttribute("id"));
				PORT_SCRAP = po_service.checkScrapPortfolio(pschk);
			}
			String PORT_WRITER = member_service.get_name(port.getMEMBER_ID());
			int PORT_LIKECOUNT = po_service.getPortRecommendCount(port.getPORT_ID());
			int PORT_FEEDCOUNT = fb_service.getFeedbackCount(port.getPORT_ID());
			String PORT_FILE_PATH = port.getPORT_FILE_PATH();
			String[] fileList = getFiles(PORT_FILE_PATH);
			String PORT_THUMBNAIL = "Image/no_img.png";
			if(fileList != null) 
				PORT_THUMBNAIL = "upload/" + PORT_FILE_PATH + fileList[0];
			String PORT_WRITER_IMG = port.getPORT_WRITER_IMG();
			if(PORT_WRITER_IMG.equals("none"))
				PORT_WRITER_IMG = "Image/userdefault.png";
			else
				PORT_WRITER_IMG = "upload/" + PORT_WRITER_IMG;
			port.setPORT_WRITER_IMG(PORT_WRITER_IMG);
			port.setPORT_SCRAP(PORT_SCRAP);
			port.setPORT_WRITER(PORT_WRITER);
			port.setPORT_LIKECOUNT(PORT_LIKECOUNT);
			port.setPORT_FEEDCOUNT(PORT_FEEDCOUNT);
			port.setPORT_THUMBNAIL(PORT_THUMBNAIL);
		}
		return portList;
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
	
	// 파일의 db 이름을 저장하는 메서드
	private String fileDBName(String fileName, String saveFolder, int portfolio_id, int file_index) {
		File path1 = new File(saveFolder+portfolio_id);
		if (!(path1.exists())) {
			path1.mkdir();
		}
		int index = fileName.lastIndexOf(".");

		String fileExtension = fileName.substring(index + 1);
		//System.out.println("fileExtension = " + fileExtension);

		String refileName = ""+ file_index + "." + fileExtension;
		//System.out.println("refileName = " + refileName);

		String fileDBName = "/" +portfolio_id + "/" + refileName;
		//System.out.println("fileDBName = " + fileDBName);

		return fileDBName;
	}
	// 포트폴리오 수정하기
	@RequestMapping("/portfolio/portfolio_update")
	public ModelAndView portfolio_update(ModelAndView mv) {
		return mv;
	}
	// 포트폴리오 수정 시도
	@PostMapping("/portfolio/portfolio_update_action")
	public String portfolio_update_action() {
		return "";
	}
	// 포트폴리오 삭제하기
	@ResponseBody
	@RequestMapping("/portfolio/portfolio_delete")
	public int portfolio_delete(int PORT_ID, String MEMBER_ID, HttpSession session) {
		if(session.getAttribute("id") == null)
			return 0;	// 로그인 바람
		if(!session.getAttribute("id").equals(MEMBER_ID))
			return 2;	// 작성자가 일치하지 않음
		member_service.add_write_act(MEMBER_ID, -20);
		return po_service.deletePortfolio(PORT_ID);
	}
	// 포트폴리오 상세보기
	@ResponseBody
	@RequestMapping("/portfolio/port_detail")
	public Portfolio getPortfolioDetail(@RequestParam("PORT_ID") int PORT_ID, HttpSession session) throws ParseException {
		// 포트폴리오 조회수 + 1
		po_service.readcountUpdatePortfolio(PORT_ID);
		Portfolio portfolio = po_service.detailPortfolio(PORT_ID);
		if(portfolio == null)
			return null;
		int PORT_SCRAP = 0;
		int PORT_RECOM = 0;
		if(session.getAttribute("id") != null) {
			Map<String, String> pochk = new HashMap<String, String>();
			pochk.put("PORT_ID", ""+portfolio.getPORT_ID());
			pochk.put("MEMBER_ID", (String)session.getAttribute("id"));
			PORT_SCRAP = po_service.checkScrapPortfolio(pochk);
			PORT_RECOM = po_service.checkRecomPortfolio(pochk);
		}
		Portfolio PORT_WRITER_INFO = po_service.getPortWriter(PORT_ID);
		String PORT_WRITER = PORT_WRITER_INFO.getPORT_WRITER();
		String PORT_WRITER_JOB = PORT_WRITER_INFO.getPORT_WRITER_JOB();
		String PORT_WRITER_IMG = PORT_WRITER_INFO.getPORT_WRITER_IMG(); 
		if(PORT_WRITER_IMG.equals("none"))
			PORT_WRITER_IMG = "/../Image/userdefault.png";
		int PORT_LIKECOUNT = po_service.getPortRecommendCount(portfolio.getPORT_ID());
		int PORT_FEEDCOUNT = fb_service.getFeedbackCount(portfolio.getPORT_ID());
		Map<String, String> dates = po_service.replaceDate(portfolio.getPORT_ID());
		String PORT_WRITTEN = dates.get("PORT_WRITTEN");
		String PORT_START = dates.get("PORT_START");
		String PORT_END = dates.get("PORT_END");
		String PORT_FILE_PATH = portfolio.getPORT_FILE_PATH();
		String[] fileList = getFiles(PORT_FILE_PATH);
		String PORT_THUMBNAIL = "Image/no_img.png";
		String PORT_IMG_FILES = "";
		if(fileList != null){
			PORT_THUMBNAIL = "upload/" + PORT_FILE_PATH + fileList[0];
			int num = 0;
			for(String file : fileList) {
				if(num == 0)
					PORT_IMG_FILES += file;
				else
					PORT_IMG_FILES += "/" + file;
				num++;
			}
		}
		portfolio.setPORT_SCRAP(PORT_SCRAP);
		portfolio.setPORT_RECOM(PORT_RECOM);
		portfolio.setPORT_WRITER(PORT_WRITER);
		portfolio.setPORT_WRITER_JOB(PORT_WRITER_JOB);
		portfolio.setPORT_WRITER_IMG(PORT_WRITER_IMG);
		portfolio.setPORT_LIKECOUNT(PORT_LIKECOUNT);
		portfolio.setPORT_FEEDCOUNT(PORT_FEEDCOUNT);
		portfolio.setPORT_WRITTEN(PORT_WRITTEN);
		portfolio.setPORT_START(PORT_START);
		portfolio.setPORT_END(PORT_END);
		portfolio.setPORT_THUMBNAIL(PORT_THUMBNAIL);
		portfolio.setPORT_IMG_FILES(PORT_IMG_FILES);
		return portfolio;
	}
	// 포트폴리오 스크랩 / 취소
	@ResponseBody
	@PostMapping("/portfolio/port_scrap")
	public int scrapPortfolio(	@RequestParam("PORT_ID") Integer PORT_ID, 
								@RequestParam("MEMBER_ID") String MEMBER_ID) {
		Port_scrap port_scrap = new Port_scrap();
		port_scrap.setPORT_ID(PORT_ID);
		port_scrap.setMEMBER_ID(MEMBER_ID);
		Map<String, String> pschk = new HashMap<String, String>();
		pschk.put("PORT_ID", ""+PORT_ID);
		pschk.put("MEMBER_ID", MEMBER_ID);
		int ps = po_service.checkScrapPortfolio(pschk);
		if(ps == 0)
			return po_service.scrapPortfolio(port_scrap);
		else
			return po_service.cancelScrapPortfolio(port_scrap);
	}
	// 포트폴리오 스크랩 리스트 가져오기
	@ResponseBody
	@RequestMapping("/portfolio/port_scrap_list")
	public List<Port_scrap> getPortScrapList(@RequestParam("MEMBER_ID") String MEMBER_ID){
		return po_service.getPortScrapList(MEMBER_ID);
	}
	// 포트폴리오 추천 / 취소
	@ResponseBody
	@RequestMapping("/portfolio/port_recommend")
	public int recommendPortfolio(	@RequestParam("PORT_ID") int PORT_ID,
									@RequestParam("MEMBER_ID") String MEMBER_ID) {
		Port_recommend port_recommend = new Port_recommend();
		port_recommend.setPORT_ID(PORT_ID);
		port_recommend.setMEMBER_ID(MEMBER_ID);
		Map<String, String> prchk = new HashMap<String, String>();
		prchk.put("PORT_ID", ""+PORT_ID);
		prchk.put("MEMBER_ID", MEMBER_ID);
		int pr = po_service.checkRecomPortfolio(prchk);
		if(pr == 0) {
			member_service.add_write_act(po_service.getPortWriter(PORT_ID).getMEMBER_ID(), 2);
			return po_service.recommendPortfolio(port_recommend);
		}
		else {
			member_service.add_write_act(po_service.getPortWriter(PORT_ID).getMEMBER_ID(), -2);
			return po_service.cancelRecomPortfolio(port_recommend);
		}
	}
	// 포트폴리오 추천 리스트 가져오기
	@ResponseBody
	@RequestMapping("/portfolio/port_recommend_list")
	public List<Port_recommend> getPortRecommendList(@RequestParam("MEMBER_ID") String MEMBER_ID){
		return po_service.getPortRecommendList(MEMBER_ID);
	}
}
