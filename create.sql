show databases;

drop database IF EXISTS ypf;

show tables;

create database ypf;

use ypf;

drop table IF EXISTS shu;
drop table IF EXISTS user1;
drop table IF EXISTS jieshu;

create table shu(
	id integer not NULL auto_increment,
	name varchar(30),
	auther varchar(30),
	jiage integer,
	ISBN varchar(50),
	chubanshe varchar(60),
	PRIMARY KEY (`id`)
);
 desc shu;

insert into shu(name,auther,jiage,ISBN,chubanshe) 
	values('shujujiegou','wuweimin',39,'7-900643-22-2','qinghuadaxuechubanshe');
insert into shu(name,auther,jiage,ISBN,chubanshe)
	values('C#','zhao',34,'7-900222-22-2','renmindaxuechubanshe');
insert into shu(name,auther,jiage,ISBN,chubanshe)
	values('JAVA','zhang',50,'7-901243-22-2','renmingjiaoyuchubanshe');
insert into shu(name,auther,jiage,ISBN,chubanshe)
	values('SQL','Long',39,'7-900643-23-3','qinghuadaxuechubanshe');
insert into shu(name,auther,jiage,ISBN,chubanshe)
	values('C++','Zheng',48,'7-910643-22-2','qinghuadaxuechubanshe');
select * from shu;
update shu set name='C' where id=1;

 create table user1(
	id integer not NULL auto_increment,
	name varchar(20),
	sex varchar(10),
	age integer,
	tel varchar(30),
	Email varchar(40),		
	PRIMARY KEY (`id`)
);
 desc user1;

insert into user1(name,sex,age,tel,Email)
	values('zhang','boy','23','13412345678','1234578@qq.com');
insert into user1(name,sex,age,tel,Email)
	values('wu','girl','20','13412345687','1234512@qq.com');
insert into user1(name,sex,age,tel,Email)
	values('zhou','boy','21','1341234123','12345342@qq.com');
insert into user1(name,sex,age,tel,Email)
	values('Li','girl','20','13412345123','123452213@qq.com');

create table jieshu(
	id int not null auto_increment,
	user_id int not null,
	shu_id int not null,
	`time` datetime default now(),
	PRIMARY KEY (`id`)
);
insert into jieshu(user_id,shu_id) 
	values (1,1);
insert into jieshu(user_id,shu_id) 
	values (1,2);
insert into jieshu(user_id,shu_id) 
	values (2,3);
nsert into jieshu(user_id,shu_id)
        values (3,5);
insert into jieshu(user_id,shu_id) 
	values (2,4);
select * from shu;
select * from user1;
  select j.id,j.`time`,u.name,s.auther,s.name,now()-j.`time` from jieshu j,user1 u,shu s where j.user_id=u.id and j.shu_id=s.id;
