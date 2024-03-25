# Potencia de un numero

# Eduardo Gomez 24/03/2024


.text 

main:
    addi s0 zero 6 # m
    addi s1 zero 6 # n
    addi s2 zero 1 # Resultado
    
    jal ra potencia
    
    # Fin del programa
    addi a7 zero 10
    ecall
    
    
potencia:
    # Caso base if n < 1
    addi t0 zero 1
    blt s1 t0 fin_recursion
    
    # Else, realizar m * m
    addi t0 zero 6
    mul s2 s2 t0
    
    # Restar n -1 e ir a recursividad
    addi t0 zero 1
    sub s1 s1 t0
    jal zero potencia
    
    
    fin_recursion:
        jalr ra