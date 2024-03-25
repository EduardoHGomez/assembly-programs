# Producto Punto

# Eduardo 24/03/2024


.data
# Seccion para arreglos

# int Vector_1[9] = { 1, 2, 3, 4, 5, 6, 7, 8, 9 };
# int Vector_2[9] = { -1,2,-3,4,-5,6,-7,8,-9 };

vector1:
    
vector2:


.text
main:
    # Vector 1
    lui s0 %hi(vector1)
    addi s0 s0 %lo(vector1) # Apuntador para guardar los datos
    # Escritura de datos
    addi t0 zero 1
    sw t0 0(s0)
    
    addi t0 zero 2
    sw t0 4(s0) 
    
    addi t0 zero 3
    sw t0 8(s0)
    
    addi t0 zero 4
    sw t0 12(s0)
    
    addi t0 zero 5
    sw t0 16(s0) 
    
    addi t0 zero 6
    sw t0 20(s0) 
     
    addi t0 zero 7
    sw t0 24(s0)
    
    addi t0 zero 8
    sw t0 28(s0) 
    
    addi t0 zero 9
    sw t0 32(s0)    
    
    # Vector 2
    lui s1 %hi(vector2)
    addi s1 s1 %lo(vector2) # Apuntador para guardar los datos
    addi s1 s1 36 # Esta linea es para comenzar donde termino vector_1
    
    addi t0 zero -1
    sw t0 0(s1)
    
    addi t0 zero 2
    sw t0 4(s1) 
    
    addi t0 zero -3
    sw t0 8(s1)
    
    addi t0 zero 4
    sw t0 12(s1)
    
    addi t0 zero -5
    sw t0 16(s1) 
    
    addi t0 zero 6
    sw t0 20(s1) 
     
    addi t0 zero -7
    sw t0 24(s1)
    
    addi t0 zero 8
    sw t0 28(s1) 
    
    addi t0 zero -9
    sw t0 32(s1)
    
    # ----- Resto del Programa ------
    addi s2 zero 0 # i iterador
    addi s3 zero 0 # resultado
    addi t0 zero 9 # Fin del for loop
    
    # Ciclo for
    for_loop:
        # Condicion cuando llegue a 9
        beq s2 t0 fin_programa
        
        # Entrar a la funcion del producto punto
        jal ra product_function
        
        # Una vez la multiplicacion en a0, sumar y guardar en res
        add s3 s3 a0
        
        
        # Incrementar iterador
        addi s2 s2 1
        jal zero for_loop # Regresar al inicio del ciclo for
    
    
    fin_programa:
    # Fin del programa
    addi a7 zero 10
    ecall
    
product_function:
    # El offset sera con base en el valor del iterador
    # cumpliendo la funcion como si accediera de forma similar
    # con vector[0], vector[1]... vector[8]
    # Esto se realiza despues de cargar a y b
    

    # Cargar a y b
    lw a0 0 s0
    lw a1 0 s1
    
    # Realizar multiplicacion y guardar en a0
    mul a0 a0 a1
    
    # Offset mencionado al inicio de la funcion, offset de un word
    addi s0 s0 4
    addi s1 s1 4
    
    jalr zero ra 0 

    
    
    
    
    
    
    
    