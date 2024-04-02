# David Hernandez
# Jose Hurtado

.equ N 3

.data
torres:




.text
# Primero, tres apuntadores para las tres torres
# con base en la cantidad de discos maximos que pueden soportar

# s0 = Torre A
# s1 = Torre B
# s2 = Torre C

# Torre A
lui s0 %hi(torres)
addi s0 s0 %lo(torres) # Pointer where result will be stored

# Torre B
add s1 s0 s1
addi t0 zero 4 # size of word
addi t1 zero N
mul t0 t0 t1 # size of word * N (number of disks)
add s1 s1 t0

# Torre C
add s2 s1 s2
addi t0 zero 4 # size of word
addi t1 zero N
mul t0 t0 t1 # size of word * N (number of disks)
add s2 s2 t0


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
        sw t1 0 s0
        addi s0 s0 4 # move s0 + 4
        
        # i += 1
        addi t0 t0 1
        jal zero for_loop
        
end_load_data:    
    # Recuperar el espacio de s0 (Torre A)
    addi t0 zero 4 # size of word
    addi t1 zero N
    mul t0 t1 t0 # size of word * N
    addi t1 zero -1 # Make t1 = -1
    mul t0 t0 t1 # t0 = to * -1
    add s0 s0 t0


main:
    addi a0 zero 1
    addi a1 zero 2
    
    
    
    addi a7 zero 10
    ecall # Terminar programa





hanoi: # (n, start, end)
