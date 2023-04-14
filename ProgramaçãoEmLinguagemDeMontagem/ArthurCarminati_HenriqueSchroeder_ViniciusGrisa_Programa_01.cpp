#include <iostream>

using namespace std;


const int TAM = 8;

//Disciplina: Arquitetura e Organização de Computadores
//Atividade: Avaliação 01 – Programação em Linguagem de Montagem
//Programa 01

//Grupo: 
//- Arthur Felipe Carminati
//- Henrique Valiati Schroeder
//- Vinícius Borchardt Grisa

int main() {
    int Vetor_A[TAM] = {0}; // vetor com 8 elementos inicializados em 0
    int Vetor_B[TAM] = {0}; // vetor com 8 elementos inicializados em 0
    int vetor_size = 0; // tamanho dos vetores
    int temp = 0; // variável temporária para troca de valores
    
    // solicita o tamanho dos vetores
    cout << "Entre com o tamanho dos vetores (máx. = 8): ";
    cin >> vetor_size;
    
    // verifica se o tamanho é válido
    while (vetor_size < 2 || vetor_size > TAM) {
        cout << "Valor inválido. Entre com o tamanho dos vetores (máx. = 8): ";
        cin >> vetor_size;
    }
    
    // lê todos os elementos do Vetor_A
    cout << "Entre com os elementos do Vetor_A:\n";
    for (int i = 0; i < vetor_size; i++) {
        cout << "Vetor_A[" << i << "] = ";
        cin >> Vetor_A[i];
    }
    
    // lê todos os elementos do Vetor_B
    cout << "Entre com os elementos do Vetor_B:\n";
    for (int i = 0; i < vetor_size; i++) {
        cout << "Vetor_B[" << i << "] = ";
        cin >> Vetor_B[i];
    }
    
    // troca os valores dos elementos dos vetores de mesmo índice
    for (int i = 0; i < vetor_size; i++) {
        temp = Vetor_A[i];
        Vetor_A[i] = Vetor_B[i];
        Vetor_B[i] = temp;
    }
    
    // imprime novamente os vetores
    cout << "Novo Vetor_A:\n";
    for (int i = 0; i < vetor_size; i++) {
        cout << "Vetor_A[" << i << "] = " << Vetor_A[i] << endl;
    }
    
    cout << "Novo Vetor_B:\n";
    for (int i = 0; i < vetor_size; i++) {
        cout << "Vetor_B[" << i << "] = " << Vetor_B[i] << endl;
    }
    
    system ("pause");

    return 0;
}
