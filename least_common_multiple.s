# Least Common Multiple

# Eduardo 27/03/2024


.text

main:
    addi s0 zero 5 # a
    addi s1 zero 3 # b
    addi s2 zero 0 # c Result
    
    # lcm
    add a0 s0 zero
    add a1 s1 zero
    jal ra gdc
    
    # Once coming back fom recursion, we have stored in s2 gdc(a,b)
    mul t0 s0 s1
    div s2 t0 s2
    
    
    addi a7 zero 10
    ecall 
    
    
gdc:
    # GDC Algorithm
    # Stack Frame
    addi sp sp -12
    sw ra 8 sp
    sw a0 4 sp
    sw a1 0 sp
    
    # If b == 0, 
    beq a1 zero base_case_gdc
    
    # Else return gdc(b, a%b)
    add t0 zero a0
    add t1 zero a1
    
    # Turn a0 into a1, a = b which means first paremeter = second one
    # Get remainter a%b to b
    remu a1 a0 t1
    add a0 zero t1
    
    jal ra gdc
    
    # Once it comes back from recursion
    jal zero end_gdc # Use jal to skip the next line base_case_gdc
    
    base_case_gdc:
        # Add a0 as the result to s2
        add s2 zero a0
    
    end_gdc:
        # Stack frame
        lw ra 8 sp
        addi sp sp 12 # Get back Stack Frame
        jalr zero ra 0 # Move to ra