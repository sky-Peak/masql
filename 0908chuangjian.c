#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "mysql.h"

int main(int argc, char *argv[])

{
 char a[15]="";
 char b[16]="";
 char c[40]="";
 char d[40]="";
 char e[150]="";
 char f[100]="";
 MYSQL my_connection;
        int res;
 printf("please create database:");
 gets(c);
 printf("please put user name:");
 scanf("%s",a);
 printf("please put sql password:");
 scanf("%s",b);
mysql_init(&my_connection);
           if (mysql_real_connect(&my_connection, "localhost",a, b,"mysql" ,0, NULL, 0))         {
                printf("Connection success\n");
                res = mysql_query(&my_connection,c);
                if (!res)
                 {
                        printf("Inserted %lu rows\n",(unsigned long)mysql_affected_rows(&my_connection));
                 }
                 else
                 {
                        fprintf(stderr, "Insert error %d: %s\n", mysql_errno(&my_connection), mysql_error(&my_connection));
                 }

                 mysql_close(&my_connection);
        }
          else
         {
                fprintf(stderr, "Connection failed\n");
                if (mysql_error(&my_connection))
                {
                    fprintf(stderr, "Connection error %d: %s\n", mysql_errno(&my_connection), mysql_error(&my_connection));
                }
         }
 printf("please put table name:");
 scanf("%s",f);
 strcpy(e,"create table ");
 strcat(e,f);
 strcpy(f,"(id int not null auto_increment,name varchar(20),sex varchar(10),age int,tel varchar(30),primary key (`id`) );");
 strcat(e,f);
 printf("plese put database name:");
 scanf("%s",d);
 mysql_init(&my_connection);
 if (mysql_real_connect(&my_connection, "localhost",a, b,d ,0, NULL, 0))         {
                printf("Connection success\n");
                res = mysql_query(&my_connection,e);
                if (!res)
                 {
                        printf("Inserted %lu rows\n",(unsigned long)mysql_affected_rows(&my_connection));
                 }
                 else
                 {
                        fprintf(stderr, "Insert error %d: %s\n", mysql_errno(&my_connection), mysql_error(&my_connection));
                 }

                 mysql_close(&my_connection);
        }
          else
         {
                fprintf(stderr, "Connection failed\n");
                if (mysql_error(&my_connection))
                {
                    fprintf(stderr, "Connection error %d: %s\n", mysql_errno(&my_connection), mysql_error(&my_connection));
                }
         }

            return EXIT_SUCCESS;
}

