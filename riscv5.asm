.data
frequencia: .word 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF,
                    0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF,
                    0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF,
                    0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF
                    
input1: .asciz "Entre com o número da aula (de 0 a 15): "
input2: .asciz "Entre com o número do aluno (de 0 a 31): "
input3: .asciz "Entre com o tipo do registro (presença = 1; ausência = 0): "

presente_str: .asciz "Presente\n"
ausente__str: .asciz "Ausente\n"

.text
.globl main

main:
    # inicializa registradores
    li t1, 0     # dia
    li t2, 0     # aluno
    li t3, 0     # registro
    li t4, 1     # mascara
    la s0, frequencia

loop:
    # pede entrada do dia
    la a0, input1
    li a7, 4
    ecall
    li a7, 5
    ecall
    mv t1, a0

    # pede entrada do aluno
    la a0, input2
    li a7, 4
    ecall
    li a7, 5
    ecall
    mv t2, a0

    # pede entrada do registro
    la a0, input3
    li a7, 4
    ecall
    li a7, 5
    ecall
    mv t3, a0

    # constrói a máscara de bits para o aluno e dia indicados
    add t5, zero, t2
    slli t5, t5, 2
    add t5, t5, t1
    sll t4, t4, t2
    or t4, t4, t5

    # realiza a operação de presença ou ausência
    beq t3, zero, ausente  # se t3 = 0, imprime ausente
    la a0, presente
    li a7, 4
    ecall
    sb t4, 0(s0)    # registra a presença
    j loop

ausente:
    la a0, ausente
    li a7, 4
    ecall
    and t4, t4, t6
    sb t4, (s0)    # registra a ausência
    j loop
