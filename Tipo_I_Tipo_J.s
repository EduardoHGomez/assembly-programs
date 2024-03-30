# Brincos condicionales
# Tipo - B (branch)

# Siempre comparan entre registros
# No puedo comparar un registro y un inmediato

funcion: beq s0 s1 salto

beq s0 s1 salto # branch if s0 == s1 entonces pc = pc + 4
addi t0 zero salto
addi t1 zero salto
addi t0 zero salto
addi t1 zero salto

# Etiqueta se usa para cambiar las constantes y que sea automatico
# es decir, que sea relativo
salto: addi a5 zero 32




