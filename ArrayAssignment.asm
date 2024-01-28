.data
	MyArray: .space 32 
.text
	main:
	addi $s0, $zero, 12
	addi $s1, $zero, -1
	addi $s2, $zero, 8
	addi $s3, $zero, 0 
	addi $s4, $zero, 6
	addi $s5, $zero, 85
	addi $s6, $zero, -74
	addi $s7, $zero, -23
	
	#store value
	addi $t0, $zero, 0
	sw $s0, MyArray($t0)
	addi $t0, $t0, 4
	sw $s1, MyArray($t0)
	addi $t0, $t0, 4
	sw $s2, MyArray($t0)
	addi $t0, $t0, 4
	sw $s3, MyArray($t0)
	addi $t0, $t0, 4
	sw $s4, MyArray($t0)
	addi $t0, $t0, 4
	sw $s5, MyArray($t0)
	addi $t0, $t0, 4
	sw $s6, MyArray($t0)
	addi $t0, $t0, 4
	sw $s7, MyArray($t0)
	
	#loop
	addi $t0, $zero, 0
	
	while:
		beq $t0, 32, exit
		
		lw $t6, MyArray($t0)
		
		bne  $t0, $zero, zeros
		blt $t0, $zero, PosSum
		addi $t0, $t0, 4
		
		j while
		
	addi $t8, $zero, 0 
	addi $t9, $zero, 0	
	PosSum:
		addi $t8, $t8, 1
		
	
	
	zeros:	
		addi $t9, $t9, 1			
		
	li $v0, 4
	la $a0, PosSum
	syscall	
	
	
exit: 
li $v0, 10
syscall 	
	
	
	
	