# Convert an integer to binary
# Example: 56 to 111000
# Make it recursive

# Eduardo 28/03/2024


.text

main:
    addi a0 zero 56 # N Input
    addi a1 zero 1 # Multiplier
    addi s1 zero 0 # Result
    
    jal ra recursive_call    
    
    
    # End program
    addi a7 zero 10
    ecall


recursive_call:
    # Stack frame
    addi sp sp -4
    sw ra 0 sp
    
    # Base case
    # if a0 is 0, then quit recursion
    beq a0 zero end_recursion
    
    # Else, store remainder in t0 and add to s1 according to the position
    # in decimal that it belong to
    addi t0 zero 2
    rem t0 a0 t0 # Remainder of a0/2
    mul t0 t0 a1 # Remainder (0 or 1) by decimal position
    add s1 s1 t0 # Add to result
    
    # Toggle multiplier by 10
    addi a1 zero 10
    mul a1 a1 t0
    
    # Divide by 2 and store value
    addi t0 zero 2
    div a0 a0 t0
    
    # Make recursive call
    jal ra recursive_call
    
    
    # Get back stack frame
    end_recursion:
    lw ra 0 sp
    jalr zero ra 0