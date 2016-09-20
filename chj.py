#!/usr/bin/python
# -*- coding: UTF-8 -*-
import MySQLdb
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
db.close()
