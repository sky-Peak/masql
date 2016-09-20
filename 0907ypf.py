#!/usr/bin/python
# -*- coding: UTF-8 -*-
import MySQLdb

# 打开数据库连接
db = MySQLdb.connect("localhost","root","123","ypf" )

# 使用cursor()方法获取操作游标 
cursor = db.cursor()

# 使用execute方法执行SQL语句
sql="insert into user1(name,sex,age,tel,Email) values('WQE','boy','23','13412345678','1234578@qq.com');"
try:
	cursor.execute(sql)
	db.commit()
except:
	db.rollback
# 使用 fetchone() 方法获取一条数据库。
#data = cursor.fetchone()

#print "Database version : %s " % data

# 关闭数据库连接
db.close()
