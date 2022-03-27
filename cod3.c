#include <stdio.h>
#include <string.h>
#include <stdlib.h>

int main()
{
    char s[120]={0}, *res, r;
    int nr[260]={0}, i, op, x, y;
    char var;
    int n,m;
    scanf("%[^\n]", s);
    res = strtok ( s, " " ); 
    res = strtok ( NULL, " " ); n = atoi(res); printf("%d ",n);
    res = strtok ( NULL, " " ); m = atoi(res); printf("%d ",m);
    for( i = 1; i<= n*m; i++)
    {
        res = strtok ( NULL, " " );
        nr[i] = atoi (res);
    }
    res = strtok ( NULL, " " );
    res = strtok ( NULL, " " );
    res = strtok ( NULL, " " ); op = atoi(res);
    res = strtok ( NULL, " " );
    
    for(i=1;i<=n*m;i++)
    {
        x = nr [i] ;
        y = op;
        r = res[0];
        if( r == 'a')
            printf("%d ",x+y);
        if( r == 's') 
            printf("%d ",x-y);
        if( r == 'm') 
            printf("%d ",x*y);
        if( r == 'd') 
            printf("%d ",x/y);
    }  
    ///endl + flush
    return 0;
    // x 2 2 -1 2 -3 4 let x -10 add
    
}
