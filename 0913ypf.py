#!/usr/bin/python
# -*- coding: UTF-8 -*-
import MySQLdb
import re
ij=raw_input("please choose Administrators or user\nAdmin please input 1.\nuser please input any key\nplease choose:")
while '1'==ij :
	f=open("user.txt",'r')
	w=f.read()
	w1=re.split(' ',w)
	u_pwd=w1[0]
	e=raw_input("please intput user pwd:")
	if e != u_pwd :
		print"input wrong\nPlease re-enter!!!"
	else :
		while(1):
			print"if you create a new database or atable ? 1.create database 2.create table 3.delete database 4.delete table 0.quit"
			op=raw_input("please choose:")
			if '1'== op :
				f = open("data.txt","w")
				username=raw_input("please put your username:");
				f.write(username)
				f.write(" ")
				password=raw_input("please put your password:");
				f.write(password)
				f.write(" ")
	
				db = MySQLdb.connect("localhost",username,password,"mysql" )
				cursor = db.cursor()
				database_name=raw_input("please put create database name:");
				f.write(database_name)
				f.write(" ")
				sql="create database "+database_name;
				try:
				        cursor.execute(sql)
				        db.commit()
				except:
				        db.rollback
				
				db = MySQLdb.connect("localhost",username,password,database_name )
				cursor = db.cursor()
				table_name=raw_input("please put create table name:");
				f.write(table_name)
				f.write(" ")
				f.close()
				sql="create table "+table_name+"(name varchar(30),sex varchar(15),age int,tel varchar(25),count int default 0);"
				try:
				        cursor.execute(sql)
				        db.commit()
				except:
				        db.rollback
			if '2'== op :
				f = open("data.txt","w")
	                        username=raw_input("please put your username:");
				f.write(username)
				f.write(" ")
	                        password=raw_input("please put your password:");
				f.write(password)
				f.write(" ")
                	        database_name=raw_input("please put create database name:");
				f.write(database_name)
				f.write(" ")
		
	                        db = MySQLdb.connect("localhost",username,password,database_name)
	                        cursor = db.cursor()
	                        sql="create database "+database_name;
	                        try:
	                                cursor.execute(sql)
	                                db.commit()
	                        except:
	                                db.rollback
	
	                        db = MySQLdb.connect("localhost",username,password,database_name )
	                        cursor = db.cursor()
	                        table_name=raw_input("please put create table name:");
	                        f.write(table_name)
	                        f.write(" ")
	                        f.close()
	                        sql="create table "+table_name+"(name varchar(30),sex varchar(15),age int,tel varchar(25),count int default 0);"
	                        try:
	                                cursor.execute(sql)
	                                db.commit()
	                        except:
	                                db.rollback
			if '3'== op :
	                        username=raw_input("please put your username:");
	                        password=raw_input("please put your password:");
		
	                        db = MySQLdb.connect("localhost",username,password,"mysql")
	                        cursor = db.cursor()
                	        database_name=raw_input("please put create database name:");
	                        sql="drop database "+database_name;
	                        try:
	                                cursor.execute(sql)
	                                db.commit()
	                        except:
	                                db.rollback
			if '4'== op :
	                        username=raw_input("please put your username:");
	                        password=raw_input("please put your password:");
                	        database_name=raw_input("please put create database name:");
		
	                        db = MySQLdb.connect("localhost",username,password,database_name)
	                        cursor = db.cursor()
				table_name=raw_input("please input delete table name:")
	                        sql="drop table "+table_name;
	                        try:
	                                cursor.execute(sql)
	                                db.commit()
	                        except:
	                                db.rollback

			if '0'==op :
				exit();
				
if '1' != ij:
	f=open("data.txt",'r')
	s=f.read()
	q=re.split(' ',s)
	root=q[0]
	pwd=q[1]
	data=q[2]
	table=q[3]
	
	db = MySQLdb.connect("localhost",root,pwd,data)
	cursor = db.cursor()
	sql2="select * from "+table+" where age order by count desc limit 3;"
	cursor.execute(sql2)
	row = cursor.fetchall()
	for AAAA in row:
		print AAAA[0]+" "+AAAA[1]+" "+str(AAAA[2])+" "+str(AAAA[3])+" "+str(AAAA[4])
		try:
			cursor.execute(sql2)
			db.commit()
		except:
			print"this is wrong"
	while(1):
		sql3="select count(*) from "+table
		cursor.execute(sql3)
		print "It have  %s  couple of records." % cursor.fetchone()
		print "please your chosse:1.query 2.Add 3.Modify 4.delete 0.quit"
		i=raw_input("your choose:");
		if "1" ==i or i=="" :
			asd=raw_input("please out query name\nplease put:");
			sql="select * from "+table+" where name like '%"+asd+"%'"
			cursor.execute(sql)
			rows = cursor.fetchall()
			for AAA in rows:
				print AAA[0]+"|"+AAA[1]+"|"+str(AAA[2])+"|"+str(AAA[3])+"|"+str(AAA[4])
			sql1="update "+table+" set count=count+1  where name like '%"+asd+"%'"
			cursor.execute(sql1)
			try:
				cursor.execute(sql1)
				db.commit()
			except:
				print "this is wrong"
		if "2"== i :
			n=raw_input("name:");
			s=raw_input("sex:");
			a=raw_input("age:");
			t=raw_input("tel:");
			sql="insert into "
			sql+=table+"(name,sex,age,tel) values('"+n+"','"+s+"','"+a+"','"+t+"');"
		if "3" == i :
		 	qw=raw_input("set:>example(name='AAA')<\nplease put:");
			wq=raw_input("where:>example(name='XXX')\n< please put:");
		 	sql="update "+table+" set "+qw+" where "+wq
		if "4" == i:
			qwe=raw_input("where:>example(id=1)<\nplease put:");
			sql="delete from "+table+" where "+qwe
		if "0" == i :
			break
		try:
			cursor.execute(sql)
			db.commit()
			print "Successful operation!"
		except:
			print"this is wrong"
	db.close()
