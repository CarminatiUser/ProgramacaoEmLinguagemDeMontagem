/**
 * Disciplina: Arquitetura e Organização de Computadores
 * Atividade: Avaliação 01 – Programação em Linguagem de Montagem
 * Programa 01
 *
 * Grupo:
 * - Arthur Felipe Carminati
 * - Henrique Valiati Schroeder
 * - Vinícius Borchardt Grisa
 */

#include <iostream>
using namespace std;

const int TAM = 8;

int main()
{
    int Vetor_A[TAM] = {0, 0, 0, 0, 0, 0, 0, 0};
    int Vetor_B[TAM] = {0, 0, 0, 0, 0, 0, 0, 0};

    int tam_vetor = 0;

    // Solicita o tamanho dos vetores ao usuário
    cout << "\nInforme o tamanho dos vetores (um valor entre 2 e 8): ";
    cin >> tam_vetor;

    // Verifica se o tamanho é válido (entre 2 e 8)
    while (tam_vetor < 2 || tam_vetor > TAM)
    {
        cout << "\nValor inválido. Informe um valor entre 2 e 8, por favor: ";
        cin >> tam_vetor;
    }

    // Le os valores para cada vetor

    cout << "\nInforme os elementos do Vetor_A:\n";
    for (int i = 0; i < tam_vetor; i++)
    {
        cout << "Vetor_A[" << i << "] = ";
        cin >> Vetor_A[i];
    }

    cout << "\nInforme os elementos do Vetor_B:\n";
    for (int i = 0; i < tam_vetor; i++)
    {
        cout << "Vetor_B[" << i << "] = ";
        cin >> Vetor_B[i];
    }

    // Troca os valores dos elementos dos vetores de mesmo índice
    for (int i = 0; i < tam_vetor; i++)
    {
        int x = Vetor_A[i];
        Vetor_A[i] = Vetor_B[i];
        Vetor_B[i] = x;
    }

    // imprime novamente os vetores, com os valores trocados

    cout << "\nNovo Vetor_A:\n";
    for (int i = 0; i < tam_vetor; i++)
    {
        cout << "Vetor_A[" << i << "] = " << Vetor_A[i] << endl;
    }

    cout << "\nNovo Vetor_B:\n";
    for (int i = 0; i < tam_vetor; i++)
    {
        cout << "Vetor_B[" << i << "] = " << Vetor_B[i] << endl;
    }

    return 0;
}