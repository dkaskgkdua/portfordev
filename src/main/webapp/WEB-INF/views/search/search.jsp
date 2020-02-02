<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE HTML>
<html>
	<head>
		<title>검색결과</title>
		<jsp:include page="../main/navbar.jsp"></jsp:include>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="resources/css/main.css" />
		<link rel="stylesheet" href="resources/css/profile_main_slidebar.css" />
		<link rel="stylesheet" href="resources/css/search.css" />
		
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

		<input type="hidden" value="${searchKeyword}" name="searchword" id="searchword">

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
			<c:if test="${searchKeyword!=''}">
				<!--@@@@@@@@@@@@@@@@@@@@@@@@ 검색결과  -->
				<div id="search_result">
				<h1 class="profile_h1 search_h1 sub" id="project">PROJECT</h1>
				
					
					<!--@@@@@@@@@@@@@@@프로젝트 검색결과 -->
					<!-- 한달내에 조회수 높은순 -->
					<ul class="search_ul">
					<c:if test="${!empty portResult}">
					
					<c:forEach var = "p" items="${portResult}">
						<li>
							<div class="contentimg divimg"><img src="resources/upload/${p.PORT_ID}/0.png"/></div>
							<div class="context_text">
							 <div id="div_sub">
								<a href="">${p.PORT_SUBJECT}</a>
							 </div>	
								<span id="date">${p.PORT_REGIDATE}</span><br>
								<span>${p.PORT_CONTENT}</span>
							</div>
						</li>
					</c:forEach>
						<li class="more"><a href="" >More ></a></li>
					</c:if>
					<c:if test="${empty portResult}">	
						<h1 style="color:gray">포트폴리오 검색결과가 존재 하지 않습니다.</h1>
					</c:if>	
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
							<!-- <div class="context_text">
							<span class="search_board_span"></span>
							</div> -->
							<br>
							<c:if test="${memberList.REG_DATE!=null}">
								<span>&nbsp; 최근 피드백 등록일 : ${memberList.REG_DATE}</span> 
							</c:if>
							<c:if test="${memberList.REG_DATE==null}">
								<span>피드백 활동이 없는 회원입니다.</span> 
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
					<c:if test="${!empty boardResult}">
					 <c:forEach var="boardList" items="${boardResult}">
					 	<li>
							<a href="">${boardList.BOARD_SUBJECT}</a><span id="date">${boardList.BOARD_DATE}</span>
							<br>
							<div class="context_text">
							<span class="search_board_span">${boardList.BOARD_CONTENT}</span>
							</div>
							<p>작성자 : ${boardList.MEMBER_ID}</p>
						</li>
					
						

					 </c:forEach>
					<li class="more"><a href="" >More ></a></li>
					</c:if>	
						
					<c:if test="${empty boardResult}">
						<h1 style="color:gray">자유게시판 검색결과가 존재 하지 않습니다.</h1>
					</c:if>	
						
					</ul>
					
					<hr id="study">
					<!-- @@@@@@@@@@@@@스터디 검색결과 -->
					<h1 class="profile_h1 search_h1 sub">STUDY</h1>
					<ul class="search_ul">
					<c:if test="${!empty studyResult}">
					<c:forEach var = "studyList" items="${studyResult}">
						<li>
							<a href="">${studyList.BOARD_SUBJECT}</a><span id="date">${studyList.BOARD_DATE}</span>
							<br>
							<div class="context_text">
							<span class="search_board_span">${studyList.BOARD_CONTENT}</span>
							</div>
							<p>작성자 : ${studyList.MEMBER_ID}</p>
						</li>
					</c:forEach>
						<li class="more"><a href="" >More ></a></li>
					</c:if>
					<c:if test="${empty studyResult}">
						<h1 style="color:gray">스터디 게시판 검색결과가 존재 하지 않습니다.</h1>
					</c:if>
						
						
						
					</ul>
					<!-- @@@@@@@@@@@@@ 질문글 검색결과 -->
					<hr id="qna">
					<h1 class="profile_h1 search_h1 sub">QnA</h1>
					<ul class="search_ul">
					<c:if test="${!empty qnaResult}">
						<c:forEach var="qnaList" items="${qnaResult}">
							<li>
							<a href="">${qnaList.BOARD_SUBJECT}</a><span id="date">${qnaList.BOARD_DATE}</span>
							<br>
							<div class="context_text">
							<span class="search_board_span">${qnaList.BOARD_CONTENT}</span>
							</div>
							<p>작성자 : ${qnaList.MEMBER_ID}</p>
						</li>
						</c:forEach>
						<li class="more"><a href="" >More ></a></li>
					</c:if>
					<c:if test="${empty qnaResult}">
						<h1 style="color:gray">qna 게시판 검색결과가 존재 하지 않습니다.</h1>
					</c:if>
						
						
						
					</ul>
					
				</div>	
				</c:if>	
				<%-- <c:if test="${searchKeyword==''}">
					<h1 class="profile_h1 search_h1 sub" id="project">검색어를 입력해주세요</h1>
				</c:if> --%>
				<!-- @@@@@@@@@@@@@@@검색결과 끝 -->
				</div>
			</section>

		<!-- Footer -->
			
<jsp:include page="../main/footer.jsp"></jsp:include>
		<!-- Scripts -->

	</body>
</html>