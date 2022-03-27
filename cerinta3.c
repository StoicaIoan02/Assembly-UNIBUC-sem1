#include <stdio.h>
#include <string.h>
#include <stdlib.h>

int main()
{
    int st[120]={0}, poz = 0, x=0, y=0, eval=0;   
    char s[120]={0}, *res;
    int firstNumber=0, atoiRes=0;
    int value[260]={0}, l = 0, ch = 0; /// new
   //Date de intrare
    //- instruction // instructiune corecta pentru procesorul aritmetic
    scanf("%[^\n]", s);
    res = strtok ( s, " " );// res := strtok(instruction, " ")
    firstNumber = atoi(res);//firstNumber = atoi(res)
    ch = res[0]; // new
    if ( firstNumber == 0) // new - sirul incepe cu o var
    { // new
        res = strtok(NULL, " "); // new - citim valoarea variabilei
        value[ch] = atoi(res); // new
    } //new
    else // new
    { //new
        poz +=  1; 
        st[poz] = firstNumber ; //push firstNumber
    } //new
    
    
    et_loop: //et_loop:
        res = strtok(NULL, " "); //res := strtok(NULL, " ")
        if ( res == NULL ) //if res == NULL goto exit
            goto exit;
        atoiRes = atoi(res); //atoiRes := atoi(res);
        l = strlen(res); //new
        if ( l == 3 ) // new (changed) //if atoiRes == 0 // e operatie
        {
            if( res[0] == 'a')  // if atoiRes[0] == ’a’ // add
            {
                x = st[poz]; poz -= 1; // pop x
                y = st[poz]; poz -= 1; // pop y
                poz +=1; st[poz] = x+y;//push (x + y)
            }
             if( res[0] == 's')  // if atoiRes[0] == ’s’ // sub
            {
                x = st[poz]; poz -= 1; // pop x
                y = st[poz]; poz -= 1; // pop y
                poz +=1; st[poz] = y-x;//push (y - x)
            }
             if( res[0] == 'm')  // if atoiRes[0] == ’m’ // mul
            {
                x = st[poz]; poz -= 1; // pop x
                y = st[poz]; poz -= 1; // pop y
                poz +=1; st[poz] = x*y;//push (x * y)
            }
             if( res[0] == 'd')  // if atoiRes[0] == ’d’ // div 
            {
                x = st[poz]; poz -= 1; // pop x
                y = st[poz]; poz -= 1; // pop y
                poz +=1; st[poz] = y/x;//push (y / x
            }
            
        }
        else 
        if ( atoiRes!=0 )// new // este numar; doar il punem pe stiva
        {
            poz += 1; 
            st[poz] = atoiRes; //push atoiRes
        }
        else //new - este variabila
        {
            ch = res[0];//new
            if( value[ch] == 0) //new
            { 
                res = strtok(NULL, " "); // new - citim valoarea variabilei
                value[ch] = atoi(res); // new
            }
            else //new
            {
                poz += 1; // new
                st[poz] = value[ch]; //push value[ch]
            }
        }
        goto et_loop;//goto et_loop

    exit: //exit: 
        eval = st[poz]; poz -= 1;//pop eval
        printf("%d\n", eval); //write (eval)

        return 0;
    
    // 2 10 mul 5 div 7 6 sub add  =>  5
    
}
