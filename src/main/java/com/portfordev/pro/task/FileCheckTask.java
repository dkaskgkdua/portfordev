package com.portfordev.pro.task;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

// import com.portfordev.pro.service.board_service;

@Service
public class FileCheckTask {
	@Value("${savefoldername}")
	private String save_folder;
	
	@Autowired
//	private board_service board_service;
	
	
	/* cron 사용법
	 * seconds(초:0~59) minutes(분:0~59) hours(시:0~23) day(일:1~31)
	 * months(달:1~12) day of week(요일:0~6) year(optional)             
	 *               초 분   시  일 달 요일  */
	//@Scheduled(cron="0 0 5 * * *")
	public void checkFiles() throws Exception {
		//board_service.delete_board_image(save_folder);
	}
	
	//@Scheduled(fixedDelay=100000)
	//@Scheduled(fixedRate=5000)
	public void test() throws Exception {
		
		System.out.println("test");
	}
	
}