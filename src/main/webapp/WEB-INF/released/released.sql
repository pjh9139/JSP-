show tables;


create table product (
	idx 		int not null auto_increment, 	/* 제품번호 (자동증가) */
	name 		varchar(20) not null,					/* 제품명 */
	price 	int not null,									/* 제품가격 */
	width 	int not null,									/* 가로길이 */
	length 	int not null,									/* 세로길이 */
	hight 	int not null,									/* 높이 */
	weight 	int not null,									/* 중량 */
	primary key(idx),											/* 주키: idx(고유번호) */
	unique (idx)													/* 유니크 설정 */
);

select * from product;

desc product;

drop table product;

drop table logistics;


create table logistics(
	idx int not null auto_increment, 				/* 문서번호 (자동증가) */
	recipient_idx varchar(20) not null,			/* 수취자번호 */
	recipient_company varchar(20) not null,	/* 수취회사 */
	recipient_location varchar(20) not null,/* 수취장소 */
	recipient_method varchar(20) not null,	/* 운송방법 */
	product_idx varchar(20) not null,				/* 제품번호 */
	product_name varchar(20) not null,			/* 제품이름 */
	product_price int not null,							/* 제품가격 */
	product_quantity int not null, 					/* 제품수량 */
	total int not null, 										/* 총가격 */
	primary key(idx)												/* 주키: idx(고유번호) */
);
--	FOREIGN KEY (recipient) REFERENCES company (name) 	/* 왜래키 설정 */
--	FOREIGN KEY (product_idx) REFERENCES released (idx) 	/* 왜래키 설정 */

ALTER TABLE logistics ADD FOREIGN KEY (recipient_idx) REFERENCES company (idx);
alter table logistics change column recipient recipient_company varchar(20);

drop table logistics;
desc logistics;
