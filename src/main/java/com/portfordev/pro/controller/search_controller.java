package com.portfordev.pro.controller;

import java.io.File;
import java.io.FilenameFilter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.portfordev.pro.domain.Board;
import com.portfordev.pro.domain.Member;
import com.portfordev.pro.domain.Portfolio;
import com.portfordev.pro.service.search_service_impl;

@Controller
public class search_controller {
   @Autowired 
   private search_service_impl service;

   @Value("${savefoldername}")
   private String save_folder;
   
   @RequestMapping(value="/search")
   public ModelAndView searchview(ModelAndView mv,HttpServletRequest request,String search)throws Exception{
      String s[] = search.split(" ");
      System.out.println("검색될 문자 개수 "+s.length);
      List<Member>memberresult=new ArrayList<Member>();
      List<Board>boardresult = new ArrayList<Board>();
      List<Board>studyresult = new ArrayList<Board>();
      List<Board>qnaresult = new ArrayList<Board>();
      List<Portfolio>portresult = new ArrayList<Portfolio>();
      
      
      
//      for(int i=0; i<s.length; i++) {
//         memberresult.addAll(service.searchMember(s[i]));
//         boardresult.addAll(service.searchBoard(s[i]));
//         
//         
//         System.out.println("검색 키워드="+s[i]);
//      }
      
      memberresult=service.searchMember(search);
      boardresult= service.searchBoard(search);
      studyresult =service.searchStudy(search);
      qnaresult = service.searchQnA(search);
      portresult = service.searchPort(search);
      for(Portfolio port : portresult)
      {
         String PORT_FILE_PATH = port.getPORT_FILE_PATH();
         String[] fileList = getFiles(PORT_FILE_PATH);
         String PORT_THUMBNAIL = "Image/no_img.png";
         if(fileList != null) 
            PORT_THUMBNAIL = "upload/" + PORT_FILE_PATH + fileList[0];
         
         port.setPORT_THUMBNAIL(PORT_THUMBNAIL);
         System.out.println("썸네일"+PORT_THUMBNAIL);
         System.out.println("파일패스"+PORT_FILE_PATH);
      }
      
      mv.addObject("searchKeyword",search);
      mv.addObject("boardResult",boardresult);
      mv.addObject("memberResult", memberresult);
      mv.addObject("studyResult",studyresult);
      mv.addObject("qnaResult",qnaresult);
      mv.addObject("portResult",portresult);
      mv.setViewName("search/search");
      
      return mv;
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