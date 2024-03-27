# Fibonacci 0, 1, 1, 2, 3, 5, 8

# Eduardo 10/03/2024

.data
# Esta etiqueta sirve para guardar la secuencia de Fibonacci
fibo:



.text
main:
    addi s0 zero 8 # N de nuestra recursividad
    lui s1 %hi(fibo)
    addi s1 s1 %lo(fibo) # Apuntador para guardar los datos
    add a0 zero s0 # Pasar como argumento, nuestra N
    jal ra fib # ra es la etiqueta de retorno
    
    # Terminal el programa
    addi a7 zero 10
    ecall
    
fib:
    # Agregar el stack frame
    # Guardar ra, s0, s2
    addi sp sp -12 
    sw ra 8 sp
    sw s0 4 sp
    sw s2 0 sp
    
    
    add s0 zero a0 # Esto es como crear una variable local
    
    # if s0 == 0. Aqui, llegamos al final del algoritmo, por lo que nos vamos a enfib.
    # Endfib tiene el jalr zero ra 0, llevandonos a main
    beq s0 zero case0
    
    # else if s0 == 1
    addi t0 zero 1 # Lo asignamos temporal porque no se puede comparar rs con imm
    beq s0 t0 case1
    
    # else, siendo el caso recursivo
    addi a0 s0 -1 # n - 1, a0 no cambia
    jal ra fib
    add s2 zero a0 # a0 es nuestro resultado porque en endfib ahi lo anotamos
    # notar que usamos a para n-1 y n-2,
    addi a0 s0 -2 # n - 2
    jal ra fib
    add a0 s2 a0 # Escribir lo que teniamos en s2, el resultado de 0 y sumarlo entre si
    
    jal zero endfib # Terminar la logica del algoritmo
    
    
    # Usamos cases por lo de las interrupciones
    case0:
        addi a0 zero 0
        jal zero endfib
    case1: # Que llegue a donde mismo que endfib
        addi a0 zero 1
    endfib:
        # Como vamos a guardar todos los valores como si fuera un arreglo,
        # entonces podemos hacer algo con un apuntador p = s1 + ( i * 4)
        slli t0 s0 2 # Ahorita t0 tiene i*4. As? se multiplica * 4, recorriendo 2 to left
        add t0 t0 s1 # t0 es la direccion donde esta s1 en .data
        sw a0 0 t0
        
        # Recuperar el stack frame
        lw s2 0 sp
        lw s0 4 sp
        lw ra 8 sp
        addi sp sp 12 # Regresar los 12 que tomamos prestado
        
        jalr zero ra 0 # Para regresar al jal del main
        
        
        
        
        
        