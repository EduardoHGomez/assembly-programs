# Calculadora 
# Eduardo 24/03/2024

.text

main:
    # Asignacion de las constantes a sumar 
    addi s0 zero 4 # Selector
    addi s1 zero 5 # a
    addi s2 zero 3 # b
    addi s3 zero 0 # c = resultado    
    

    # Primero comparar si t0 == opcion 1
    addi t0 zero 1
    beq s0 t0 suma # Saltar a suma

    addi t0 zero 2
    beq s0 t0 resta # si t0 == 2 Saltar a resta

    addi t0 zero 3
    beq s0 t0 multiplicacion # si t0 == 3 Saltar a mul

    # Ninguna condicion, entonces salto a AND
    jal zero and
    
    
fin_programa:
    # Fin del programa
    addi a7 zero 10
    ecall

suma:
    add s3 s1 s2 # s1 + s2
    jal zero fin_programa
    
resta:
    sub s3 s1 s2 # s1 - s2
    jal zero fin_programa


multiplicacion:
    mul s3 s1 s2 # s1 * s3
    jal zero fin_programa

    
and:
    and s3 s1 s2 #
    jal zero fin_programa

    
    
    
    
    
