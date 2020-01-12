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
select * from (select rownum r, b.* from( select * from MEMBER where MEMBER_ID  like '%' ||  'user' || '%' order by MEMBER_ACT desc)b ) where r < 6 order by r;
