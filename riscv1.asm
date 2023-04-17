.data

Vetor_A: .word 0,0,0,0,0,0,0,0
Vetor_B: .word 0,0,0,0,0,0,0,0

prompt: .asciz "Entre com o tamanho dos vetores (m�x. = 8): "
invalid: .asciz "Valor inv�lido. Entre com um valor entre 2 e 8: "
new_line: .asciz "\n"

informe1: .asciz "Informe um valor para o Vetor A: "
informe2: .asciz "Informe um valor para o Vetor B: "
informe3: .asciz "Troca de vetores aqui."

.text

main: 

	# Guarda o endereço dos vetores na memória

    la s0, Vetor_A
    la s1, Vetor_B
    
read_size:

	# Exibe "Entre com o tamanho dos vetores (m�x. = 8): "
    addi a7, zero, 4
    la a0, prompt
    ecall 
    
	# Recebe o tamanho do vetor desejado
    addi a7, zero, 5
    ecall
    add t0, zero, a0
    
    # Define uma variável com valor 2
    li t1, 2           
    
    # Volta para o começo do loop caso o valor digitado seja < 2  
    bltu t0, t1, read_size 
   
    # Altera o valor da variável para 8
    li t1, 8       
    
    # Volta para o começo do loop caso o valor digitado seja > 8     
    bgtu t0, t1, read_size

	# Inicia um contador em 0
    addi t1, zero, 0
       
for:

	# Finaliza o loop caso o contador for igual ao tamanho digitado
    beq t1, t0, end_for
    
    # Exibe "Informe um valor para o Vetor A: "
    addi a7, zero, 4
    la a0, informe1
    ecall
    
    # Recebe o valor
    addi a7, zero, 5
    ecall
    add t3, zero, a0 
    
    # Insere o valor digitado na próxima posição do vetor
    slli t2, t1, 2 # Multiplica o contador atual por 4 (bytes), para cada posição do vetor
    add s2, s0, t2 # Guarda o endereço da memória e a posição em bytes para ser armazenada o valor
    sw t3, 0(s2) # Guarda o valor no array
    
    # Incrementa o contador
    addi t1, t1, 1
    
    # Volta para o início do for
    jal zero, for
    
end_for:

	# Pula uma linha;
    addi a7, zero, 4
    la a0, new_line
    ecall

	# Volta o contador para 0
    addi t1, zero, 0 

for2:

	# Finaliza o loop caso o contador for igual ao tamanho digitado
    beq t1, t0, troca_valores
    
    # Exibe "Informe um valor para o Vetor B: "
    addi a7, zero, 4
    la a0, informe2
    ecall
    
    # Recebe o valor
    addi a7, zero, 5
    ecall
    add t3, zero, a0
    
    # Insere o valor digitado na próxima posição do vetor
    slli t2, t1, 2 # Multiplica o contador atual por 4 (bytes), para cada posição do vetor
    add s2, s1, t2 # Guarda o endereço da memória e a posição em bytes para ser armazenada o valor
    sw t3, 0(s2) # Guarda o valor no array
    
    # Incrementa o contador
    addi t1, t1, 1
    
    # Volta para o início do for
    jal zero, for2
    
troca_valores:

	# Volta o contador para 0 para o próximo loop
    addi t1, zero, 0

for3:

	# Finaliza o loop caso o contador for igual ao tam_vetor
    beq t1, t0, exit
    
    # Multiplica o contador atual por 4 (bytes), para cada posição do vetor
    slli t2, t1, 2 
    
    # Guarda o endereço da memória do Vetor_A e a posição em bytes para saber 
    # onde armazenar o valor trocado
    add s3, s0, t2 
    
    # Recebe o valor da posição X do array A
    lw t3, 0(s3)
    
    # Guarda o endereço da memória e a posição em bytes para ser armazenada o valor
    add s2, s1, t2 
    
    # Recebe o valor na posição X do array B
    lw t4, 0(s2)
    
    # Realiza a inserção em cada vetor
    	
    sw t3, 0(s2)   # Vetor_B[0] = Vetor_A[0] (1)
    sw t4, 0(s3)   # Vetor_A[0] = Vetor_B[0] (7)

	# Incrementa o contador
    addi t1, t1, 1
    
    # Volta para o início do for
    jal zero, for3

exit:




