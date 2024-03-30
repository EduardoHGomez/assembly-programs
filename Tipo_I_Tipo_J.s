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

# BRINCOS NO CONDICIONALES
# Tipo I jalr rd rs1 mm
# y Tipo J

# Tipo I
jal ra funcion # Aqui definimos funcion que esta hasta arriba
ori s0 s1 2

# Tipo J
# rd rs1 imm (offset)
jalr zero ra 0 # zero = PC + 4 (no va a pasar) y PC = ra + 0
# En la linea pasada, aseguramos que no se guarde en rd una
# direccion de retorno, simplemento porque no la necesitamos







