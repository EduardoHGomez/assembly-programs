# Prime factorization of a number

# Eduardo 27/03/2024

.data
result:



.text
main:
    addi s0 zero 632 # N Input
    lui s1 %hi(result)
    addi s1 s1 %lo(result) # Pointer where result will be stored
    
    add a0 zero s0
    jal ra factorization
    
    addi a7 zero 10
    ecall
    
    
    
factorization:
    # Stack frame
    addi sp sp -4
    sw ra 0 sp
    
    # base case a0 == 1
    addi t1 zero 1
    beq a0 t1 base_case
    
    # while loop: explore all possibilities until a0%t0 is 0
    
    addi t0 zero 2 # t0 = iterador i 
    loop:
        # Repeat until a % i == 0
        rem t1 a0 t0
        beq t1 zero end_loop # if t0 (iterator) == 0
        addi t0 t0 1 # else, increment t0 by 1 
        jal zero loop
    
    end_loop:
        # Make division which will be an integer
        div a0 a0 t0
        addi s1 s1 4 # Move a word to store the result
        sw t0 0(s1)
        
     jal ra factorization
     
     jal zero end_factorization # Go to end_factorization
    
    
    base_case:
        # Load the last 1
        
        addi s1 s1 4 # Move a word to store the result
        sw a0 0(s1)
        
    
    
    end_factorization:
        lw ra 0 sp
        addi sp sp 4 # Return what was borrowed
        jalr zero ra 0