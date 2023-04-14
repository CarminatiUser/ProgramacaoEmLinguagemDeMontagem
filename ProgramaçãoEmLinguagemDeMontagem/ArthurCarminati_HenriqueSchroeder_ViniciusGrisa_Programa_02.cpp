#include <iostream>

using namespace std;

//Disciplina: Arquitetura e Organização de Computadores
//Atividade: Avaliação 01 – Programação em Linguagem de Montagem
//Programa 02

//Grupo: 
//- Arthur Felipe Carminati
//- Henrique Valiati Schroeder
//- Vinícius Borchardt Grisa

int main() {
    int frequencia[16][32] = {0}; // inicializa todos os elementos com zero
    
    while (true) {
        int aula, aluno, registro;
        
        cout << "Entre com o número da aula (de 0 a 15): ";
        cin >> aula;
        
        cout << "Entre com o número do aluno (de 0 a 31): ";
        cin >> aluno;
        
        cout << "Entre com o tipo do registro (presença = 1; ausência = 0): ";
        cin >> registro;
        
        frequencia[aula][aluno] = registro; // atualiza a matriz de frequência
        
        cout << "Registro atualizado.\n";
        
        // exibe a matriz de frequência atualizada
        cout << "Matriz de frequência:\n";
        for (int i = 0; i < 16; i++) {
            for (int j = 0; j < 32; j++) {
                cout << frequencia[i][j] << " ";
            }
            cout << endl;
        }
    }
    
    return 0;
}
