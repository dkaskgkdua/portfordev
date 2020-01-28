/* test 파일 */
create table user_table(
	today date,
	user_name varchar2(20)
);

insert into user_table values(sysdate, '홍길동');

select to_char(sysdate, 'yyyy-mm-dd hh24:mi:ss'), user_name from user_table;

create table member_test3(
	num varchar2(20),
	name varchar2(30),
	email varchar2(20),
	tel varchar2(20),
	addr varchar2(30),
	today date
);
select * from(
			select rownum rnum, a.*
				from (select ALERT_ID, alert.MEMBER_ID, MEMBER_NAME, ALERT_CATEGORY, ALERT_REF_ID, ALERT_REQ_MEMBER, ALERT_CHECK, ALERT_DATE from alert inner join member on alert.ALERT_REQ_MEMBER = member.MEMBER_ID where alert.MEMBER_ID = '117421623799109543474' order by ALERT_DATE desc
			) a
     	) where  rnum >= 1 and rnum <= 10 
select distinct MEMBER_ID, BOARD_ID from BOARD_COMMENT inner join MEMBER using(MEMBER_ID) where BOARD_ID = 1;
select * from board_comment;
select * from alert;
delete from PORTFOLIO;
select * from PORTFOLIO;
select rownum rnum, b.* from(
select * from (select BOARD_ID, BOARD_READCOUNT, MEMBER_ID, BOARD_CATEGORY, BOARD_SUBJECT, BOARD_CONTENT, BOARD_RE_REF, BOARD_RE_LEV, BOARD_RE_SEQ, BOARD_DATE, MEMBER_NAME, MEMBER_ACT from board inner join MEMBER using(member_id)) inner join
(select * from (select board_id, count(BOARD_RECO_ID) BOARD_RECO from board left outer join board_recommend using(board_id) group by board_id)
inner join (select BOARD_ID, a.SORT_READ from board join (select BOARD_RE_REF, BOARD_READCOUNT SORT_READ from board where BOARD_RE_LEV = 0) a using(BOARD_RE_REF)) using(board_id) 
inner join (select board_id, count(BOARD_CO_ID) BOARD_COMMENT from board left outer join BOARD_COMMENT using(board_id) group by board_id) using(board_id)) using(board_id) where BOARD_CATEGORY = 0 order by SORT_READ desc, BOARD_RE_REF desc, BOARD_RE_SEQ asc
) b;
select * from member_log;
select rownum rnum, b.* from(
select * from (select BOARD_ID, BOARD_READCOUNT, MEMBER_ID, BOARD_CATEGORY, BOARD_SUBJECT, BOARD_CONTENT, BOARD_RE_REF, BOARD_RE_LEV, BOARD_RE_SEQ, BOARD_DATE, MEMBER_NAME, MEMBER_ACT from board inner join MEMBER using(member_id)) inner join
(select * from (select board_id, count(BOARD_RECO_ID) BOARD_RECO from board left outer join board_recommend using(board_id) group by board_id) inner join(
select board_id, sort_reco from board join (
select board_re_ref, a.SORT_RECO  from board inner join (
select board_id, count(BOARD_RECO_ID) SORT_RECO from board left outer join board_recommend using(board_id) group by board_id) a using(board_id) where board_re_lev = 0) using(board_re_ref)) using(board_id)
inner join (select board_id, count(BOARD_CO_ID) BOARD_COMMENT from board left outer join BOARD_COMMENT using(board_id) group by board_id) using(board_id)) using(board_id) where BOARD_CATEGORY = 0 order by SORT_RECO desc, BOARD_RE_REF desc, BOARD_RE_SEQ asc
) b;
select * from(
	select rownum rnum, a.*
		from (select MEMBER_NAME, ALERT_ID, alert.MEMBER_ID from alert inner join member on alert.ALERT_REQ_MEMBER = member.MEMBER_ID ))
select ALERT_ID, alert.MEMBER_ID, MEMBER_NAME, ALERT_CATEGORY, ALERT_REF_ID, ALERT_REQ_MEMBER, ALERT_CHECK, ALERT_DATE from alert inner join member on alert.ALERT_REQ_MEMBER = member.MEMBER_ID;

select * from(
			select rownum rnum, a.* 
				from (select * from member_log where MEMBER_ID = '117421623799109543474'
				) a
			)where rnum >= 1 and rnum <= 10

