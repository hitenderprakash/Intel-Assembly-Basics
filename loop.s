 #VARIABLES: The registers have the following uses:
 #
 # %edi - Holds the index of the data item being examined
 # %ebx - Largest data item found
 # %eax - Current data item
 #
 # The following memory locations are used:
 #
 # data_items - contains the item data.  A 0 is used
 #              to terminate the data
 #
.section .data
data_items:                       #These are the data items
 .long 3,67,34,222,45,75,54,34,44,33,22,11,66,0

.section .text
 .globl _start
_start:
	movl data_items,%ecx
	addl $8,%ecx
	
	
	
	movl $0, %edi             # move 0 into the index register
	movl data_items(,%edi,4), %eax # load the first byte of data
	movl %eax, %ebx
# since this is the first item, %eax is
# the biggest
start_loop:
	cmpl $0, %eax
	je loop_exit

	# changes for incrementing each value in the data_items
	incl %eax
	movl %eax, data_items(,%edi,4)
	#changes ends here

	incl %edi
	movl data_items(,%edi,4), %eax

	#no need of the comaparison below as we are not returning max
	#cmpl %ebx, %eax
	#jle start_loop
	#movl %eax, %ebx
# compare values
# jump to loop beginning if the new
# one isn’t bigger
# move the value as the largest

# start loop
# check to see if we’ve hit the end
# load next value
 	jmp start_loop            # jump to loop beginning
loop_exit:
 
 
 
 
 # %ebx is the status code for the exit system call
 # and it already has the maximum number

    #test that values are incremented, returns the first data_item
    # it should return incremnted first data_item i.e 4
    movl data_items, %ebx 
    movl $1, %eax             #1 is the exit() syscall
    int  $0x80
    