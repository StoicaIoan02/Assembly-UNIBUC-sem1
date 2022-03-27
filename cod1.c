#include <stdio.h>
#include <string.h>
#include <stdlib.h>

char s[120],cod[120];
int l,i,r,n,b1,b2,b3;

void decode( char s1[] ) {
    n = strtol(s1, NULL, 16);
    r = n%(1<<8);
    b1 = (n >> 10) & 1;
    b2 = (n >> 9) & 1;
    b3 = (n >> 8) & 1;
    if ( b1 == 1 ) //operatie
    {
        if ( r == 0 )
            printf("let ");
        if ( r == 1 )
            printf("add ");
        if ( r == 2 )
            printf("sub ");
        if ( r == 3 )
            printf("mul ");
        if ( r == 4 )
            printf("div ");
    }
    else
    {
    	if ( b2 == 0 ) //  numar intreg
    	{        
        	if ( b3 == 1)
       	     printf("-");
        	printf("%d ", r);
    	}
    	else // variabila
        	printf("%c ", r);
    }
}

int main()
{
    scanf("%s",s);
    l = strlen(s);
    for(i=0;i<l;i+=3)
    {
        strncpy(cod,s+i,3);
        decode(cod);
    }
    //printf("\n");
    return 0;
}

