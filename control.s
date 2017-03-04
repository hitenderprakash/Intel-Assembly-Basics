# code will output 10 if the data_item is greater than 10
# if data_item is smaller than 10 or equal to 10, it prints 0

.section .data
data_items:                       
 .long 11

.section .text
 .globl _start
_start:
	movl data_items,%ecx
	#mov the value to %ebx
	mov %ecx, %ebx
	cmpl $10, %ecx
	#if value was bigger than 10 go to exit as %ebx already has this value
	jg exit_loop
	
	#if value was lesser than or equal to 10, mov 0 to ebx
	movl $0, %ebx
	
 # %ebx is the status code for the exit system call
 # exit code
exit_loop:
    movl $1, %eax             #1 is the exit() syscall
    int  $0x80
    