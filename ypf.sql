show databases;

drop database IF EXISTS shop;

create database shop;

use shop;



drop table IF EXISTS clientele;
drop table IF EXISTS goods;
drop table IF EXISTS orderlist;


create table clientle(
	id integer not null auto_increment,
	name varchar(15),
	sex integer,
	birthday date,
	tel varchar(20),
	Email varchar(20),
	PRIMARY  KEY(`id`)
);

insert into clientle(name,sex,birthday,tel,Email)
	values('Marry',25 ,'1990-12-21','13571345621','1234567@qq.com');
insert into clientle(name,sex,birthday,tel,Email)
	values('Tom',30 ,'1982-11-11','13465278612','qweasd163@.com');
insert into clientle(name,sex,birthday,tel,Email)
	values('Jack',24 ,'1993-04-21' ,'13152654156','6728821@qq.com');
insert into clientle(name,sex,birthday,tel,Email)
	values('Jay',49,'1976-11-11' ,'15762581723','987654qq@.com');
insert into clientle(name,sex,birthday,tel,Email)
	values('Mac',30,'1986-09-08','13109812315','ui25181@qq.com');

create table bale(
	id integer not null auto_increment,
	g_name varchar(15),
	provic integer,
	mold varchar(20),
	code varchar(20),
	g_time date,
	PRIMARY  KEY(`id`)
);
insert into bale(g_name,provic,mold,code,g_time)
	values('cup',10,'xx','000000001','2015-12-12');
insert into bale(g_name,provic,mold,code,g_time)
	values('towel',15,'xx','000000002','2016-01-12');
insert into bale(g_name,provic,mold,code,g_time)
	values('toothbrush',7,'YY','000000003','2016-08-11');
insert into bale(g_name,provic,mold,code,g_time)
	values('toothpaste',12,'YY','000000004','2016-03-12');
insert into bale(g_name,provic,mold,code,g_time)
	values('mildy wash;',45,'OO','000000005','2015-11-11');

select * from clientle;
select * from bale;

show tables;
create table orderlist(
	id integer not null auto_increment,
	clientle_id integer not null,
	goods_id integer not null,
	`count` integer,
	out_time date,
	provic integer,	
	PRIMARY KEY(`id`)
);
insert into orderlist(clientle_id,goods_id,`count`,out_time,provic)
	 values(1,1,1,now(),90);
insert into orderlist(clientle_id,goods_id,`count`,out_time,provic)
	 values(2,2,2,now(),90);
insert into orderlist(clientle_id,goods_id,`count`,out_time,provic)
	 values(3,3,1,now(),90);
insert into orderlist(clientle_id,goods_id,`count`,out_time,provic)
	 values(4,5,1,now(),90);
insert into orderlist(clientle_id,goods_id,`count`,out_time,provic)
	 values(5,4,1,now(),90);
select c.id,c.name,c.tel,g.g_name,g.provic,o.`count`,o.out_time
 from clientle c, bale g, orderlist o
 where c.id=o.clientle_id and g.id=o.goods_id;
