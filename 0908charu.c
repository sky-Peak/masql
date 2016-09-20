#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "mysql.h"

int main(int argc, char *argv[])

{
 char a[15]="";
 char b[16]="";
 char d[20]="";
 int  i;
 char table_name[20]="";
 MYSQL my_connection;
        int res;
 printf("please put user name:");
 scanf("%s",a);
 printf("please put sql password:");
 scanf("%s",b);
 printf("please put database name:");
 scanf("%s",d);
 printf("please put table name:");
 scanf("%s",table_name);
 while(1)
{
 printf("please put your choose:1 插入. 2 更改内容. 3 删除 . 4 删库. 5 删表.0 退出\nplease choose: ");
 scanf("%d",&i);
 if(i==1)
 {
 char c[100]="";
 char n1[15]="";
 char n2[15]="";
 char n3[20]="";
 char n4[30]="";
	printf("please put user name:\n");
 	scanf("%s",n1);
 	printf("please put user sex:\n");
 	scanf("%s",n2);
 	printf("please put user age:\n");
 	scanf("%s",n3);
 	printf("please put user tel\n");
 	scanf("%s",n4);
	strcpy(c,"insert into ");
	strcat(c,table_name);
	strcat(c," (name,sex,age,tel) values (");
	strcat(c,"'");
	strcat(c,n1);
	strcat(c,"'");
	strcat(c,",");
	strcat(c,"'");
	strcat(c,n2);
	strcat(c,"'");
	strcat(c,",");
	strcat(c,n3);
	strcat(c,",");
	strcat(c,"'");
	strcat(c,n4);
	strcat(c,"'");
	strcat(c,");");
	mysql_init(&my_connection);
           if (mysql_real_connect(&my_connection, "localhost",a,b ,d ,0, NULL, 0))
          {
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
        if(i==0)
        {
            return EXIT_SUCCESS;
        }

  }	
 if(i==2)
 {
	char p[20]="";
	char e[20]="";
	char c1[100]="";
	printf("plese put alter:");
 	scanf("%s",p);
	printf("plese put row:");
 	scanf("%s",e);
	strcat(c1,"update ");
	strcat(c1,table_name);
	strcat(c1," set ");
	strcat(c1,p);
 	strcat(c1," where ");
	strcat(c1,e);
	strcat(c1,";");
	mysql_init(&my_connection);
           if (mysql_real_connect(&my_connection, "localhost",a,b ,d ,0, NULL, 0))
          {
                printf("Connection success\n");
                res = mysql_query(&my_connection,c1);
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
        if(i==0)
        {
            return EXIT_SUCCESS;
        }

 }
 if(i==3)
 {
	char e1[20]="";
	char c2[100]="";-
	printf("plese put row:");
 	scanf("%s",e1);
	strcat(c2,"delete from  ");
	strcat(c2,table_name);
 	strcat(c2," where ");
	strcat(c2,e1);
	strcat(c2,";");
 

mysql_init(&my_connection);
           if (mysql_real_connect(&my_connection, "localhost",a,b ,d ,0, NULL, 0))       
	  {
                printf("Connection success\n");
                res = mysql_query(&my_connection,c2);
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
  }
	if(i==4)
	{
	char qw[20]="";
	char c4[20]="";
	printf("please put delete databse_name:");
	scanf("%s",qw);
	strcpy(c4,"drop database ");
	strcat(c4,qw);
	 if (mysql_real_connect(&my_connection, "localhost",a,b ,d ,0, NULL, 0))
          {
                printf("Connection success\n");
                res = mysql_query(&my_connection,c4);
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
	}
	 if(i==5)
        {
        char er[20]="";
        char c5[20]="";
        printf("please put delete table_name:");
        scanf("%s",er);
        strcpy(c5,"drop table ");
        strcat(c5,er);
         if (mysql_real_connect(&my_connection, "localhost",a,b ,d ,0, NULL, 0))
          {
                printf("Connection success\n");
                res = mysql_query(&my_connection,c5);
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
        }

        if(i==0)
        {
            return EXIT_SUCCESS;
        }

	
}

}

