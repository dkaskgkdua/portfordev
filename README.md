# PFD - Portfolio For Developer
-----


# 개요
* 프로젝트 명 : PFD(Portfolio For Developer)

* 일정 : 20.1.6. ~ 20.2.6.(한달) / 유지보수 : 20.2.6 ~

* 팀 구성 : 송민준, 이다은, 안현호

* 목적 : 신입 개발자들이 취직활동 간에 포트폴리오 제출 방식을 특정 프로그램에 종속되어 제출하는 등
           어려움을 겪는 경우가 종종 있다. 이러한 신입 개발자들을 대상으로 포트폴리오 관리를 해주는
           서비스를 제공하여 취업 활동을 보다 쉽게 하고자 한다. 또한 선배 개발자들로부터 피드백을 받을
           수 있는 기능을 제공하여 만족도를 높이고자 한다.
           
* 사용 기술 및 개발환경
   - O/S : Windows 10(개발환경), Linux ubuntu 18.04(운영환경)
   - Server : Apache2, Tomcat8.5
   - DB : Orarcle 11g(RDS)
   - Framework/flatform : Spring, bootstrap, jQuery, mybatis
   - Programming Language : JAVA, HTML, JavaScript
   - Tool : STS, Github, AQuerytool, StarUML, SQL Developer, Photoshop CS6
   - API : Google Developer, Kakao Developer, Naver Developer, recaptcha, summernote
   
# 내용
* PPT(Slideshare)

* 구현 기능
   - 로그인(SSO)
   - 회원가입
   - 커뮤니티(자유게시판, 스터디게시판, QnA게시판, summernote, 추천, 계층형, 댓글)
   - 알림 기능
   - 마이페이지(정보 관리, 회원 탈퇴, 활동로그)
   - 검색(키워드)
   - 포트폴리오(피드백, 추천, 스크랩, 등록, 수정, 삭제)
   - 프로필(등록, 수정, 삭제)
   - 보안(SSL, XSS 방어, recaptcha, 비밀번호 해싱)
   - 메인화면(사이트 소개, 추천 포트폴리오, 주요 기능 네비게이션)
   - IT뉴스
   
* 팀원별 역할
   - 송민준 : DB설계, 회원가입, 로그인, 게시판, 보안, 마이페이지, 알림, 포트폴리오 등록
   - 이다은 : 통합검색, 프로필
   - 안현호 : 메인화면, IT뉴스, 프로필-포트폴리오 모아보기, 포트폴리오 상세, 스크랩, 통합관리 (수정/삭제)
   - 공통 : 기획
   
* 설계의 주안점
   - 프로필 페이지에서는 개발자에 대한 PR 정보를 나타내어 개인 사이트를 호스팅한 것 같은 만족감을 제공한다.
   - 포트폴리오 상세 페이지에서 포트폴리오에 대한 정보들을 제공하여 통합 관리가 쉽게 한다. 
      
* 산출물(대표)
   - ERD
   
   - 시퀀스 다이어그램
   
   - 테이블 정의서
  
   - 유스케이스 다이어그램
  
   - WBS
   
   - 클래스 다이어그램
   
   - 자료 사전
