.data

Vetor_A: .word 0,0,0,0,0,0,0,0
Vetor_B: .word 0,0,0,0,0,0,0,0

prompt: .asciz "Entre com o tamanho dos vetores (máx. = 8): "
invalid: .asciz "Valor inválido. Entre com um valor entre 2 e 8: "
new_line: .asciz "\n"

informe1: .asciz "Vetor_A[%d]: "
informe2: .asciz "Vetor_B[%d]: "
informe3: .asciz "Troca de vetores aqui."

.text

main: 
    la s0, Vetor_A # s0 = *Vetor_A
    la s1, Vetor_B # s1 = *Vetor_B
    
read_size:

	# cout << "Entre com o tamanho dos vetores (máx. = 8): "
    addi a7, zero, 4
    la a0, prompt
    ecall 
    
	# cin >> tamanho_vetor
    addi a7, zero, 5
    ecall
    add t0, zero, a0
    
    li t1, 2             
    bltu t0, t1, read_size # if(tam_vetor < 2) volta
    li t1, 8             
    bgtu t0, t1, read_size   # if(tam_vetor > 8) volta

    addi t1, zero, 0 # int count = 0;
    
    add s7, zero, t0 # int max_count = tamanho;
       
for:

    beq t1, s7, end_for # Finaliza o loop caso o contador for igual ao tamanho digitado
    
    # cout << "Informe um valor para o Vetor A: "
    addi a7, zero, 4
    la a0, informe1
    ecall
    
    # int valor; cin >> valor;
    addi a7, zero, 5
    ecall
    add t3, zero, a0 
    
    slli t2, t1, 2 # posicao_do_vetor = 4 x contador
    add s2, s0, t2
    sw t3, 0(s2)
    
    addi t1, t1, 1 # i++
    
    # Volta para o começo do for
    jal zero, for
    
end_for:

	# cout << endl;
    addi a7, zero, 4
    la a0, new_line
    ecall

    addi t1, zero, 0 # int t1 = 0;

for2:

    beq t1, s7, troca_valores
    
    # cout << "Informe um valor para o Vetor B: "
    addi a7, zero, 4
    la a0, informe2
    ecall
    
    # int valor; cin >> valor;
    addi a7, zero, 5
    ecall
    add t3, zero, a0
    
    #calcula a posição do vetor que vai escrever
    slli t2, t1, 2 # posicao_do_vetor = 4 x contador
    add s2, s1, t2
    sw t3, 0(s2)
    
    addi t1, t1, 1 # i++
    
    # Volta para o começo do for
    jal zero, for2
    
troca_valores:

    addi t1, zero, 0 # int t1 = 0;

for3:

    beq t1, s7, end_troca # Finaliza o loop caso o contador for igual ao tam_vetor
    
    slli t2, t1, 2 # Posicao para acessar na memória (4 x contador = x bytes)
    
    add s3, s0, t2 # *Vetor_A
    
    lw t3, 0(s3)   # t3 = Vetor_A[0]
    
    add s2, s1, t2 # *Vetor_B
    
    lw t4, 0(s2)   # t4 = Vetor_B[0]
    
    sw t3, 0(s2)   # Vetor_B[0] = Vetor_A[0] (1)
    sw t4, 0(s3)   # Vetor_A[0] = Vetor_B[0] (7)

    addi t1, t1, 1 # i++
    
    # Volta para o começo do for
    jal zero, for3

end_troca:




