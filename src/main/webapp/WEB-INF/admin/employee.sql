show tables;

create table employee (
  idx 	int not null auto_increment,	/* 사원 고유번호 */
  id 		varchar(20) not null,					/* 사원 아이디*/
  pwd 	varchar(100) default 0000,		/* 비밀번호(SHA암호화 처리) */
  name	varchar(20) not null,					/* 회원 성명 */
  email varchar(50) not null,					/* 이메일(아이디/비밀번호 분실시 사용) - 형식체크필수 */
  photo	varchar(100) not null,				/* 회원사진 */
  startdate varchar(20) not null,			/* 입사년도 */
  tel		varchar(20) not null,					/* 전화번호 */
  level	int not null,									/* 회원등급(0:관리자, 1:DO,IV제작, 2:EF,BL/AWB제작 , 3:공장장, 4:배송기사 */
  primary key(idx,id)									/* 주키: idx(고유번호), id(아이디) */
);

drop table employee;
delete from employee where idx=6;
desc employee;

insert into employee values (default,'admin','03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4','관리자','admin@naver.com','noimage.jpg','2022','010-5103-0492','0');

select * from employee;

select count(*) as cnt from employee where mid like '%1%';