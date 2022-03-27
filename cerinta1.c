/******************************************************************************

                            Online C Compiler.
                Code, Compile, Run and Debug C program online.
Write your code in this editor and press "Run" button to compile and execute it.

*******************************************************************************/

#include <stdio.h>
#include <string.h>
#include <stdlib.h>

char s[120],cod[120];
int l,i,r;

int bit(int n, int j)
{
    j = 11-j;
    return ((1<<j) & n) >> j;
}


void decode( char s1[] ) {
    int n = strtol(s1, NULL, 16);
    //for(int j = 0;j<=11;j++)
        //printf("%d", bit(n,j));
    r = n%(1<<8);
    if ( bit(n, 1) == 0 && bit (n, 2) == 0 ) //  numar intreg
    {        
        if ( bit(n, 3) == 1)
            printf("-");
        printf("%d ", r);
    }
    if ( bit(n, 1) == 0 && bit (n, 2) == 1 ) // variabila
        printf("%c ", r);
    if ( bit(n, 1) == 1 ) //operatie
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
}


int main()
{
    scanf("%s",s);
    l = strlen(s);   
    //printf("%d",l);
    
    for(i=0;i<l;i+=3)
    {
        strncpy(cod,s+i,3);
        decode(cod);
    }
    printf("\n");
    
    //int n = strtol(s, NULL, 16);
    //printf("n=%d\n", n);  
    //strncpy(cod,s,3);
    //printf("%s",cod);
    //  A78801C00A7890EC04
    //101001111000100000000001110000000000101001111000100100001110110000000100
    //101001111000100000000001110000000000101001111000100100001110110000000100
    //101001111000100000000001110000000000101001111000100100001110110000000100
    return 0;
}

