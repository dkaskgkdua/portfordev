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

select * from MEMBER;
 
select * from board;

insert into board values(3, '117421623799109543474', '0','1234', '제목','내용',1, 0, 0, 0, sysdate);
insert into board_comment values(board_comment_seq.nextval, 1, '117421623799109543474', '내용2', sysdate);
insert into BOARD_RECOMMEND values(BOARD_RECO_ID.nextval, '117421623799109543474', 1, sysdate);
select * from board;
select * from board_recommend;

select * from (select rownum rnum, b.* from 
					(select * from board inner join BOARD_COMMENT using(board_id) 
					 group by board_id where category = '0' order by BOARD_RE_REF desc,BOARD_RE_SEQ asc) 
					 b 
				) where rnum >= 0 and rnum <= 10; 

select *, count(select * from board_comment where board_id = 1) from board;
select * from board inner join (select board_id, count(*) BOARD_COMMENT from board inner join BOARD_COMMENT using(board_id) group by board_id) using(board_id);
select board_id, count(*) BOARD_RECO from board left outer join BOARD_RECOMMEND using(board_id) group by board_id;

select * from board left outer join board_recommend using(board_id);

select * from (select rownum rnum, b.* from (select * from (select * from board inner join MEMBER using(member_id)) inner join (select * from (select board_id, count(*) BOARD_RECO from board inner join BOARD_RECOMMEND using(board_id) group by board_id) inner join (select board_id, count(*) BOARD_COMMENT from board inner join BOARD_COMMENT using(board_id) group by board_id) using(board_id)) using(board_id) where BOARD_CATEGORY = '0' order by BOARD_RE_REF desc, BOARD_RE_SEQ asc) b) where rnum >=0 and rnum <= 10;

select board_id, count(*) BOARD_RECO from board inner join BOARD_RECOMMEND using(board_id) group by board_id
