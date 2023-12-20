.globl relu

.text
# ==============================================================================
# FUNCTION: Performs an inplace element-wise ReLU on an array of ints
# Arguments:
#   a0 (int*) is the pointer to the array
#   a1 (int)  is the # of elements in the array
# Registers:
#   t0 is index of array
#   t1 is memory location of an specific element
#   t2 is element at ceratin index
# Returns:
#   None
# Exceptions:
#   - If the length of the array is less than 1,
#     this function terminates the program with error code 36
# ==============================================================================
relu:
	# Prologue
	li t0, 1
	blt a1, t0, exception
	mv t0, x0

loop_start:
	slli t1, t0, 2
	add t1, a0, t1
	lw t2, 0(t1)
	blt t2, x0, set_zero

loop_continue:
	addi t0, t0, 1
	blt t0, a1, loop_start
	j loop_end

set_zero:
	sw x0, 0(t1)
	j loop_continue

exception:
	li a0, 36
	j exit

loop_end:
	# Epilogue
	ret
