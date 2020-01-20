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
select * from dept;
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