.data	
	FavNumber: .word 69

.text
	li $v0, 1
	lw $a0, FavNumber
	syscall 