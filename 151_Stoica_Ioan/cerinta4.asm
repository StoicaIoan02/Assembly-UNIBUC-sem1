.data
x: .long 23
formatString: .asciz "Numarul de afisat este: %d"
.text
.global main
main:

pushl x
pushl $formatString
call printf
popl %ebx
popl %ebx

pushl $0
call fflush
popl %ebx

movl $1, %eax
xorl %ebx, %ebx
int $0x80
