package com.portfordev.pro.service;

import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Service;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;
import org.xmlpull.v1.XmlPullParserFactory;

import com.portfordev.pro.domain.ItNews;

@Service
public class it_news_service
{
	private static String clientID = "T8AzO0BiUJfCTfNXMUf2";
	private static String clientSecret = "2t_11oEDPb";
	
	// display ==> 몇개 출력
	// start ==> 몇번째부터 (item)
	public List<ItNews> searchItNews(int display, int start)
	{
		List<ItNews> list = null;
		try
		{
            URL url;
            url = new URL("https://openapi.naver.com/v1/search/"
                    + "news.xml?query="
                    + URLEncoder.encode("IT", "UTF-8")
                    + (display !=0 ? "&display=" +display :"")
                    + (start !=0 ? "&start=" +start :"")
                    + "&sort=sim");
 
            URLConnection urlConn = url.openConnection();
            urlConn.setRequestProperty("X-Naver-Client-Id", clientID);
            urlConn.setRequestProperty("X-Naver-Client-Secret", clientSecret);
            
            XmlPullParserFactory factory = XmlPullParserFactory.newInstance();
            XmlPullParser parser = factory.newPullParser();
            parser.setInput(
                    new InputStreamReader(urlConn.getInputStream()));
            
            int eventType = parser.getEventType();
            ItNews n = null;
            while (eventType != XmlPullParser.END_DOCUMENT) {
                switch (eventType) 
                {
	                case XmlPullParser.END_DOCUMENT: // 문서의 끝
	                    break;
	                case XmlPullParser.START_DOCUMENT:
	                    list = new ArrayList<ItNews>();
	                    break;
	                case XmlPullParser.END_TAG: {
	                    String tag = parser.getName();
	                    if(tag.equals("item"))
	                    {
	                    	list.add(n);
	                        n = null;
	                    }
	                }
	                case XmlPullParser.START_TAG: {
	                    String tag = parser.getName();
	                    switch (tag) {
	                    case "item":
	                        n = new ItNews();
	                        break;
	                    case "title":
	                        if(n != null)
	                            n.setTitle(parser.nextText());
	                        break;
	                    case "originallink":
	                    	if(n != null)
	                            n.setOriginallink(parser.nextText());
	                        break;
	                    case "link":
	                        if(n != null)
	                            n.setLink(parser.nextText());
	                        break;
	                    case "description":
	                        if(n != null)
	                            n.setDescription(parser.nextText());
	                        break;
	                    case "pubDate":
	                        if(n != null)
	                            n.setPubDate(parser.nextText());
	                        break;
	                    }
	                }
                }
                eventType = parser.next();
            }
        }
		catch (MalformedURLException e)
		{
			e.printStackTrace();
        }
		catch (UnsupportedEncodingException e)
		{
            e.printStackTrace();
        }
		catch (IOException e)
		{
            e.printStackTrace();
        }
		catch (XmlPullParserException e)
		{
            e.printStackTrace();
        }
        return list;
    }
	public List<ItNews> breakingNews(String category)
	{
		List<ItNews> list = null;
		String newsUrl = "";
		try
		{
			list = new ArrayList<ItNews>();
			if(category.equals("IT일반"))
				newsUrl = "https://news.naver.com/main/list.nhn?mode=LS2D&mid=sec&sid1=105&sid2=230&listType=photo";
			else if(category.equals("컴퓨터"))
				newsUrl = "https://news.naver.com/main/list.nhn?mode=LS2D&mid=sec&sid1=105&sid2=283&listType=photo";
			else if(category.equals("인터넷"))
				newsUrl = "https://news.naver.com/main/list.nhn?mode=LS2D&mid=sec&sid1=105&sid2=226&listType=photo";
	        Document doc = Jsoup.connect(newsUrl).get();
	        for(int j = 1; j <= 5; j++)
	        {
	        	for(int i = 1; i <= 4; i++)
		        {
	        		ItNews news = new ItNews();
	        		Elements thumbImg = doc.select("#main_content>div.list_body.newsflash_body>ul>li:nth-child("+j+")>table>tbody>tr:nth-child(1)>td:nth-child("+i+")>a>img");
		        	Elements headLineE = doc.select("#main_content>div.list_body.newsflash_body>ul>li:nth-child("+j+")>table>tbody>tr.tit>td:nth-child("+i+")> a");
		        	String imgSrc = thumbImg.attr("src");
		        	String aHref = headLineE.attr("href");
		        	String headLine = headLineE.text();
		        	news.setImage(imgSrc);
		        	news.setHeadLine(headLine);
		        	news.setLink(aHref);
		        	list.add(news);
		        }
	        }       
		}
		catch(IOException ioe)
		{
			ioe.printStackTrace();
		}
		return list;
	}
}