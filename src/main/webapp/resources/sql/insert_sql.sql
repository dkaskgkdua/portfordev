--멤버테이블
insert into MEMBER(MEMBER_ID,MEMBER_PASSWORD,MEMBER_NAME)values('forkkk','1111','이다은');
insert into MEMBER(MEMBER_ID,MEMBER_PASSWORD,MEMBER_NAME)values('user1','1111','이다은');
insert into MEMBER(MEMBER_ID,MEMBER_PASSWORD,MEMBER_NAME)values('user2','1111','이다은');
insert into MEMBER(MEMBER_ID,MEMBER_PASSWORD,MEMBER_NAME)values('user3','1111','이다은');
insert into MEMBER(MEMBER_ID,MEMBER_PASSWORD,MEMBER_NAME)values('user4','1111','이다은');
insert into MEMBER(MEMBER_ID,MEMBER_PASSWORD,MEMBER_NAME)values('user5','1111','이다은');
insert into MEMBER(MEMBER_ID,MEMBER_PASSWORD,MEMBER_NAME)values('user6','1111','이다은');
insert into MEMBER(MEMBER_ID,MEMBER_PASSWORD,MEMBER_NAME)values('user7','1111','이다은');
insert into MEMBER values('user8','1111','이다은',0,2,2);
insert into MEMBER values('user9','1111','이다은',0,2,1);
insert into MEMBER values('user10','1111','이다은',0,1,1);
insert into MEMBER values('user11','1111','이다은',0,0,80);

--포트폴리오 테이블
insert into PORTFOLIO values(nvl(PORTFOLIO_SEQ.nextval,1),'user2','d','d','d','d',sysdate,sysdate,'0','d','d','0','0')
--포트폴리오 피드백 테이블
insert into PORT_FEEDBACK values(nvl(PORT_FEEDBACK_SEQ.nextval,1),1,'user9','gg',sysdate)