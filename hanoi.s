# Torres de Hanoi 01/04/2024

# David Hernandez
# Jose Hurtado

.equ N 2

.data
torres:




.text
# Primero, tres apuntadores para las tres torres
# con base en la cantidad de discos maximos que pueden soportar

# s1 = Torre A
# s2 = Torre B
# s3 = Torre C

# Torre A
lui s1 %hi(torres)
addi s1 s1 %lo(torres) # Pointer where result will be stored

# Torre B
add s2 s1 s2
addi t0 zero 4 # size of word
addi t1 zero N
mul t0 t0 t1 # size of word * N (number of disks)
add s2 s2 t0

# Torre C
add s3 s2 s3
addi t0 zero 4 # size of word
addi t1 zero N
mul t0 t0 t1 # size of word * N (number of disks)
add s3 s3 t0


# cargar discos de la forma
# for i in N, load disks

load_data:
    addi t0 zero 0 # iterator
    
    for_loop:
        # if i == N, break and go to end_load_data
        addi t1 zero N
        beq t0 t1 end_load_data
        
        # else
        addi t1 zero N
        sub t1 t1 t0 # Store N - i
        sw t1 0 s1
        addi s1 s1 4 # move s1 + 4
        
        # i += 1
        addi t0 t0 1
        jal zero for_loop
        
end_load_data:    
    # Recuperar el espacio de s1 (Torre A)
    addi s1 s1 -4


main:
    addi s0 zero N # Torre de discos
    addi s1 s1 0 # Apuntador a Torre 1
    addi s2 s2 0 # Apuntador a Torre 2 
    addi s3 s3 0 # Apuntador a Torre 3

    addi a0 s0 0 # Argumento de n
    addi a1 zero 1 # Argumento de n
    addi a2 zero 3 # Argumento de n
    addi a3 zero 2 # Argumento de n
    

    jal ra hanoi
    
    addi a7 zero 10
    ecall # Terminar programa
    
    
hanoi: # (N, origen, destino, auxiliar)# Torres de Hanoi 01/04/2024
       # (a0, a1, a2, a3)
       
    # Guardar Stack frame (ra)
    addi sp sp -20
    sw ra 16 sp
    sw s8 12 sp
    sw s9 sp
    sw s10 4 sp
    sw s11 0 sp

    # Guardar en variables locales
    add s8 zero a0 # s8 = N
    add s9 zero a1 # s9 = ORIGEN
    add s10 zero a2 # s10 = DESTINO 
    add s11 zero a3 # s11 = AUXILIAR 
       

    # if N == 1 entonces mover disco 1 de origen a destino
    addi t0 zero 1 # Asignar a 1
    beq s8 t0 base_case 


    # === hanoi(N - 1, origen, auxiliar, destino); ====
    addi a0 s0 -1 # N(argumento) = N - 1
    add a1 zero s9 # a1 = origen actual (s9)
    add a2 zero s11 # a2 = auxiliar actual (s11)
    add a3 zero s10 # a3 = destino actual (s10)
    jal ra hanoi
    
    # === printf("Mover disco %d desde %c hasta %c\n", N, origen, destino) === 
    jal ra move

    # === moverTorres(N - 1, auxiliar, destino, origen); === 
    addi a0 s0 -1 # N(argumento) = N - 1
    add a1 zero s11 # a1 = auxiliar actual (s11)
    add a2 zero s10 # a2 = destino actual (s10)
    add a3 zero s9 # a1 = origen actual (s9)
    jal ra hanoi


    jal zero end_hanoi_return




#==========================================

asignar_t0_s1:
    addi t0 s1 0
    jal zero end_hanoi_destino

asignar_t0_s2:
    addi t0 s2 0
    jal zero end_hanoi_destino
    
asignar_t0_s3:
    addi t0 s3 0
    jal zero end_hanoi_destino


asignar_t1_s1:
    addi t1 s1 0
    jal zero end_hanoi_move

asignar_t1_s2:
    addi t1 s2 0
    jal zero end_hanoi_move

asignar_t1_s3:
    addi t1 s3 0
    jal zero end_hanoi_move


moveOri1:
    addi s1 s1 -4
    jal zero end_hanoi_update_destino

moveOri2:
    addi s2 s2 -4
    jal zero end_hanoi_update_destino 

moveOri3:
    addi s3 s3 -4
    jal zero end_hanoi_update_destino

    

moveOriM1:
    addi s1 s1 4
    jalr zero ra 0 
    
moveOriM2:
    addi s2 s2 4
    jalr zero ra 0 

moveOriM3:
    addi s3 s3 4
    jalr zero ra 0 

#==========================================

base_case:
    # Hacer swap
    jal ra move

    # Ir a end_hanoi 
    jal zero end_hanoi_return



move:
    # t0 = origen
    # t1 = destino 

    # if origen == 1 entonces t0 = s1
    addi t2 zero 1 
    beq s9 t2 asignar_t0_s1

    # if origen == 2 entonces t0 = s2
    addi t2 zero 2 
    beq s10 t2 asignar_t0_s2

    # if origen == 3 entonces t0 = s3
    addi t2 zero 3 
    beq s11 t2 asignar_t0_s3

    end_hanoi_destino:


        # if destino == 1 entonces t1 = s1
        addi t2 zero 1 
        beq s10 t2 asignar_t1_s1

        # if destino == 2 entonces t1 = s2
        addi t2 zero 2 
        beq s10 t2 asignar_t1_s2
        
        # if destino == 3 entonces t1 = s3
        addi t2 zero 3 
        beq s10 t2 asignar_t1_s3

    # SIGUIENTE PASO HACER MOVE
    end_hanoi_move:
        # Hacer movimiento del disco que apunta a t0 (origen) a t1 (destino)
        lw t2 0 t0
        sw t2 0(t1)
        addi t1 t1 4 # Mover apunatdor destino +4 para almacenar el disco 
        
        sw zero 0(t0)
        

    # ACTUALIAR APUNTADORES de los registros s: Mover el apuntador del origen -4

    # if origen == 1 entonces mover s1 - 4
    addi t2 zero 1 
    beq s9 t2 moveOri1
    
    # if origen == 2 entonces t0 = s2 - 4
    addi t2 zero 2
    beq s9 t2 moveOri2
    
    # if origen == 3 entonces t0 = s3 - 4
    addi t2 zero 3 
    beq s9 t2 moveOri3
        
    end_hanoi_update_destino:
        
        # Mover el apuntador del origen -4
        # if destino == 1 entonces mover s1 + 4
        addi t2 zero 1 
        beq a10 t2 moveOriM1

        # if destino == 2 entonces t0 = s2 + 4
        addi t2 zero 2 
        beq a10 t2 moveOriM2
        
        # if destino == 3 entonces t0 = s3 + 4
        addi t2 zero 3 
        beq a10 t2 moveOriM3
        

end_hanoi_return:
    # Recuperar Stack frame (ra)
    lw ra 16 sp
    lw s8 12 sp
    lw s9 sp
    lw s10 4 sp
    lw s11 0 sp
    addi sp sp 20

    jalr zero ra 0 # Regresar a ra

