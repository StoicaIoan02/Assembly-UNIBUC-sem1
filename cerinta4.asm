.data
poz: .long 0
x: .long 0
y: .long 0
n: .long 0
m: .long 0
prod: .long 0
eval: .long 0
firstNumber: .long 0
atoiRes: .long 0
s: .space 500 #sirul de caractere
nr: .space 1100 #valorile variabilelor
l: .long 0
ch: .long 0
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
	
	#res = strtok ( NULL, " " ); 
	pushl $separatori_s
	pushl $0
	call strtok
	movl %eax, res
	popl %edx
	popl %edx
	
	#n = atoi(res);
	pushl res
	call atoi
	movl %eax, n
	
	#printf("%d ",n);
	pushl n
	pushl $nr_s
	call printf
	popl %edx
	popl %edx
	
	#res = strtok ( NULL, " " ); 
	pushl $separatori_s
	pushl $0
	call strtok
	movl %eax, res
	popl %edx
	popl %edx
	
	#m = atoi(res);
	pushl res
	call atoi
	movl %eax, m
	
	#printf("%d ",m);
	pushl m
	pushl $nr_s
	call printf
	popl %edx
	popl %edx
	
	#for( i = 1; i<= n*m; i++)
	movl $1, %edi
	movl n, %eax
	movl m, %edx
	mul %edx
	movl %eax, prod
	for1:
		cmp %edi, prod	
		jl exit_for1
		
		#res = strtok ( NULL, " " );
		pushl $separatori_s
		pushl $0
		call strtok
		movl %eax, res
		popl %edx
		popl %edx
		
		#nr[i] = atoi (res);
		pushl %edi
		
		pushl res
		call atoi
		movl %eax, atoiRes
		popl %edx
		mov %edi, %ecx
		lea nr, %edi #%edi = nr
		mov $0, %eax
		movl atoiRes, %edx
		movl %edx, (%edi, %ecx, 4)
		
		pushl (%edi, %ecx, 4)
		pushl $nr_s
		call printf
		popl %edx
		popl %edx
		
		popl %edi
		
		
		
		add $1, %edi	
		jmp for1
	
	exit_for1:
		
		
		
		
	#for( i = 1; i<= n*m; i++)
	movl $1, %edi
	movl n, %eax
	movl m, %edx
	mul %edx
	movl %eax, prod
	for2:
		cmp %edi, prod	
		jl exit_for2
		
		
		
		add $1, %edi	
		jmp for2
	
	exit_for2:
	
	
	
	
	
	
	
	
	
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


