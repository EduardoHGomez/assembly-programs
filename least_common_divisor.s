# Minimo Comun Multiplo

# Eduardo 27/03/2024



.text

main:
    addi s0 zero 6 # a
    addi s1 zero 12 # b
    addi s2 zero 0 # c Resultado
    
    # lcm
    add a0 s0 zero
    add a1 s1 zero
    jal ra gdc
    
    
    addi a7 zero 10
    ecall 
    
    
    
    
gdc:
    # Funcion para calcular el gdc
    # Reservar stack
    addi sp sp -12
    sw ra 8 sp
    sw a0 4 sp
    sw a1 0 sp
    
    
    
    
    
    