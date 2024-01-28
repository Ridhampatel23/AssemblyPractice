
.data 
ArraySize: .word  8 
array: .word  12, -1, 8, 0, 6, 85, -74, -23  

posNumber: .asciiz "\nNumber of positive numbers: "
zeroNum: .asciiz "\nTotal zeros: "
PosSum: .asciiz "\nSum is: "

.text 
.globl  main 
main:
    la  $s0, ArraySize # initialize registers 
    lw $s1,0($s0) #size 
    ori $s2,$0, 0 #SUM of Positive Nums  
    ori $s3,$0, 0 #Number of Positive Nums
    ori $s4,$0, 0 #Number of zeros
    ori $s5,$0,0 # index 
    la  $s6, array # array
    
    
    while:
        bge $s5, $s1, exit
        
        lw $s7, 0($s6)
        blt $s7, $zero, pos
        beq $s7, $zero, zeros
        addu $s2, $s2, $s7
        addi $s3, $s3, 1
        j pos
        
        zeros:
        addi $s4, $s4, 1
        j pos
        
        pos:
        addi $s5, $s5, 1
        addi $s6, $s6, 4
        j while
    exit:
        #displays total  
        li $v0, 4
        la $a0, zeroNum
        syscall
        li $v0, 1
        move $a0, $s4
        syscall
           
        li $v0, 4
        la $a0, posNumber
        syscall
        li $v0, 1
        move $a0, $s3
        syscall
        
        li $v0, 4
        la $a0, PosSum
        syscall
        li $v0, 1
        move $a0, $s2
        syscall
        
        
        
        #end
        li $v0, 10
        syscall