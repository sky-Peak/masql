#include <stdio.h>
#include <stdlib.h>
#include "mysql.h"


int main(int argc, char *argv[])
{
	char arr[20][500]={""};
	MYSQL my_connection;
    	int res;
	char p;
	int i=0;
	int j=0;
	int n=0;
	FILE *fp=NULL;
	fp=fopen("0908.sql","r");
	if(NULL==fp)
	{
		return -1;
	}
	while(fscanf(fp,"%c",&p)!=EOF)
	{
		if(p!=';')
	 	{
			arr[i][j]=p;
			arr[i][j+1]=';';
		}
		j++;
		if(p==';')
		{
		 i++;
		 j=0;
		}
	}

 printf("请输入你要执行的语句对应的编号：\n1 2 3对应删除1 2 3表\n4 5 6对应创建1 2 3表\n7--10给表1插入\n11--14给表2插入\n15--18给表3插入");
 printf("\nplease put:"); 
 scanf("%d",&n);
 printf("%s\n",arr[n-1]);
 	 mysql_init(&my_connection);
 	   if (mysql_real_connect(&my_connection, "localhost","root", "123","AQA" ,0, NULL, 0)) 	{
	        printf("Connection success\n");
        	res = mysql_query(&my_connection, arr[n-1]);
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

	 fclose(fp);
	 fp=NULL;
	    return EXIT_SUCCESS;
}
