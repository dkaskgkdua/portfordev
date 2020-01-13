<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE HTML>
<!--
	Theory by TEMPLATED
	templated.co @templatedco
	Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
-->
<html>
	<head>
		<title>검색결과</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="resources/css/main.css" />
		<link rel="stylesheet" href="resources/css/profile_main_slidebar.css" />
		<jsp:include page="../main/navbar.jsp"></jsp:include>
		<script src="resources/js/search.js"></script>
		<style>
		#date{margin-left: 10px;}
		.inner{margin-left: 350px;
    			max-width: 80em}
    	.sidebar{margin-top: 70px;font-size:15pt}
    	.sidebar li{margin-top: 20px;}
		.search_h1{font-size:20pt;margin-top:30px;}
		#search{border:3px solid black!important; width:30%!important;
						margin:0 auto; margin-top: 50px; text-align: center;}
		table tr,td{background: white; border:0px!important;padding:0px!important;}
		.sub{margin-bottom: 50px;}
		img{width:100%}
		.btn img{width:32px}
		table *{vertical-align: text-top;}
		.divimg{display: inline-block;width:130px;margin-right: 20px}
		.search_ul,.search_ul li{list-style: none; vertical-align: text-top!important;padding:0px!important;margin-bottom: 20px;}
		.more{text-align: right;font-size: 15pt; font-weight: bold;}
		.more a{color:black!important;}
		#sidebar_btn{position:absolute; left:240px;top:400px}
		.context_text{display: inline-block;    width: 70%; max-width: 80%;}
		.context_text p {margin-top: 20px; text-overflow: ellipsis; height:50px;}
		#sidebar_btn:hover{cursor: pointer;background:lightgray;border-radius: 100%}
		.search_ul a{font-size: 13pt; font-weight:bold;}
		hr{border:1px solid rgba(0,0,0,.1);}
		.search_board a{text-decoration: underline;}
		.search_board_span{color:black}
		.member_ul a{color:#9a9a9a; font-size: 15pt}
		</style>
	</head>
	<body class="subpage">

			

		<!-- Three -->
			<section id="three" class="wrapper">
			<!-- 사이드바  -->
				<div id="adsideWrapper">
    		<div id="adside" class="fixed"  >
    		<!-- @@@@@@@@@@@사이드바 여는 버튼 -->
			<div>
    		<img src="resources/Image/left.png" style="width:30px" id="sidebar_btn"/>
    		</div>
    		<!-- @@@@@@@@@@@사이드바 여는 버튼 끝-->
    		<div style="width:200px;margin: 0 auto;margin-top: 20px;margin-left: 50px;" id="sidebar">
    			<h1 class="profile_h1 search_h1">MENU</h1>
    			<div class="sidebar">
    			<ul class="search_ul member_ul">
    			<li><a href="#project">PROJECT</a></li>
    			<li><a href="#Memberlist">MEMBER</a></li>
    			<li><a href="#board">FREE BOARD</a></li>
    			<li> <a href="#study">STUDY</a></li>
    			<li><a href="#qna">QnA</a></li>
    			</ul>
    			</div>
    		</div>
    		
			</div>
  			</div>
  			
			<!-- 사이드바 끝 -->
			
			
			
			
			<!-- 본문 내용 -->
			<div class="inner">
			<div class="search_div">
    		<h1 style="text-align: left;margin-top:10px">통합검색>${searchKeyword}</h1>
    		</div>
				<!--@@@@@@@@@@@@@@@@@@@@@@@@ 검색결과  -->
				<div>
				<h1 class="profile_h1 search_h1 sub" id="project">PROJECT</h1>
				
					
					<!--@@@@@@@@@@@@@@@프로젝트 검색결과 -->
					<!-- 한달내에 조회수 높은순 -->
					<ul class="search_ul">
						<li>
							<div class="contentimg divimg"><img src="resources/Image/search_sample.png"/></div>
							<div class="context_text">
								<a href="">어쩌구저쩌구 개발을위한 프로젝트</a><span id="date">2019년 12월 11일</span><br>
								<span>1월 11, 2020 9:07:05 오후 org.apache.catalina.core.ApplicationContext log
									정보: No Spring WebApplicationInitializer types detected on classpath
								1월 11, 2020 9:07:05 오후 org.apache.jasper.servlet.TldScanner scanJars
								1월 11, 2020 9:07:05 오후 org.apache.catalina.core.ApplicationContext log
								정보: No Spring WebApplicationInitializer types detected on classpath
								1월 11, 2020 9:07:05 오후 org.apache.jasper.servlet.TldScanner scanJars</span>
							</div>
						</li>
						<li>
						<div class="contentimg divimg"><img src="resources/Image/search_sample.png"/></div>
						<div class="context_text">
								<a href="">어쩌구저쩌구 개발을위한 프로젝트</a><span id="date">2019년 12월 11일</span><br>
								<span>1월 11, 2020 9:07:05 오후 org.apache.catalina.core.ApplicationContext log
									정보: No Spring WebApplicationInitializer types detected on classpath
								1월 11, 2020 9:07:05 오후 org.apache.catalina.core.ApplicationContext log
								정보: No Spring WebApplicationInitializer types detected on classpath
								1월 11, 2020 9:07:05 오후 org.apache.jasper.servlet.TldScanner scanJars</span>
							</div>
						</li>
						<li>
						<div class="contentimg divimg"><img src="resources/Image/search_sample.png"/></div>
						<div class="context_text">
								<a href="">어쩌구저쩌구 개발을위한 프로젝트</a><span id="date">2019년 12월 11일</span><br>
								<span>1월 11, 2020 9:07:05 오후 org.apache.catalina.core.ApplicationContext log
									정보: No Spring WebApplicationInitializer types detected on classpath
								1월 11, 2020 9:07:05 오후 org.apache.jasper.servlet.TldScanner scanJars
								정보: No Spring WebApplicationInitializer types detected on classpath
								1월 11, 2020 9:07:05 오후 org.apache.jasper.servlet.TldScanner scanJars</span>
							</div>
						</li>
						<li class="more"><a href="" >More ></a></li>
					</ul>
					
					
					<!-- @@@@@@@@@@@@@회원 검색결과 -->
					<!-- 등급 높은순 -->
					<hr id="Memberlist">
					<h1 class="profile_h1 search_h1 sub" >MEMBER</h1>
					<ul class="search_ul" >
					<c:if test="${!empty memberResult}">
					<c:forEach var="memberList" items="${memberResult}">
						<li class="search_member">
						<!-- 일등급 -->
						<c:if test="${memberList.MEMBER_ACT>94}">
							<img src="resources/Image/icon/level_1.png" style="width:30px;"/>
						</c:if>	
						<!-- 이등급 -->
						<c:if test="${memberList.MEMBER_ACT >79 && memberList.MEMBER_ACT <95}">
							<img src="resources/Image/icon/level_2.png" style="width:30px;"/>
						</c:if>	
						<!-- 삼등급 -->
						<c:if test="${memberList.MEMBER_ACT >49 && memberList.MEMBER_ACT <80}">
							<img src="resources/Image/icon/level_3.png" style="width:30px;"/>
						</c:if>	
						<!-- 사등급 -->
						<c:if test="${memberList.MEMBER_ACT >29 && memberList.MEMBER_ACT <50} ">
							<img src="resources/Image/icon/level_4.png" style="width:30px;"/>
						</c:if>	
						<!-- 오등급 -->
						<c:if test="${memberList.MEMBER_ACT >=0 && memberList.MEMBER_ACT <30}">
							<img src="resources/Image/icon/level_5.png" style="width:30px;"/>
						</c:if>	
							<a href="">${memberList.MEMBER_ID}</a>
							<br>
							<div class="context_text">
							<span class="search_board_span">자기소개 어쩌구 저는 어디서 뭐뭐뭐ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ</span>
							</div>
							<br>
							<c:if test="${memberList.REG_DATE!=null}">
								<span>총 피드백 : 4    &nbsp; 최근 피드백 등록일 : ${memberList.REG_DATE}</span> 
							</c:if>
							<c:if test="${memberList.REG_DATE==null}">
								<span>총 피드백 : 0</span> 
							</c:if>
						</li>
					</c:forEach>
						
						<li class="more"><a href="" >More ></a></li>
					</c:if>
					<!-- 검색결과 없으면 -->
					<c:if test="${empty memberResult}">
						<h1 style="color:gray">회원 검색결과가 존재 하지 않습니다.</h1>
					</c:if>	
					</ul>
					
					
					<!-- @@@@@@@@@@@@@게시판 검색결과 -->
					<hr id="board">
					<h1 class="profile_h1 search_h1 sub">FREE BOARD</h1>
					<ul class="search_ul search_board">
						<li>
							<a href="">날씨가 좋아요</a><span id="date">2019년 12월 11일</span>
							<br>
							<div class="context_text">
							<span class="search_board_span">안녕하세요 어쩌구저꺼주자ㅜ기dddddddddddddddddddddddddddddddddddddd
							dddddddddddddddaaaaaaddddddddddddddddddddddddddddddddddddddddddddddd바ㅜㅏㅣ적어도 하나의 JAR가 TLD들을 찾기 위해 스캔되었으나 아무 것도 찾지 못했습니다. 스캔했으나 TLD가 없는 JAR들의 전체 목록을 보시려면, 로그 레벨을 디버그 레벨로 설정하십시오. 스캔 과정에서 불필요한 JAR들을 건너뛰면, 시스템 시작 시간과 JSP 컴파일 시간을 단축시킬 수 있습니다.
							1월 11, 2020 9:07:05 오후 org.apache.catalina.core.ApplicationContext log
							정보: Initializing Spring root WebApplicationContext
							INFO : org.springframework.web.context.ContextLoader - Root WebApplicationContext: initialization started
							INFO : org.springframework.web.context.ContextLoader - Root WebApplicationContext initialized in 1898 ms
							1월 11, 2020 9:07:07 오후 org.apache.catalina.core.ApplicationContext log
							정보: Initializing Spring DispatcherServlet 'appServlet'
							INFO : org.springframework.web.servlet.D</span>
							</div>
							<p>작성자 : lde1245</p>
						</li>
						
						<li>
							<a href="">maven은 이렇게 잡으시면됩니다.</a><span id="date">2019년 12월 11일</span>
							<br>
							<div class="context_text">
							<span class="search_board_span">server에서 add project 할때 올릴 프로젝트가 없다고나올때</span>
							</div>
							<p>작성자 : lde1245</p>
						</li>
						
						<li>
							<a href="">maven은 이렇게 잡으시면됩니다.</a><span id="date">2019년 12월 11일</span>
							<br>
							<div class="context_text">
							<span class="search_board_span">server에서 add project 할때 올릴 프로젝트가 없다고나올때</span>
							</div>
							<p>작성자 : lde1245</p>
						</li>
						
						<li>
							<a href="">날씨가 좋아요</a><span id="date">2019년 12월 11일</span>
							<br>
							<div class="context_text">
							<span class="search_board_span">안녕하세요 어쩌구저꺼주자ㅜ기dddddddddddddddddddddddddddddddddddddd
							dddddddddddddddaaaaaaddddddddddddddddddddddddddddddddddddddddddddddd바ㅜㅏㅣ적어도 하나의 JAR가 TLD들을 찾기 위해 스캔되었으나 아무 것도 찾지 못했습니다. 스캔했으나 TLD가 없는 JAR들의 전체 목록을 보시려면, 로그 레벨을 디버그 레벨로 설정하십시오. 스캔 과정에서 불필요한 JAR들을 건너뛰면, 시스템 시작 시간과 JSP 컴파일 시간을 단축시킬 수 있습니다.
							1월 11, 2020 9:07:05 오후 org.apache.catalina.core.ApplicationContext log
							정보: Initializing Spring root WebApplicationContext
							INFO : org.springframework.web.context.ContextLoader - Root WebApplicationContext: initialization started
							INFO : org.springframework.web.context.ContextLoader - Root WebApplicationContext initialized in 1898 ms
							1월 11, 2020 9:07:07 오후 org.apache.catalina.core.ApplicationContext log
							정보: Initializing Spring DispatcherServlet 'appServlet'
							INFO : org.springframework.web.servlet.D</span>
							</div>
							<p>작성자 : lde1245</p>
						</li>
						
						<li class="more"><a href="" >More ></a></li>
					</ul>
					
					<hr id="study">
					<!-- @@@@@@@@@@@@@스터디 검색결과 -->
					<h1 class="profile_h1 search_h1 sub">STUDY</h1>
					<ul class="search_ul">
						<li>
							<a href="">스터디원 모집합니다..</a><span id="date">2019년 12월 11일</span>
							<br>
							<div class="context_text">
							<span class="search_board_span">안녕하세요 어쩌구저꺼주자ㅜ기dddddddddddddddddddddddddddddddddddddd
							dddddddddddddddaaaaaaddddddddddddddddddddddddddddddddddddddddddddddd바ㅜㅏㅣ적어도 하나의 JAR가 TLD들을 찾기 위해 스캔되었으나 아무 것도 찾지 못했습니다. 스캔했으나 TLD가 없는 JAR들의 전체 목록을 보시려면, 로그 레벨을 디버그 레벨로 설정하십시오. 스캔 과정에서 불필요한 JAR들을 건너뛰면, 시스템 시작 시간과 JSP 컴파일 시간을 단축시킬 수 있습니다.
							1월 11, 2020 9:07:05 오후 org.apache.catalina.core.ApplicationContext log
							정보: Initializing Spring root WebApplicationContext
							INFO : org.springframework.web.context.ContextLoader - Root WebApplicationContext: initialization started
							INFO : org.springframework.web.context.ContextLoader - Root WebApplicationContext initialized in 1898 ms
							1월 11, 2020 9:07:07 오후 org.apache.catalina.core.ApplicationContext log
							정보: Initializing Spring DispatcherServlet 'appServlet'
							INFO : org.springframework.web.servlet.D</span>
							</div>
							<p>작성자 : lde1245</p>
						</li>
						
						<li>
							<a href="">같이 스터디 하실분(종로)</a><span id="date">2019년 12월 11일</span>
							<br>
							<div class="context_text">
							<span class="search_board_span">안녕하세요 어쩌구저꺼주자ㅜ기dddddddddddddddddddddddddddddddddddddd
							dddddddddddddddaaaaaaddddddddddddddddddddddddddddddddddddddddddddddd바ㅜㅏㅣ적어도 하나의 JAR가 TLD들을 찾기 위해 스캔되었으나 아무 것도 찾지 못했습니다. 스캔했으나 TLD가 없는 JAR들의 전체 목록을 보시려면, 로그 레벨을 디버그 레벨로 설정하십시오. 스캔 과정에서 불필요한 JAR들을 건너뛰면, 시스템 시작 시간과 JSP 컴파일 시간을 단축시킬 수 있습니다.
							1월 11, 2020 9:07:05 오후 org.apache.catalina.core.ApplicationContext log
							정보: Initializing Spring root WebApplicationContext
							INFO : org.springframework.web.context.ContextLoader - Root WebApplicationContext: initialization started
							INFO : org.springframework.web.context.ContextLoader - Root WebApplicationContext initialized in 1898 ms
							1월 11, 2020 9:07:07 오후 org.apache.catalina.core.ApplicationContext log
							정보: Initializing Spring DispatcherServlet 'appServlet'
							INFO : org.springframework.web.servlet.D</span>
							</div>
							<p>작성자 : lde1245</p>
						</li>
						
						<li>
							<a href="">3년차 개발자입니다..</a><span id="date">2019년 12월 11일</span>
							<br>
							<div class="context_text">
							<span class="search_board_span">안녕하세요 어쩌구저꺼주자ㅜ기dddddddddddddddddddddddddddddddddddddd
							dddddddddddddddaaaaaaddddddddddddddddddddddddddddddddddddddddddddddd바ㅜㅏㅣ적어도 하나의 JAR가 TLD들을 찾기 위해 스캔되었으나 아무 것도 찾지 못했습니다. 스캔했으나 TLD가 없는 JAR들의 전체 목록을 보시려면, 로그 레벨을 디버그 레벨로 설정하십시오. 스캔 과정에서 불필요한 JAR들을 건너뛰면, 시스템 시작 시간과 JSP 컴파일 시간을 단축시킬 수 있습니다.
							1월 11, 2020 9:07:05 오후 org.apache.catalina.core.ApplicationContext log
							정보: Initializing Spring root WebApplicationContext
							INFO : org.springframework.web.context.ContextLoader - Root WebApplicationContext: initialization started
							INFO : org.springframework.web.context.ContextLoader - Root WebApplicationContext initialized in 1898 ms
							1월 11, 2020 9:07:07 오후 org.apache.catalina.core.ApplicationContext log
							정보: Initializing Spring DispatcherServlet 'appServlet'
							INFO : org.springframework.web.servlet.D</span>
							</div>
							<p>작성자 : lde1245</p>
						</li>
						
						<li>
							<a href="">ajax란?</a><span id="date">2019년 12월 11일</span>
							<br>
							<div class="context_text">
							<span class="search_board_span">안녕하세요 어쩌구저꺼주자ㅜ기dddddddddddddddddddddddddddddddddddddd
							dddddddddddddddaaaaaaddddddddddddddddddddddddddddddddddddddddddddddd바ㅜㅏㅣ적어도 하나의 JAR가 TLD들을 찾기 위해 스캔되었으나 아무 것도 찾지 못했습니다. 스캔했으나 TLD가 없는 JAR들의 전체 목록을 보시려면, 로그 레벨을 디버그 레벨로 설정하십시오. 스캔 과정에서 불필요한 JAR들을 건너뛰면, 시스템 시작 시간과 JSP 컴파일 시간을 단축시킬 수 있습니다.
							1월 11, 2020 9:07:05 오후 org.apache.catalina.core.ApplicationContext log
							정보: Initializing Spring root WebApplicationContext
							INFO : org.springframework.web.context.ContextLoader - Root WebApplicationContext: initialization started
							INFO : org.springframework.web.context.ContextLoader - Root WebApplicationContext initialized in 1898 ms
							1월 11, 2020 9:07:07 오후 org.apache.catalina.core.ApplicationContext log
							정보: Initializing Spring DispatcherServlet 'appServlet'
							INFO : org.springframework.web.servlet.D</span>
							</div>
							<p>작성자 : lde1245</p>
						</li>
						<li class="more"><a href="" >More ></a></li>
					</ul>
					<!-- @@@@@@@@@@@@@ 질문글 검색결과 -->
					<hr id="qna">
					<h1 class="profile_h1 search_h1 sub">QnA</h1>
					<ul class="search_ul">
						<li>
							<a href="">하..maven관련 질문입니다.</a><span id="date">2019년 12월 11일</span>
							<br>
							<div class="context_text">
							<span class="search_board_span">아니도대체 이거 어떻게하는거져의 JAR가 TD들을 찾기 위해 스캔되었으나 아무 것도 찾지 못했습니다. 스캔했으나 TLD가 없는 JAR들의 전체 목록을 보시려면, 로그 레벨을 디버그 레벨로 설정하십시오. 스캔 과정에서 불필요한 JAR들을 건너뛰면, 시스템 시작 시간과 JSP 컴파일 시간을 단축시킬 수 있습니다.
							1월 11, 2020 9:07:05 오후 org.apache.catalina.core.ApplicationContext log
							정보: Initializing Spring root WebApplicationContext
							INFO : org.springframework.web.context.ContextLoader - Root WebApplicationContext: initialization started
							INFO : org.springframework.web.context.ContextLoader - Root WebApplicationContext initialized in 1898 ms
							1월 11, 2020 9:07:07 오후 org.apache.catalina.core.ApplicationContext log
							정보: Initializing Spring DispatcherServlet 'appServlet'
							INFO : org.springframework.web.servlet.D</span>
							</div>
							<p>작성자 : lde1245</p>
						</li>
						
						<li>
							<a href="">하..maven관련 질문입니다.</a><span id="date">2019년 12월 11일</span>
							<br>
							<div class="context_text">
							<span class="search_board_span">아니도대체 이거 어떻게하는거져의 JAR가 TD들을 찾기 위해 스캔되었으나 아무 것도 찾지 못했습니다. 스캔했으나 TLD가 없는 JAR들의 전체 목록을 보시려면, 로그 레벨을 디버그 레벨로 설정하십시오. 스캔 과정에서 불필요한 JAR들을 건너뛰면, 시스템 시작 시간과 JSP 컴파일 시간을 단축시킬 수 있습니다.
							1월 11, 2020 9:07:05 오후 org.apache.catalina.core.ApplicationContext log
							정보: Initializing Spring root WebApplicationContext
							INFO : org.springframework.web.context.ContextLoader - Root WebApplicationContext: initialization started
							INFO : org.springframework.web.context.ContextLoader - Root WebApplicationContext initialized in 1898 ms
							1월 11, 2020 9:07:07 오후 org.apache.catalina.core.ApplicationContext log
							정보: Initializing Spring DispatcherServlet 'appServlet'
							INFO : org.springframework.web.servlet.D</span>
							</div>
							<p>작성자 : lde1245</p>
						</li>
						
						<li>
							<a href="">하..maven관련 질문입니다.</a><span id="date">2019년 12월 11일</span>
							<br>
							<div class="context_text">
							<span class="search_board_span">아니도대체 이거 어떻게하는거져의 JAR가 TD들을 찾기 위해 스캔되었으나 아무 것도 찾지 못했습니다. 스캔했으나 TLD가 없는 JAR들의 전체 목록을 보시려면, 로그 레벨을 디버그 레벨로 설정하십시오. 스캔 과정에서 불필요한 JAR들을 건너뛰면, 시스템 시작 시간과 JSP 컴파일 시간을 단축시킬 수 있습니다.
							1월 11, 2020 9:07:05 오후 org.apache.catalina.core.ApplicationContext log
							정보: Initializing Spring root WebApplicationContext
							INFO : org.springframework.web.context.ContextLoader - Root WebApplicationContext: initialization started
							INFO : org.springframework.web.context.ContextLoader - Root WebApplicationContext initialized in 1898 ms
							1월 11, 2020 9:07:07 오후 org.apache.catalina.core.ApplicationContext log
							정보: Initializing Spring DispatcherServlet 'appServlet'
							INFO : org.springframework.web.servlet.D</span>
							</div>
							<p>작성자 : lde1245</p>
						</li>
						
						<li>
							<a href="">하..maven관련 질문입니다.</a><span id="date">2019년 12월 11일</span>
							<br>
							<div class="context_text">
							<span class="search_board_span">아니도대체 이거 어떻게하는거져의 JAR가 TD들을 찾기 위해 스캔되었으나 아무 것도 찾지 못했습니다. 스캔했으나 TLD가 없는 JAR들의 전체 목록을 보시려면, 로그 레벨을 디버그 레벨로 설정하십시오. 스캔 과정에서 불필요한 JAR들을 건너뛰면, 시스템 시작 시간과 JSP 컴파일 시간을 단축시킬 수 있습니다.
							1월 11, 2020 9:07:05 오후 org.apache.catalina.core.ApplicationContext log
							정보: Initializing Spring root WebApplicationContext
							INFO : org.springframework.web.context.ContextLoader - Root WebApplicationContext: initialization started
							INFO : org.springframework.web.context.ContextLoader - Root WebApplicationContext initialized in 1898 ms
							1월 11, 2020 9:07:07 오후 org.apache.catalina.core.ApplicationContext log
							정보: Initializing Spring DispatcherServlet 'appServlet'
							INFO : org.springframework.web.servlet.D</span>
							</div>
							<p>작성자 : lde1245</p>
						</li>
						<li class="more"><a href="" >More ></a></li>
					</ul>
					
				</div>	
				<!-- @@@@@@@@@@@@@@@검색결과 끝 -->
					
				</div>
			</section>

		<!-- Footer -->
			
<jsp:include page="../main/footer.jsp"></jsp:include>
		<!-- Scripts -->

	</body>
</html>