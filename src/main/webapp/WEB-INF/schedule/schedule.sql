show tables;

create table schedule (
  idx   int not null auto_increment primary key,
  mid   varchar(20) not null,					/* 회원 아이디(일정검색시 필요) */
  sDate datetime not null,						/* 일정 등록 날짜 */
  part  varchar(10) not null,					/* 1.모임, 2.업무, 3.학습, 4.여행, 5:기타 */
  content text not null								/* 일정 상세 내역 */
);

drop table schedule;
desc schedule;

insert into schedule values (default,'admin','2022-12-08','학습','프로젝트 계획서 완료');
insert into schedule values (default,'admin','2022-12-09','기타','집안 청소');
insert into schedule values (default,'admin','2022-12-12','학습','관리자화면설계');
insert into schedule values (default,'admin','2022-12-25','모임','크리스마스 모임');
insert into schedule values (default,'admin','2022-12-25','모임','가족조찬모임');
insert into schedule values (default,'admin','2022-12-25','학습','오전10시 스터디카페');
insert into schedule values (default,'admin','2022-12-26','모임','오전 12시 스터디카페1');
insert into schedule values (default,'admin','2022-12-26','모임','오후 8시 스터디카페2');
insert into schedule values (default,'admin','2022-12-31','여행','제주도출발');
insert into schedule values (default,'admin','2023-01-05','공부','spring 연습');
insert into schedule values (default,'jjangu','2022-12-15','학습','프로젝트 회원관리완성');
insert into schedule values (default,'jjangu','2022-12-25','모임','크리스마스 모임');

select * from schedule order by sDate desc;
select * from schedule where mid='admin' order by sDate desc;
select * from schedule where mid='admin' and sDate='2022-12-25' order by sDate desc;
select * from schedule where mid='admin' and date_format(sDate,'%Y-%m')='2022-12' order by sDate desc;
select * from schedule where mid='admin' and date_format(sDate,'%Y-%m')='2023-1' order by sDate desc;		--에러...
select * from schedule where mid='admin' and date_format(sDate,'%Y-%m')='2023-01' order by sDate desc;
select * from schedule where mid='admin' and date_format(sDate,'%Y-%m')='2022-12' group by part order by sDate desc;
select *,count(*) from schedule where mid='admin' and sDate='2022-12-25' group by part order by sDate desc;
select *,count(*) as partCnt from schedule where mid='admin' and date_format(sDate, '%Y-%m')='2022-12' group by sDate order by sDate desc


select * from schedule where mid='admin' and date_format(sDate,'%Y-%m')='2022-12' order by sDate,part;