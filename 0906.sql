show databases;

use ypf;

show tables;

drop table IF EXISTS Register;
drop table IF EXISTS personal;
drop table IF EXISTS company;
drop table IF EXISTS m_enu;
drop table IF EXISTS p_school;
drop table IF EXISTS m_school;
drop table IF EXISTS h_school;
drop table IF EXISTS c_school;
drop table IF EXISTS relationship;

show tables;

/*用户注册信息*/
create table  Register(
	id integer not null auto_increment,
	user_name varchar(20),
	password varchar(16),
	E_mail varchar(20),
	tel varchar(15),
	primary key (`id`)
	);
alter table Register convert to character set `gbk`;
insert into Register(user_name,password,E_mail,tel)
	values('yue_123','987654','12364758@163.com','13298716223');
insert into Register(user_name,password,E_mail,tel)
	values('pan_456','123445','762124353@qq.com','15724354261');
insert into Register(user_name,password,E_mail,tel)
	values('feng_789','qwerdf','76212sdfsa2@qq.com','15934354261');

/*学籍信息*/
create table p_school(
	id int not null auto_increment,
	s_name varchar(20),
	start_time date,
	end_time date,
	s_adress varchar(25),
	primary key (`id`)
	);
alter table p_school convert to character set `gbk`;
insert into p_school(s_name,start_time,end_time,s_adress)
	values('XX小学','2000-09-01','2006-07-01','XX村');
insert into p_school(s_name,start_time,end_time,s_adress)
	values('二号小学','2000-09-01','2006-07-01','二村');
insert into p_school(s_name,start_time,end_time,s_adress)
	values('三号小学','2000-09-01','2006-07-01','三村');


create table m_school(
	id int not null auto_increment,
	s_name varchar(20),
	start_time date,
	end_time date,
	s_adress varchar(25),
	primary key (`id`)
	);
alter table m_school convert to character set `gbk`;
insert into m_school(s_name,start_time,end_time,s_adress)
	values('XX初级中学','2007-09-01','2010-07-01','XX镇');
insert into m_school(s_name,start_time,end_time,s_adress)
	values('哈哈初级中学','2007-09-01','2010-07-01','哈哈镇');
insert into m_school(s_name,start_time,end_time,s_adress)
	values('哼哼初级中学','2007-09-01','2010-07-01','哼哼镇');

create table h_school(
	id int not null auto_increment,
	s_name varchar(20),
	start_time date,
	end_time date,
	s_adress varchar(25),
	primary key (`id`)
	);
alter table h_school convert to character set `gbk`;
insert into h_school(s_name,start_time,end_time,s_adress)
	values('XX高中','2010-09-01','2013-07-01','XX县');
insert into h_school(s_name,start_time,end_time,s_adress)
	values('楼下高中','2010-09-01','2013-07-01','楼下县');
insert into h_school(s_name,start_time,end_time,s_adress)
	values('楼上高中','2010-09-01','2013-07-01','楼上县');


create table c_school(
	id int not null auto_increment,
	s_name varchar(20),
	start_time date,
	end_time datetime default now(),
	s_adress varchar(25),
	primary key (`id`)
	);
alter table c_school convert to character set `gbk`;
insert into c_school(s_name,start_time,s_adress)
	values('XX大学','2013-09-01','xx省XX市');
insert into c_school(s_name,start_time,s_adress)
	values('北京大学','2013-09-01','北京市');
insert into c_school(s_name,start_time,s_adress)
	values('复旦大学','2013-09-01','上海市');


/*菜单*/
create table m_enu(
	id int not null auto_increment,
	vegetable varchar(25),
	planting_time date,
	ripe_time datetime default now(),
	gold int,
	primary key (`id`)
	);
alter table m_enu convert to character set `gbk`;
insert into m_enu(vegetable,planting_time,gold)
	values('白菜','2016-09-08',50);
insert into m_enu(vegetable,planting_time,gold)
	values('土豆','2016-09-08',47);
insert into m_enu(vegetable,planting_time,gold)
	values('胡萝卜','2016-09-08',53);

/*用户个人信息*/
create table personal(
	id integer not null auto_increment,
	name varchar(20),
 	sex varchar(6),
	age int,
	adress varchar(30),
	s_pid int,
	s_mid int,
	s_hid int,
	s_cid int,
	major varchar(15),
	r_id int,
	v_id int,
	marry varchar(5),
	primary key (`id`)
	);
alter table personal convert to character set `gbk`;
insert into personal(name,sex,age,adress,s_pid,s_mid,s_hid,s_cid,major,marry,r_id,v_id)
	values('Jay','male',22,'陕西',1,1,1,1,'计算机','否',1,1);
insert into personal(name,sex,age,adress,s_pid,s_mid,s_hid,s_cid,major,marry,r_id,v_id)
	values('Tom','male',22,'北京',2,2,2,2,'电气自动化','否',2,2);
insert into personal(name,sex,age,adress,s_pid,s_mid,s_hid,s_cid,major,marry,r_id,v_id)
	values('Marry','female',21,'上海',3,3,3,3,'软件工程','否',3,3);


/*用户工作信息*/
create table company(
	id integer not null auto_increment,
	p_id integer,
	c_name varchar(25),
	position varchar(20),
	Job_start_time date not null,
	Job_end_time datetime default now(),
	primary key (`id`)
	);
alter table company convert to character set `gbk`;
insert into company(p_id,c_name,position,Job_start_time)
	values(1,'华为','程序员','2016-09-12');
insert into company(p_id,c_name,position,Job_start_time)
	values(2,'三星','项目经理','2012-12-12');
insert into company(p_id,c_name,position,Job_start_time)
	values(3,'中兴','CEO','2000-01-22');



/*用户关系表*/
create table relationship(
	id int not null auto_increment,
	u_id int not null,
	f_name varchar(30) not null,
	relationship varchar(15) not null,
	v_steal_id int,
	primary key (`id`)
	);
alter table relationship convert to character set `gbk`;
insert into relationship(u_id,f_name,relationship,v_steal_id)
	values(1,'Tom','gayfriend',2);
insert into relationship(u_id,f_name,relationship,v_steal_id)
	values(2,'Marry','lover',3);
insert into relationship(u_id,f_name,relationship,v_steal_id)
	values(3,'Jay','friend',1);

select * from Register;
select * from company;
select * from personal;
select * from m_enu ;
select * from relationship ;


	select p.name,r.f_name,r.relationship,p.adress,p.marry,c.c_name,c.position,m.vegetable,R.user_name,R.E_mail,R.password,R.tel,P.s_name,M.s_name,H.s_name,C.s_name
	from relationship r,personal p,company c,Register R,m_enu m,p_school P,m_school M,h_school H,c_school C 
	where r.u_id=p.id and c.p_id=p.id and p.r_id=R.id and m.id=p.v_id and p.s_pid=P.id and p.s_mid=H.id and p.s_mid=M.id and p.s_cid=C.id;
