.data
l: .long 0
i: .long 0
r: .long 0
n: .long 0
b1: .long 0
b2: .long 0
b3: .long 0
s: .space 500
aux: .byte 0
cod: .space 10
let_s: .asciz "let "
add_s: .asciz "add "
sub_s: .asciz "sub "
mul_s: .asciz "mul "
div_s: .asciz "div "
minus_s: .asciz "-"

string_s: .asciz "%s "
scan_s: .asciz "%s"
nr_s: .asciz "%d "
char_s: .asciz "%c "
endl_s: .asciz "\n"

#x: .long 23
#formatString: .asciz "Numarul de afisat este: %d"

.text

#void decode(  ) ///decode(cod)
decode:
	#n = strtol(s1, NULL, 16);
	pushl $16
	push $0
	push $cod
	call strtol
	movl %eax, n
	pop %edx
	pop %edx
	popl %edx
	
	#r = n%(1<<8);
	mov $1, %ecx
	sal $8, %ecx
	mov $0, %edx
	mov n, %eax
	idiv %ecx
	mov %edx, r
	
	#b1 = (n >> 10) & 1;
	movl n, %eax
	sar $10, %eax
	and $1, %eax
	movl %eax, b1
	
	#b2 = (n >> 9) & 1;
	movl n, %eax
	sar $9, %eax
	and $1, %eax
	movl %eax, b2
	
	#b3 = (n >> 8) & 1;
	movl n, %eax
	sar $8, %eax
	and $1, %eax
	movl %eax, b3
	
	# if ( b1 == 1 ) //operatie
	cmp $1, b1
	jne numar
		#if ( r == 0 )
		cmp $0, r
		je let

		#if ( r == 1 )
		cmp $1, r
		je add

		#if ( r == 2 )
		cmp $2, r
		je sub

		#if ( r == 3 )
		cmp $3, r
		je mul
		
		#if ( r == 4 )
		cmp $4, r
		je div
		
		let:
			#printf("let")
			pushl $let_s
			call printf
			popl %edx
			jmp exit_f
		
		add:
			#printf("add")
			pushl $add_s
			call printf
			popl %edx
			jmp exit_f
			
		sub:
			#printf(sub")
			pushl $sub_s
			call printf
			popl %edx
			jmp exit_f
		
		mul:
			#printf("mul")
			pushl $mul_s
			call printf
			popl %edx
			jmp exit_f
		
		div:
			#printf("div")
			pushl $div_s
			call printf
			popl %edx
			jmp exit_f
	numar: 
		#if ( b2 == 0 ) //  numar intreg
		cmp $0, b2
		jne variabila
		
		#if ( b3 == 1)
		cmp $1, b3
		jne fin
       		#printf("-");
       		pushl $minus_s
			call printf
			popl %edx 		
        	fin:
        		#printf("%d ", r);
			pushl r
			pushl $nr_s
			call printf
			popl %edx
			popl %edx		
        	jmp exit_f
		
	variabila:
		#printf("%c ", r);
		pushl r
		pushl $char_s
		call printf
		popl %edx
		popl %edx
		
	exit_f:
		ret

.global main

main:

#scanf("%s",s);
pushl $s
pushl $scan_s
call scanf
popl %edx
popl %edx

#l = strlen(s);
pushl $s
call strlen
mov %eax, l
popl %edx

#for(i=0;i<l;i+=3)
mov $0, %ecx
for:
	#cod
	
	#strncpy(cod,s+%ecx,3);
	pushl %ecx
	pushl $3
	#%ebx = s+i
	mov $s, %ebx
	add %ecx, %ebx
	pushl %ebx
	pushl $cod
	call strncpy
	popl %edx
	popl %edx
	popl %edx
	popl %ecx
	
	#decode();///decode(cod)
	pushl %ecx
	call decode
	popl %ecx
		
	#i+=3
	add $3, %ecx
	#i<l
	cmp l, %ecx
	jl for

#printf("\n");
pushl $endl_s
call printf
popl %edx


#printf("%s",s)
#pushl $s
#pushl $printString
#call printf
#popl %edx
#popl %edx

#printf("%d",x)
#pushl x
#pushl $formatString
#call printf
#popl %edx
#popl %edx

pushl $0
call fflush
popl %edx

movl $1, %eax
xorl %ebx, %ebx
int $0x80
