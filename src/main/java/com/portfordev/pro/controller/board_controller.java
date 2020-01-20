package com.portfordev.pro.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.PrintWriter;
import java.util.Calendar;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.portfordev.pro.domain.Board;
import com.portfordev.pro.domain.Board_file;
import com.portfordev.pro.domain.Board_recommend;
import com.portfordev.pro.domain.Comment;
import com.portfordev.pro.domain.Member;
import com.portfordev.pro.service.MemberService;
import com.portfordev.pro.service.board_service;
import com.portfordev.pro.service.comment_service;

@Controller
public class board_controller {
	@Autowired
	private board_service board_service;

	@Autowired
	private comment_service comment_service;
	
	@Autowired
	private MemberService member_service;

	@Value("${savefoldername}")
	private String save_folder;
	
	@PostMapping("board_delete_action") 
	public String BoardDeleteAction(Board board, HttpServletResponse response) throws Exception { 
		int pass_check = board_service.is_password(board.getBOARD_ID(), board.getBOARD_PASSWORD());
	  
		if (pass_check == -1) { 
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter(); 
			out.println("<script>");
			out.println("alert('비밀번호가 다릅니다');"); 
			out.println("history.back();");
			out.println("</script>"); 
			out.close(); 
			return null; 
		}
		int result = board_service.board_delete(board.getBOARD_ID(), save_folder);
	  
		if (result == 0) { System.out.println("게시판 삭제 실패"); }
	  
		System.out.println("게시판 삭제 성공");
		response.setContentType("text/html;charset=utf-8"); 
		PrintWriter out = response.getWriter(); 
		out.println("<script>");
		out.println("alert('삭제 되었습니다.');");
		out.println("location.href='/pro/board_list?BOARD_CATEGORY="+board.getBOARD_CATEGORY()+"';"); 
		out.println("</script>");
		out.close(); 
		return null; 
	}
	  
	  
	 @PostMapping("board_modify_action") 
	 public String BoardModifyAction(Board board, @RequestParam("FILE_CHANGE") int file_change, RedirectAttributes redirect,
			 ModelAndView mv, HttpServletResponse response, HttpServletRequest request) throws Exception {
		 
		 List<MultipartFile> uploadfile = board.getUploadfile();
		 System.out.println("파일 변경 : " + file_change);
		 
		 if(file_change == 1) { // 파일 변경한 경우
			 board_service.delete_board_file(board.getBOARD_ID(), save_folder);
			 for (MultipartFile mf : uploadfile) {
					if(mf.getSize() == 0) {
						break;
					}
					Board_file board_file = new Board_file();
					String fileName = mf.getOriginalFilename(); // 원래 파일명
					board_file.setBOARD_FILE_ORIGINAL(fileName); // 원래 파일명 저장
					String fileDBName = fileDBName(fileName, save_folder);
					mf.transferTo(new File(save_folder + fileDBName));
					board_file.setBOARD_FILE(fileDBName);
					board_file.setBOARD_ID(board.getBOARD_ID());
					board_service.insert_file(board_file);
			}
		 } else if(file_change == 2){ //파일 삭제한 경우(빈경우)
			 board_service.delete_board_file(board.getBOARD_ID(), save_folder);
		 }
		 int result = board_service.board_edit(board);
		 if (result == 0) { 
			 response.setContentType("text/html;charset=utf-8");
			 PrintWriter out = response.getWriter();
			 out.println("<script>");
			 out.println("alert('수정 실패');");
			 out.println("history.go(-1);");
			 out.println("</script>");
			 out.close();
		 }
		 redirect.addAttribute("board_id", board.getBOARD_ID());
		 return "redirect:board_view_action";
	}

