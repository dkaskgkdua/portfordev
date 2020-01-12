package com.portfordev.pro.controller;

import java.io.File;
import java.util.Calendar;
import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.portfordev.pro.domain.Board;
import com.portfordev.pro.service.board_service;
import com.portfordev.pro.service.comment_service;

@Controller
public class board_controller {
	@Autowired
	private board_service board_service;
	
	@Autowired
	private comment_service comment_service;
	
	@Value("${savefoldername}")
	private String save_folder;
	/*
	@PostMapping("BoardDeleteAction.bo")
	public String BoardDeleteAction(String BOARD_PASS, int num, HttpServletResponse response) throws Exception {
		boolean usercheck = board_service.isBoardWriter(num, BOARD_PASS);
		
		if (usercheck == false) {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('비밀번호가 다릅니다!');");
			out.println("history.back();");
			out.println("</script>");
			out.close();
			return null;
		}

		int result = board_service.boardDelete(num);

		if (result == 0) {
			System.out.println("게시판 삭제 실패");
		}

		System.out.println("게시판 삭제 성공");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("alert('삭제 되었습니다.');");
		out.println("location.href='BoardList.bo';");
		out.println("</script>");
		out.close();
		return null;
	}
	
	@GetMapping("BoardFileDown.bo")
	public void BoardFileDown(String filename, HttpServletRequest request, String original, HttpServletResponse response) throws Exception {
		String savePath = "resources/upload";
		// 서블릿 실행 환경 정보를 담고 있는 객체를 리턴
		ServletContext context = request.getSession().getServletContext();
		String sDownloadPath = context.getRealPath(savePath);
		// 1. 직접 경로 설정
		// String sFilePath = sDownloadpath + "\\" + fileName;
		// "\"를 추가하기 위해 "\\"를 사용
		//String sFilePath = sDownloadPath + "/" + filename;
		
		// 2. properties 활용 경로 설정
		String sFilePath = save_folder +"/"+filename;
		System.out.println(sFilePath);
		
		byte b[] = new byte[4096];
		// sFilePath에 있는 파일의 MimeType을 구해온다.
		String sMimeType = context.getMimeType(sFilePath);
		System.out.println("sMimeType>>>" + sMimeType);
		
		if(sMimeType == null)
			sMimeType = "application/octet-stream";
		
		response.setContentType(sMimeType);
		// - 이 부분이 한글 파일명이 깨지는 것을 방지해준다.
		String sEncoding = new String(original.getBytes("utf-8"), "ISO-8859-1");
		System.out.println(sEncoding);
		
		//  Content-Disposition : attachment : 브라우저는 해당 Content를 처리하지 않고,
		response.setHeader("Content-Disposition", "attachment; filename= " + sEncoding);
		
		// 프로젝트 속성 - Project-facets에서 자바버전 1.8로 수정
		try (
			// 웹브라우저로의 출력 스트림을 생성한다.
			BufferedOutputStream out2 
			= new BufferedOutputStream(response.getOutputStream());
			
			// sFilePath로 지정한 팡리에 대한 입력 스트림을 생성한다.
			BufferedInputStream in 
			= new BufferedInputStream(new FileInputStream(sFilePath));) 
		{
			int numRead;
			// read(b, 0, b.length) : 바이트 배열 b의 0번 부터 b.length
			// 크기 만큼 읽어옵니다.
			while((numRead = in.read(b, 0, b.length)) != -1) {// 읽은 데이터가 
				// 바이트 배열 b의 0번부터 numRead크기 만큼 브라우저로 출력
				out2.write(b, 0, numRead);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	@PostMapping("BoardModifyAction.bo")
	public ModelAndView BoardModifyAction(Board board, String before_file, ModelAndView mv, HttpServletResponse response,
			HttpServletRequest request) throws Exception {
		boolean usercheck = board_service.isBoardWriter(board.getBOARD_ID(), board.getBOARD_PASSWORD());
		// 비밀번호가 다를 경우
		if (usercheck == false) {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('비밀번호가 다릅니다!');");
			out.println("history.back();");
			out.println("</script>");
			out.close();
			return null;
		}
		MultipartFile uploadfile = board.getUploadfile();
		String saveFolder = request.getSession().getServletContext().getRealPath("resources") + "/upload/";

		if (uploadfile != null && !uploadfile.isEmpty()) { // 파일 변경한 경우
			System.out.println("변경");
			String fileName = uploadfile.getOriginalFilename();
			board.setBOARD_ORIGINAL(fileName);

			String fileDBName = fileDBName(fileName, saveFolder);
			// transferTo(File path) : 업로드한 파일을 매개변수의 경로에 저장합니다.
			uploadfile.transferTo(new File(saveFolder + fileDBName));

			// 바뀐 파일명으로 저장
			board.setBOARD_FILE(fileDBName);

		} else { // uploadfile.isEmpty() 인경우 - 파일 선택하지 않은 경우
			System.out.println(" uploadfile.isEmpty()");
			// <input type="hidden" name="BOARD_ORIGINAL"
			// value="${boarddata.BOARD_ORIGINAL}">
			// 위 태그에 값이 있다면 ""로 값을 변경합니다.
			board.setBOARD_ORIGINAL("");
		}

		// DAO에서 수정 메서드 호출하여 수정합니다.
		int result = boardService.boardModify(board);

		// 수정에 실패시
		if (result == 0) {
			System.out.println("게시판 수정 실패!");
			mv.setViewName("error/error");
			mv.addObject("url", request.getRequestURL());
			mv.addObject("message", "게시판 수정 실패~");
		} else {
			System.out.println("게시판 수정 완료!");
			String url = "redirect:BoardDetailAction.bo?num=" + board.getBOARD_NUM();
			
			// 수정 전에 파일이 있고 새로운 파일을 선택한 경우는 삭제할 목록을 테이블에 추가한다.
			if(!before_file.equals("") && !before_file.equals(board.getBOARD_FILE())) {
				boardService.insert_deleteFile(before_file);
			}
			// 수정한 글 내용을 보여주기 위하여 글 내용 보기 페이지로 이동할 경로를 설정합니다.
			mv.setViewName(url);
		}
		return mv;
	}

	@GetMapping("BoardModifyView.bo")
	public ModelAndView BoardModifyView(int num, ModelAndView mv, HttpServletRequest request) throws Exception {
		Board board = board_service.getDetail(num);
		if (board == null) {
			mv.setViewName("error/error");
			mv.addObject("url", request.getRequestURL());
			mv.addObject("message", "게시판 수정 페이지 가져오기 실패");
		} else {
			mv.addObject("boarddata", board);
			mv.setViewName("board/qna_board_modify");
		}
		return mv;
	}

	@PostMapping("BoardReplyAction.bo")
	public ModelAndView BoardReplyAction(Board board, ModelAndView mv, HttpServletRequest request) throws Exception {
		int result = boardService.boardReply(board);
		if (result == 0) {
			mv.setViewName("error/error");
			mv.addObject("url", request.getRequestURL());
			mv.addObject("message", "게시판 답변글 가져오기 실패");
		} else {
			mv.setViewName("redirect:BoardList.bo");
		}
		return mv;
	}

	@GetMapping("BoardReplyView.bo")
	public ModelAndView BoardReplyView(int num, ModelAndView mv, HttpServletRequest request) {
		Board board = board_service.getDetail(num);
		if (board == null) {
			mv.setViewName("error/error");
			mv.addObject("url", request.getRequestURL());
			mv.addObject("message", "게시판 답변 작성페이지 가져오기 실패");
		} else {
			mv.addObject("boarddata", board);
			mv.setViewName("board/qna_board_reply");
		}
		return mv;
	}

	// 상세보기
	@GetMapping("/BoardDetailAction.bo")
	public ModelAndView Detail(int num, ModelAndView mv, HttpServletRequest request) {
		Board board = board_service.getDetail(num);
		if (board == null) {
			System.out.println("상세 보기 실패");
			mv.setViewName("error/error");
			mv.addObject("url", request.getRequestURL());
			mv.addObject("message", "상세보기 실패입니다.");
		} else {
			System.out.println("상세보기 성공");
			int count = commentService.getListCount(num);
			mv.setViewName("board/qna_board_view");
			mv.addObject("count", count);
			mv.addObject("boarddata", board);
		}

		return mv;
	}

	// 글쓰기
	@PostMapping("/BoardAddAction.bo")
	// @RequestMapping(value="/BoardAddAction.bo", method = RequestMethod.POST)
	public String bbs_write_ok(Board board, Board_file board_file, HttpServletRequest request) throws Exception {
		List<MultipartFile> uploadfile = board_file.getUploadfile();
		int board_id = board_service.select_max_id();
		board.setBOARD_ID(board_id);
		for(MultipartFile mf : uploadfile) {
			String fileName = mf.getOriginalFilename(); // 원래 파일명
			board_file.setBOARD_FILE_ORIGINAL(fileName); // 원래 파일명 저장
			String fileDBName = fileDBName(fileName, save_folder);
			mf.transferTo(new File(save_folder+fileDBName));
			board_file.setBOARD_FILE(fileDBName);
			board_file.setBOARD_ID(board_id);
			board_service.insert_file(board_file);
		}
		board_service.insert_board(board); // 저장 메서드 호출

		return "redirect:BoardList.bo";

	}

	// 글쓰기
	@GetMapping(value = "/BoardWrite.bo") // RequestMapping(value="/BoardWrite.bo", method=RequestMethod.GET)
	public String board_write() throws Exception {
		return "board/qna_board_write";
	}*/

