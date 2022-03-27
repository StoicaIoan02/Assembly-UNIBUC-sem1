.data
poz: .long 0
x: .long 0
y: .long 0
eval: .long 0
firstNumber: .long 0
atoiRes: .long 0
s: .space 500 #sirul de caractere
res: .long 0
aux: .byte 0
line_s: .asciz "%[^\n]"
string_s: .asciz "%s"
nr_s: .asciz "%d "
endl_s: .asciz "\n"
separatori_s: .asciz " "

.text

.global main

main:
	#scanf("%[^\n]", s);
	pushl $s
	pushl $line_s
	call scanf
	popl %edx
	popl %edx
	
	#res = strtok ( s, " " );
	pushl $separatori_s
	pushl $s
	call strtok
	movl %eax, res
	popl %edx
	popl %edx
	
	#firstNumber = atoi(res);
	pushl res
	call atoi
	movl %eax, firstNumber
	popl %edx
	
	push firstNumber 
	
	et_loop:
		#res = strtok(NULL, " ");
		pushl $separatori_s
		pushl $0
		call strtok
		movl %eax, res
		popl %edx
		popl %edx		
		
		#if ( res == NULL ) goto exit;
		cmp $0, res
		je exit
		
		#atoiRes = atoi(res);
		pushl res
		call atoi
		movl %eax, atoiRes
		popl %edx
		
		# if ( atoiRes == 0 )
		cmp $0, atoiRes	
		jne numar #operatie
			# %al = res[0]
			mov res, %edi #%edi = res
			mov $0, %ecx
			mov $0, %eax
			movb (%edi, %ecx, 1), %al
			
			#if( res[0] == 'a')
			movl $0, aux
			movb %al, aux
			
				
			
			mov aux, %al	
			cmp $'a', %al #
			je add
			
			#if( res[0] == 's')
			cmp $'s', %al 
			je sub
			
			#if( res[0] == 'm')
			cmp $'m', %al 
			je mul
			
			#if( res[0] == 'd')
			cmp $'d', %al 
			je div
			
			jmp et_loop
			
			add: 
				popl x
				popl %edx
				add x, %edx
				push %edx
				jmp et_loop	
			
			sub:
				popl x
				popl %edx
				sub x, %edx
				push %edx
				jmp et_loop
					
			mul:
				pop %edx
				pop %eax
				imul %edx
				push %eax
				jmp et_loop	
				
			div:
				movl $0, %edx
				popl y
				popl x
				mov x, %eax
				mov y, %ebx
				idiv %ebx
				push %eax
				
				jmp et_loop	
				
		#else	
		numar: #numar
			pushl atoiRes
			jmp et_loop #goto et_loop;	
	exit:
		popl eval	
		#printf("%d", eval);
		pushl eval
		pushl $nr_s
		call printf
		popl %edx
		popl %edx
		
	#printf("%d ", firstNumber);
	#pushl atoiRes
	#pushl $nr_s
	#call printf
	#popl %edx
	#popl %edx
	
	#printf("%s", res);
	#pushl res
	#pushl $string_s
	#call printf
	#popl %edx
	#popl %edx
	
	#printf("\n");
	pushl $endl_s
	call printf
	popl %edx
	
	pushl $0
	call fflush
	popl %edx
	
	movl $1, %eax
	xorl %ebx, %ebx
	int $0x80


