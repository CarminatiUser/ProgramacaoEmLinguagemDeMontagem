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
    int Vetor_A[TAM] = {0}; // vetor de tamanho 8 inicializados em 0
    int Vetor_B[TAM] = {0}; // vetor de tamanho 8 inicializados em 0
    int tam_vetor = 0; // tamanho dos vetores inicializado em 0
    int x = 0; // variável temporária para troca de valores
   
    // solicita ao usuário o tamanho dos vetores
    cout << "Informe o tamanho dos vetores (máx. = 8): ";
    cin >> tam_vetor;
   
    // verifica se o tamanho é válido (abaixo de 8 e maior que 0)
    while (tam_vetor < 2 || tam_vetor > TAM) {
        cout << "Valor inválido. Informe um valor menor que 8 e maior que 0): ";
        cin >> tam_vetor;
    }
   
    // lê todos os elementos do Vetor_A
    cout << "Entre com os elementos do Vetor_A:\n";
    for (int i = 0; i < tam_vetor; i++) {
        cout << "Vetor_A[" << i << "] = ";
        cin >> Vetor_A[i];
    }
   
    // lê todos os elementos do Vetor_B
    cout << "Entre com os elementos do Vetor_B:\n";
    for (int i = 0; i < tam_vetor; i++) {
        cout << "Vetor_B[" << i << "] = ";
        cin >> Vetor_B[i];
    }
   
    // troca os valores dos elementos dos vetores de mesmo índice
    for (int i = 0; i < tam_vetor; i++) {
        x = Vetor_A[i];
        Vetor_A[i] = Vetor_B[i];
        Vetor_B[i] = x;
    }
    // imprime novamente os vetores
    cout << "Novo Vetor_A:\n";
    for (int i = 0; i < tam_vetor; i++) {
        cout << "Vetor_A[" << i << "] = " << Vetor_A[i] << endl;
    }
   
    cout << "Novo Vetor_B:\n";
    for (int i = 0; i < tam_vetor; i++) {
        cout << "Vetor_B[" << i << "] = " << Vetor_B[i] << endl;
    }
   
    system ("pause");


    return 0;
}
