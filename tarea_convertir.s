# Eduardo 13/03/2024

auipc s4 64528 # 1   
addi x20 x20 4 # 2
auipc x21 64528 # 3
addi x21 x21 8 # 4
addi x8 zero 10 # 5
addi x9 zero 1 # 6
addi x18 zero 3 # 7
add x5 x8 x9 # 8
sub x6 x18 x19 # 9
sll x7 x9 x19 # 10
sw t2 8 s4 # # 11 inst rs2 imm rs1
sw x7 4 x21 # 12 Tipo S
lw x28 8 x20 # 13 Tipo I inst rd imm rs1
lw x28 8 x21 # 14
bne x28 zero 0xFFFFFFF0 # 15
andi x29 x9 255 # 16
ori x30 x18 170 # 17
jal zero 0xFFFFFFBC