

# STILL MAKE CHANGES 
.equ N 121 # Constante, es nuestro valor de entrada

.data
# No vamos a guardar los resultados (creo, por lo que no se usa)
# pero para el ejercicio 1, por ejemplo, creo que si se usuaria data
# si vamos a usar data, entonces usar lui y addi


.text

main:
    addi a0 zero N # Usar el valor de entrada (N) y pasarlo como argumento
    
    # Primero comprobar si es negativo
    addi t2 zero 0
    blt a0 t2 entrada_negativa
    
    # Else: entrar a caso recursivo
    jal ra division
    
    # Registros s: debe conservar el mismo valor despues de salir de division
    
    # Fin del programa
    addi s0 zero N
    addi a7 zero 10
    ecall
    
    entrada_negativa:
        addi s0 zero N
        addi s1 zero -1
        # Fin del programa
        addi a7 zero 10
        ecall


    division:
        # Stack frame
        # Guardar ra
        addi sp sp -4
        sw ra 0 sp
        
        # Pseudoinstruccion li s0 5
        add s0 zero a0 # Asignar s0 como variable local
        
        # if a0 < 0 caso cuando sea negativo
        addi t0 zero 0 # Asignar una variable temporal
        blt s0 t0 case_neg # Si se cumple la condicion, saltar a case_negative
        
        # if a0 == 0 caso donde s� es divisible
        beq s0 zero case_zero # Saltar a case_zero si es igual a cero
        
        # Caso recursivo, donde todavia no se llega a menor que 0
        # por lo que seguimos restando 11. Por ejemplo, si tuvieramos 5,
        # entonces no llegamos a las condiciones de arriba, sino que seguimos
        # restando hasta que lleguemos a un numero negativo. Entonces, se resume
        # else 
        addi a0 s0 -11 # a0 = s0 - 11
        jal ra division
        
        # Despues de salir de lar recursividad, irse a end_division
        jal zero end_division
        
        
        case_zero:
            addi s1 zero 0 # Regresar 0 (exito) significando que si es divisible
            jal zero end_division
        
        case_neg:
            addi s1 zero 1 # Regresar -1 si es negativo, como dice la instruccion
            jal zero end_division
        
        end_division:
            # Recuperar el stack frame
            lw ra 0 sp
            addi sp sp 4 # Regresar los 12 prestados
            
            jalr zero ra 0 # Regresar al valor de entrada
        

