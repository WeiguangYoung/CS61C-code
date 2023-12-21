.globl argmax

.text
# =================================================================
# FUNCTION: Given a int array, return the index of the largest
#   element. If there are multiple, return the one
#   with the smallest index.
# Arguments:
#   a0 (int*) is the pointer to the start of the array
#   a1 (int)  is the # of elements in the array
# Registers:
#   t0, index of array
#   t1, memory location of an specific element
#   t2, specific element
#   t3, maximum element index
#   t4, maximum element
# Returns:
#   a0 (int)  is the first index of the largest element
# Exceptions:
#   - If the length of the array is less than 1,
#     this function terminates the program with error code 36
# =================================================================
argmax:
	# Prologue
	li t0, 1
	blt a1, t0, exception
	mv t0, x0
	mv t3, x0

loop_start:
	slli t1, t0, 2
	add t1, a0, t1
	lw t2, 0(t1)
	beq t0, x0, cache_first
	bgt t2, t4, update_index
	j loop_continue

cache_first:
    lw t4, 0(t1)
	j loop_continue

update_index:
	mv t3, t0
	mv t4, t2

loop_continue:
	addi t0, t0, 1
	blt t0, a1, loop_start
	j loop_end

loop_end:
	# Epilogue
	mv a0, t3
	ret

exception:
    li a0, 36
    j exit