		// 글쓰기
	@PostMapping("/board_add_action")
	public String board_add_action(Board board, RedirectAttributes redirect) throws Exception {
		List<MultipartFile> uploadfile = board.getUploadfile();
		int board_id = board_service.select_max_id();
		board.setBOARD_ID(board_id);
		member_service.add_write_act(board.getMEMBER_ID(), 5);
		board_service.insert_board(board); // 저장 메서드 호출
		for (MultipartFile mf : uploadfile) {
			if(mf.getSize() == 0) {
				break;
			}
			Board_file board_file = new Board_file();
			String fileName = mf.getOriginalFilename(); // 원래 파일명
			board_file.setBOARD_FILE_ORIGINAL(fileName); // 원래 파일명 저장
			String fileDBName = fileDBName(fileName, save_folder);
			mf.transferTo(new File(save_folder + fileDBName));
			board_file.setBOARD_FILE(fileDBName);
			board_file.setBOARD_ID(board_id);
			board_service.insert_file(board_file);
		}
		redirect.addAttribute("BOARD_CATEGORY", board.getBOARD_CATEGORY());
		return "redirect:/board_list";

	}
	  
	@PostMapping("board_password_check")
	public void board_password_check(@RequestParam("BOARD_PASSWORD") String password, 
			@RequestParam("BOARD_ID") int id, HttpServletResponse response) throws Exception {
		int result = board_service.is_password(id, password);
		System.out.println(result);
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(result);
	}
	@GetMapping("board_edit_view") 
	public ModelAndView BoardModifyView(int num, ModelAndView mv, 
			HttpServletResponse response, HttpServletRequest request) throws Exception { 
		Board board = board_service.getDetail(num); 
		List<Board_file> board_file_list = board_service.get_file_list(num);
		if (board == null) {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('상세보기 실패');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
		} else {
			mv.addObject("board_data", board);
			mv.addObject("board_file_list",board_file_list);
			System.out.println(board.getBOARD_CONTENT());
			mv.setViewName("board/board_edit"); 
		}
		return mv; 
	}
	
	  
	@GetMapping("board_file_down")
	public void BoardFileDown(String filename, HttpServletRequest request, String original, HttpServletResponse response) throws Exception {
		ServletContext context = request.getSession().getServletContext();
				
		String sFilePath = save_folder +"/"+filename;
		System.out.println(sFilePath);
		
		byte b[] = new byte[4096];
		// sFilePath에 있는 파일의 MimeType을 구해온다.
		String sMimeType = context.getMimeType(sFilePath);
		System.out.println("sMimeType>>>" + sMimeType);
		
		if(sMimeType == null)
			sMimeType = "application/octet-stream";
		
		response.setContentType(sMimeType);
		String sEncoding = new String(original.getBytes("utf-8"), "ISO-8859-1");
		System.out.println(sEncoding);
		
		response.setHeader("Content-Disposition", "attachment; filename= " + sEncoding);
		
		
		try (
			BufferedOutputStream out2 = new BufferedOutputStream(response.getOutputStream());
			BufferedInputStream in = new BufferedInputStream(new FileInputStream(sFilePath));) 
		{
			int numRead;
			while((numRead = in.read(b, 0, b.length)) != -1) {// 읽은 데이터가 
				out2.write(b, 0, numRead);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	
	
	// 게시판 추천 시
	@ResponseBody
	@PostMapping("/reco_add")
	public int reco_add(@RequestParam("board_id") int board_id,
			@RequestParam("member_id") String member_id, HttpServletResponse response) {
		board_service.insert_reco(board_id, member_id);
		member_service.add_receive_act(member_id, board_id, 2);
		int reco_count = board_service.get_reco_count(board_id);
		return reco_count;
	}
	// 게시판 추천 취소 시
	@ResponseBody
	@PostMapping("/reco_delete")
	public int reco_delete(@RequestParam("board_id") int board_id,
			@RequestParam("member_id") String member_id, HttpServletResponse response) {
		board_service.delete_reco(board_id, member_id);
		member_service.add_receive_act(member_id, board_id, -2);
		int reco_count = board_service.get_reco_count(board_id);
		return reco_count;
	}
	
	// 게시판 상세 보기
	@GetMapping("/board_view_action") 
	public ModelAndView Detail(int board_id, ModelAndView mv, HttpServletResponse response, 
			HttpServletRequest request) throws Exception {
		Board board = board_service.getDetail(board_id); 
		if (board == null) {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('상세보기 실패');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
		} else { // 게시판정보, 회원 정보, 파일 리스트, 추천 리스트, 댓글 리스트
			Member member = member_service.get_member(board.getMEMBER_ID());
			List<Board_recommend> board_reco_list = board_service.get_reco_list(board_id);
			System.out.println(board_reco_list);
			List<Board_file> board_file_list = board_service.get_file_list(board_id);
			System.out.println(board_file_list);
			List<Comment> comment_list = comment_service.get_list(board_id); 
			System.out.println(comment_list);
			board.setMEMBER_NAME(member.getMEMBER_NAME());
			board.setMEMBER_ACT(member.getMEMBER_ACT());
			 
			board.setBOARD_COMMENT(""+((comment_list == null) ? 0:comment_list.size()));
			board.setBOARD_RECO(board_reco_list == null ? 0:board_reco_list.size());
			
			System.out.println("상세보기 성공"); 
			
			mv.setViewName("board/board_view");
			mv.addObject("board_file_list", board_file_list);
			mv.addObject("board_reco_list",board_reco_list);
			mv.addObject("comment_list", comment_list); 
			mv.addObject("board_data", board); 
		}	
		return mv; 
	  }
	

	// 답글쓰기
	 @PostMapping("/board_reply_action") 
	 public String BoardReplyAction(Board board, RedirectAttributes redirect)
			 throws Exception { 
		 List<MultipartFile> uploadfile = board.getUploadfile();
		 int board_id = board_service.select_max_id();
		 board.setBOARD_ID(board_id);
		 member_service.add_write_act(board.getMEMBER_ID(), 5);
		 board_service.insert_board_Reply(board); 
		 
		 for (MultipartFile mf : uploadfile) {
				if(mf.getSize() == 0) {
					break;
				}
				Board_file board_file = new Board_file();
				String fileName = mf.getOriginalFilename(); // 원래 파일명
				board_file.setBOARD_FILE_ORIGINAL(fileName); // 원래 파일명 저장
				String fileDBName = fileDBName(fileName, save_folder);
				mf.transferTo(new File(save_folder + fileDBName));
				board_file.setBOARD_FILE(fileDBName);
				board_file.setBOARD_ID(board_id);
				board_service.insert_file(board_file);
			}
		 
		 redirect.addAttribute("BOARD_CATEGORY", board.getBOARD_CATEGORY());
		 return "redirect:board_list";
	 }
	// 썸머노트 이미지 넣을 경우 서버에 저장
	@ResponseBody
	@PostMapping("/summer_image")
	public void summer_image(MultipartFile file, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String file_name = file.getOriginalFilename();
		String server_file_name = fileDBName(file_name, save_folder);
		System.out.println("server file : " + server_file_name);
		file.transferTo(new File(save_folder + server_file_name));
		out.println("resources/upload"+server_file_name);
		out.close();
	}
	

	// 글쓰기
	@GetMapping(value = "/board_write") // RequestMapping(value="/BoardWrite.bo", method=RequestMethod.GET)
	public ModelAndView board_write(
			@RequestParam(value = "BOARD_CATEGORY", defaultValue = "0", required = false) int BOARD_CATEGORY,
			 HttpSession session,	HttpServletResponse response, ModelAndView mv) throws Exception {
		if(session.getAttribute("id") == null) {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('로그인을 해주세요.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
		}
		mv.setViewName("board/board_add");
		mv.addObject("BOARD_CATEGORY", BOARD_CATEGORY);
		return mv;
	}
	@GetMapping("board_reply_view")
	public ModelAndView BoardReplyView(int id, ModelAndView mv, HttpServletRequest request, HttpSession session, HttpServletResponse response) throws Exception{
		if(session.getAttribute("id") == null) {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('로그인을 해주세요.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
		}
		Board board = board_service.getDetail(id); 
		mv.addObject("board_data", board); 
		mv.setViewName("board/board_reply"); 
		
		return mv; 
	}
	
	
	// 게시판 리스트
	@RequestMapping(value = "/board_list", method = { RequestMethod.GET })
	public ModelAndView boardList(@RequestParam(value = "page", defaultValue = "1", required = false) int page,
			@RequestParam(value = "search_select", defaultValue = "1", required = false) int search_select,
			@RequestParam(value = "search_text", defaultValue = "", required = false) String search_text,
			@RequestParam(value = "BOARD_CATEGORY", defaultValue = "0", required = false) int BOARD_CATEGORY,
			@RequestParam(value = "sort", defaultValue="BOARD_DATE", required = false) String sort,
			ModelAndView mv) throws Exception {
		int limit = 15;
		int list_count = board_service.getListCount(search_select, search_text, BOARD_CATEGORY); // 총 리스트 수를 받아옴
		System.out.println(list_count);
		// 총 페이지 수
		int max_page = (list_count + limit - 1) / limit;
		// 현재 페이지에 보여줄 시작 페이지 수
		int start_page = ((page - 1) / 10) * 10 + 1;
		// 현재 페이지에 보여줄 마지막 페이지 수(10, 20, 30...)
		int end_page = start_page + 10 - 1;

		if (end_page > max_page)
			end_page = max_page;

		List<Board> board_list = board_service.getBoardList(page, limit, search_select, search_text, BOARD_CATEGORY, sort);
		System.out.println(board_list);
		mv.setViewName("board/board_list");
		mv.addObject("page", page);
		mv.addObject("max_page", max_page);
		mv.addObject("start_page", start_page);
		mv.addObject("end_page", end_page);
		mv.addObject("list_count", list_count);
		mv.addObject("board_list", board_list);
		mv.addObject("search_select", search_select);
		mv.addObject("search_text", search_text);
		mv.addObject("limit", limit);
		mv.addObject("BOARD_CATEGORY", BOARD_CATEGORY);
		return mv;
	}

	/*
	@ResponseBody 
	@RequestMapping(value = "/BoardListAjax.bo", method = {RequestMethod.POST })
	public Object boardListAjax(@RequestParam(value = "page", defaultValue = "1", required = false) int page,
			@RequestParam(value = "limit", defaultValue = "10", required = false) int limit,
			@RequestParam(value = "search_select", defaultValue = "1", required = false) int search_select,
			@RequestParam(value = "search_text", defaultValue = "", required = false) String search_text ) throws Exception { 
		int listcount = board_service.getListCount(search_select, search_text); // 총 리스트 수를 받아옴 
		// 총 페이지 수 
		int maxpage = (listcount + limit - 1) / limit; // 현재 페이지에 보여줄 시작 페이지 수
		int startpage = ((page - 1) / 10) * 10 + 1; // 현재 페이지에 보여줄 마지막 페이지 수(10, 20,30...) 
		int endpage = startpage + 10 - 1;
	
		if (endpage > maxpage) endpage = maxpage;
	
		List<Board> boardlist = board_service.getBoardList(page, limit,search_select, search_text); 
		//BoardAjax 이용하기 
		Board_ajax ba = new Board_ajax();
		ba.setPage(page); 
		ba.setMaxpage(maxpage); 
		ba.setStartpage(startpage);
		ba.setEndpage(endpage); 
		ba.setListcount(listcount);
		ba.setBoardlist(boardlist); 
		ba.setSearch_select(search_select);
		ba.setLimit(limit);
		 
	
	 return ba; }
	*/
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
