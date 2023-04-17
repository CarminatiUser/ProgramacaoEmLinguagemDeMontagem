.data
frequencia:
  .word 0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff,
        0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff,
        0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff,
        0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff
        
msg_dia: .asciz "Entre com o número da aula (de 0 a 15): "
msg_aluno: .asciz "Entre com o número do aluno (de 0 a 31): "
msg_presenca: .asciz "Entre com o tipo do registro (presença = 1; ausência = 0): "

.text
main:

	la s0, frequencia

  loop:
 
    # cout << msg_dia
    addi a7, zero, 4
    la a0, msg_dia
    ecall
    
    # cin >> dia da aula
    addi a7, zero, 5
    ecall
    add t0, zero, a0
    
    #------------------------------------
    
    # cout << msg_aluno
    addi a7, zero, 4
    la a0, msg_aluno
    ecall
            
    # cin >> numero do aluno
    addi a7, zero, 5
    ecall
    add t1, zero, a0
    
    #------------------------------------
    
    # cout << msg_presenca
    addi a7, zero, 4
    la a0, msg_presenca
    ecall
    
    # cin >> tipo da presenca
    addi a7, zero, 5
    ecall
    add t2, zero, a0
    
    #------------------------------------
    
    li t4, 1
    sll t4, t4, t1  # shift 1 to the left by the student number
    not t3, t0      # invert the day of the class
    
    slli t3, t3, 2   # shift the inverted day of the class by 2 to get the correct word
    lw t5, frequencia(t3) # load the current word of the attendance register
    and t4, t4, t2   # set or clear the bit according to the attendance type
    xor t5, t5, t4   # update the attendance register with the new bit
    sw t5, frequencia(t3) # store the updated word back to the attendance register
    
    j loop
