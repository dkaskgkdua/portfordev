package com.portfordev.pro.domain;

import org.jsoup.select.Elements;

import lombok.Data;

@Data
public class ItNews 
{
	//private int display;
	private String title;
	private String originallink;
	private String link;
	private String description;
	private String pubDate;
	private Elements image;
	private Elements headLine;
}
