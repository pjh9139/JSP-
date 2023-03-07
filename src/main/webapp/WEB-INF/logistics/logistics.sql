show tables;

create table logistics(
	idx int not null auto_increment, 				/* 문서번호 (자동증가) */
	recipient_idx varchar(20) not null,			/* 수취자번호 */
	recipient varchar(20) not null,					/* 수취자 */
	recipient_location varchar(100) not null,/* 수취장소 */
	recipient_method varchar(20) not null,	/* 운송방법 */
	product_idx varchar(20) not null,				/* 제품번호 */
	product_name varchar(20) not null,			/* 제품이름 */
	product_price int not null,							/* 제품가격 */
	product_quantity int not null, 					/* 제품수량 */
	total int not null, 										/* 총가격 */
	primary key(idx),												/* 주키: idx(고유번호) */
	FOREIGN KEY (recipient_idx) REFERENCES company (idx) 	/* 왜래키 설정 */
	FOREIGN KEY (product_idx) REFERENCES released (idx) 	/* 왜래키 설정 */
);

ALTER TABLE logistics ADD FOREIGN KEY (recipient) REFERENCES company (name);

drop table logistics;
desc logistics;

select * from logistics;

create table company(
	idx 		int not null auto_increment, 	/* 회사번호 */
	name 		varchar(20) not null,					/* 회사 이름 */
	country varchar(20) not null,					/* 회사 국가 */
	address 	varchar(200) not null,			/* 회사 주소 */
	email 	varchar(50) not null,					/* 회사 이메일 */
	tel 		varchar(20) not null,					/* 회사 전화번호 */
	fax 		varchar(20) not null,					/* 회사 팩스번호 */
	primary key(idx),
	unique (name)													/* 유니크 설정 */
	);
	
	drop table company;
	
	desc company;
	
	select * from company;
		
	insert into company values (default,'GreenCompany','Republic Of Korea','109, Sajik-daero, Seowon-gu, Cheongju-si, Chungcheongbuk-do, Republic of Korea','043-225-2111','green@email.com','043-225-2111');
	