	@RequestMapping(value = "/board_list", method = { RequestMethod.GET})
	public ModelAndView boardList(@RequestParam(value = "page", defaultValue = "1", required = false) int page,
			@RequestParam(value = "search_select", defaultValue = "1", required = false) int search_select,
			@RequestParam(value = "search_text", defaultValue = "", required = false) String search_text,
			@RequestParam(value = "BOARD_CATEGORY", defaultValue = "0", required = false) int BOARD_CATEGORY,
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
		
		List<Board> board_list = board_service.getBoardList(page, limit, search_select, search_text, BOARD_CATEGORY);
		System.out.println(board_list);
		mv.setViewName("board/board_list");
		mv.addObject("page", page);
		mv.addObject("max_page", max_page);
		mv.addObject("start_page", start_page);
		mv.addObject("end_page", end_page);
		mv.addObject("list_count", list_count);
		mv.addObject("board_list", board_list);
		mv.addObject("search_select", search_select);
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
			@RequestParam(value = "search_text", defaultValue = "", required = false) String search_text
			) throws Exception {
		int listcount = board_service.getListCount(search_select, search_text); // 총 리스트 수를 받아옴
		// 총 페이지 수
		int maxpage = (listcount + limit - 1) / limit;
		// 현재 페이지에 보여줄 시작 페이지 수
		int startpage = ((page - 1) / 10) * 10 + 1;
		// 현재 페이지에 보여줄 마지막 페이지 수(10, 20, 30...)
		int endpage = startpage + 10 - 1;

		if (endpage > maxpage)
			endpage = maxpage;

		List<Board> boardlist = board_service.getBoardList(page, limit, search_select, search_text);
		//BoardAjax 이용하기
		BoardAjax ba = new BoardAjax();
		ba.setPage(page);
		ba.setMaxpage(maxpage);
		ba.setStartpage(startpage);
		ba.setEndpage(endpage);
		ba.setListcount(listcount);
		ba.setBoardlist(boardlist);
		ba.setSearch_select(search_select);
		ba.setLimit(limit);
		
		// Map 이용하기
		/* Map<String, Object> ba = new HashMap<String, Object>();
		 * ba.put("page",page);
		 * ba.put("maxpage", maxpage);
		 * ba.put("startpage", startpage);
		 * ba.put("endpage", endpage);
		 * ba.put("listcount", listcount);
		 * ba.put("boardlist", boardlist);
		 * ba.put("limit",limit);
		 */
		/*
		return ba;
	}
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
