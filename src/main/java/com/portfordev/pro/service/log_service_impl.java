package com.portfordev.pro.service;

import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.portfordev.pro.dao.member_log_dao;
import com.portfordev.pro.domain.Alert;
import com.portfordev.pro.domain.Member_log;

@Service
public class log_service_impl implements log_service{
	@Autowired
	private member_log_dao dao;
	
	@Override
	public void insert_log(Member_log log) {
		dao.insert_log(log);
	}
	@Override
	public int get_log_count(String MEMBER_ID) {
		return dao.get_log_count(MEMBER_ID);
	}
	@Override
	public List<Member_log> get_log_list(int page, int limit, String MEMBER_ID) {
		Map<String, Object> map = new HashMap<String, Object>();
		int startrow = (page-1)*limit+1;
		int endrow = startrow+limit-1;
		map.put("start", startrow);
		map.put("end", endrow);
		map.put("member_id", MEMBER_ID);
		return dao.get_log_list(map);
	}
	@Override
	public void insert_alert(Alert alert) {
		if(alert.getMEMBER_ID().equals(alert.getALERT_REQ_MEMBER())) {
			return;
		}
		dao.insert_alert(alert);
	}
	@Override
	public List<Alert> get_alert_list(String MEMBER_ID) {
		List<Alert> alert_list = dao.get_alert_list(MEMBER_ID);
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date time = new Date();
		String str_today = format.format(time);
		String str_day = str_today.substring(0, 10);
		String str_time = str_today.substring(11);
		String[] day_array = str_day.split("-");
		int[] day_array_int = Arrays.stream(day_array).mapToInt(day -> Integer.parseInt(day)).toArray();
		String[] time_array = str_time.split(":");
		int[] time_array_int = Arrays.stream(time_array).mapToInt(times -> Integer.parseInt(times)).toArray();
		
		alert_list.forEach(alert -> {
			String alert_date = alert.getALERT_DATE();
			String alert_day = alert_date.substring(0, 10);
			String alert_time = alert_date.substring(11);
			String[] alert_day_array = alert_day.split("-");
			int[] alert_day_array_int = Arrays.stream(alert_day_array).mapToInt(day -> Integer.parseInt(day)).toArray();
			String[] alert_time_array = alert_time.split(":");
			int[] alert_time_array_int = Arrays.stream(alert_time_array).mapToInt(times -> Integer.parseInt(times)).toArray();
			
			int year_gap = day_array_int[0] - alert_day_array_int[0];
			int month_gap = day_array_int[1] - alert_day_array_int[1];
			int day_gap = day_array_int[2] - alert_day_array_int[2];
			int hour_gap = time_array_int[0] - alert_time_array_int[0];
			int min_gap = time_array_int[1] - alert_time_array_int[1];
			int sec_gap = time_array_int[2] - alert_time_array_int[2];
			
			if(year_gap > 0) {
				alert.setALERT_DATE(""+year_gap+"년 전");
			} else if(month_gap > 0){
				alert.setALERT_DATE(""+month_gap+"달 전");
			} else if(day_gap > 0) {
				alert.setALERT_DATE(""+day_gap+"일 전");
			} else if(hour_gap > 0) {
				alert.setALERT_DATE(""+hour_gap+"시간 전");
			} else if(min_gap > 0) {
				alert.setALERT_DATE(""+min_gap+"분 전");
			} else if(sec_gap > 0) {
				alert.setALERT_DATE(""+sec_gap+"초 전");
			} else {
				alert.setALERT_DATE("방금 전");
			}
		});
		
		return alert_list;
	}
	@Override
	public int get_unread_count(String MEMBER_ID) {
		return dao.get_unread_count(MEMBER_ID);
	}
	@Override
	public void update_alert(String MEMBER_ID) {
		dao.update_alert(MEMBER_ID);
	}
}