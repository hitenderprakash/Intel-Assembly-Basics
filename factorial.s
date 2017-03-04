#purpose:  program to illustrate how functions work
#          this program will compute factorial
#	   factrial(n)=n*factorial(n-1)
# This program will output the factorial for 5
# Output will be 120

.section .data
data_item:
.long 5

.section .text
.globl _start
_start:
movl data_item, %eax
pushl %eax      #push argument
call factorial  #call the function
addl $4, %esp   #move the stack pointer back
movl %eax, %ebx

# exit here 
movl $1,%eax
int $0x80

#purpose:  This recursive function is used to compute the factorial of a number
#          
#input:  first argument - the number.
#output:  will give the result as a return value
#variables:
#               %ebx - holds the number
#               %eax is used for temporary storage
.type factorial, @function
factorial:
pushl %ebp              #save old base pointer
movl %esp, %ebp         #make stack pointer the base pointer
movl 8(%ebp), %eax      #put first argument in %eax
cmpl $1, %eax
je end_factorial

decl %eax
pushl %eax
call factorial
movl 8(%ebp), %ebx 
imull %ebx, %eax

end_factorial:
movl %ebp, %esp         #restore the stack pointer
popl %ebp               #restore the base pointer
ret

