drop table IF EXISTS book;
drop table IF EXISTS name1;
drop table IF EXISTS b_book;
create table book(
	id integer not NULL auto_increment,
	name varchar(20),
	auther varchar(20),
	jiage integer,
	ISBN varchar(50),
	chubanshe varchar(60),
	PRIMARY KEY (`id`)
);
 create table name1(
	id integer not NULL auto_increment,
	name varchar(20),
	sex varchar(10),
	age integer,
	tel varchar(13),
	Email varchar(30),		
	PRIMARY KEY (`id`)
);
create table b_book(
	id int not null auto_increment,
	user_id int not null,
	shu_id int not null,
	`time` datetime default now(),
	PRIMARY KEY (`id`)
);
insert into book(name,auther,jiage,ISBN,chubanshe)
	values('C#','zhao',34,'7-900222-22-2','renmindaxuechubanshe');
insert into book(name,auther,jiage,ISBN,chubanshe)
	values('JAVA','zhang',50,'7-901243-22-2','renmingjiaoyuchubanshe');
insert into book(name,auther,jiage,ISBN,chubanshe)
	values('SQL','Long',39,'7-900643-23-3','qinghuadaxuechubanshe');
insert into book(name,auther,jiage,ISBN,chubanshe)
	values('C++','Zheng',48,'7-910643-22-2','qinghuadaxuechubanshe');
insert into name1(name,sex,age,tel,Email)
	values('zhang','boy','23','13412345678','1234578@qq.com');
insert into name1(name,sex,age,tel,Email)
	values('wu','girl','20','13412345687','1234512@qq.com');
insert into name1(name,sex,age,tel,Email)
	values('zhou','boy','21','1341234123','12345342@qq.com');
insert into name1(name,sex,age,tel,Email)
	values('Li','girl','20','13412345123','123452213@qq.com');
insert into b_book(user_id,shu_id) 
	values (1,1);
insert into b_book(user_id,shu_id) 
	values (1,2);
insert into b_book(user_id,shu_id) 
	values (2,3);
insert into b_book(user_id,shu_id)
        values (3,5);
insert into b_book(user_id,shu_id) 
	values (2,4);