select * from dept;
select * from board left outer join (select BOARD_ID, BOARD_RE_LEV LEV2 from board where BOARD_RE_LEV = 0) using(BOARD_ID) order by BOARD_RE_LEV asc, BOARD_RE_SEQ desc, BOARD_READCOUNT desc;
select * from MEMBER;
select * from BOARD_COMMENT inner join MEMBER using(MEMBER_ID) where BOARD_ID = 1;
select * from board;
update (select * from MEMBER inner join BOARD using(MEMBER_ID) where board_id = 1) set MEMBER_ACT = MEMBER_ACT + 5;
insert into board values(3, '117421623799109543474', '0','1234', '제목','내용',1, 0, 0, 0, sysdate);
insert into board_comment values(board_comment_seq.nextval, 1, '117421623799109543474', '내용2', sysdate);
insert into BOARD_RECOMMEND values(BOARD_RECO_ID.nextval, '117421623799109543474', 1, sysdate);
select * from board;
select * from board_recommend;
select * from board_file;
select * from (select rownum rnum, b.* from 
					(select * from board inner join BOARD_COMMENT using(board_id) 
					 group by board_id where category = '0' order by BOARD_RE_REF desc,BOARD_RE_SEQ asc) 
					 b 
				) where rnum >= 0 and rnum <= 1

select *, count(select * from board_comment where boar0; d_id = 1) from board;
select * from board inner join (select board_id, count(*) BOARD_COMMENT from board inner join BOARD_COMMENT using(board_id) group by board_id) using(board_id);


select board_id, count(BOARD_RECO_ID) from board left outer join board_recommend using(board_id) group by board_id;
select board_id, count(BOARD_CO_ID) from board left outer join BOARD_COMMENT using(board_id) group by board_id;
select * from BOARD_FILE;
insert into BOARD_RECOMMEND values(BOARD_RECO_ID.NEXTVAL, '117421623799109543474', 4, SYSDATE);
select * from (select rownum rnum, b.* from (select * from (select * from board inner join MEMBER using(member_id)) inner join (select * from (select board_id, count(BOARD_RECO_ID) BOARD_RECO from board left outer join board_recommend using(board_id) group by board_id) inner join (select board_id, count(BOARD_CO_ID) BOARD_COMMENT from board left outer join BOARD_COMMENT using(board_id) group by board_id) using(board_id)) using(board_id) where BOARD_CATEGORY = '0' order by BOARD_RE_REF desc, BOARD_RE_SEQ asc) b) where rnum >=0 and rnum <= 10;
select * from (select board_id, count(BOARD_RECO_ID) from board left outer join board_recommend using(board_id) group by board_id) inner join (select board_id, count(BOARD_CO_ID) from board left outer join BOARD_COMMENT using(board_id) group by board_id) using(board_id)) using(board_id) where BOARD_CATEGORY = '0' order by BOARD_RE_REF desc, BOARD_RE_SEQ asc
select board_id, count(*) BOARD_RECO from board inner join BOARD_RECOMMEND using(board_id) group by board_id
/*회원 점수 정렬로 다섯명 뽑아오기*/
select * from (select rownum r, b.* from( select * from MEMBER where MEMBER_ID  like '%' ||  'user' || '%' order by MEMBER_ACT desc)b ) 
natural join 
where r < 6 order by r;

select * from MEMBER;
select * from profile;
/*회원 검색 결과+최근 피드백 활동일*/
select m.MEMBER_ID,MEMBER_PASSWORD,MEMBER_NAME,MEMBER_POWER ,MEMBER_POINT,MEMBER_ACT,REG_DATE from 
			(select rownum r, b.* from
				( select * from MEMBER where MEMBER_ID  like '%' ||  'user' || '%' order by MEMBER_ACT desc)b
			 )m left outer join (select MEMBER_ID ,nvl(MAX(REG_DATE),null) REG_DATE  from	PORT_FEEDBACK group by MEMBER_ID) p on p.MEMBER_ID=m.MEMBER_ID 
			 where r < 6 order by r asc ,REG_DATE DESC;
			 
/*게시판 검색 결과*/
select * from 
			(select rownum r, b.* from
				( select BOARD_SUBJECT,BOARD_CONTENT,BOARD_DATE from  BOARD where BOARD_SUBJECT  like '%' || '어' || '%' 
					or BOARD_CONTENT like '%' ||  '어' || '%' order by BOARD_DATE desc)b
			 )
			 where r < 6 order by r asc 			 
			 
select MEMBER_ID , MAX(REG_DATE)  from	PORT_FEEDBACK group by MEMBER_ID ;		 
select* from BOARD;
delete from BOARD;

select * from 
			(select rownum r, b.* from
				( select BOARD_SUBJECT, SUBSTR(BOARD_CONTENT,(instr(BOARD_CONTENT,'연어초밥',1,1)),LENGTH(BOARD_CONTENT)) BOARD_CONTENT,BOARD_DATE,MEMBER_ID from  BOARD where  (BOARD_SUBJECT  like '%' ||  '연어초밥' || '%' 
					or BOARD_CONTENT like '%' ||  '연어초밥' || '%' or MEMBER_ID like '%' || '연어초밥' || '%') and BOARD_CATEGORY = '0' order by BOARD_DATE desc)b
			 )
			 where r < 6 order by r asc 
select instr(BOARD_CONTENT,'연어초밥',1,1)-6 from BOARD;
			 
select * from emp where ename='SCOTT';
