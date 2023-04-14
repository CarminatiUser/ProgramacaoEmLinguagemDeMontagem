//Disciplina: Arquitetura e Organização de Computadores
//Atividade: Avaliação 01 – Programação em Linguagem de Montagem
//Programa 02


//Grupo:
//- Arthur Felipe Carminati
//- Henrique Valiati Schroeder
//- Vinícius Borchardt Grisa


#include <iostream>


using namespace std;


int main() {
    int frequencia[16][32] = {0}; // inicializa todos os elementos da matriz como zero
   
    while (true) {
        int aula, aluno, registro;
       
	  // escolhe a aula para registrar
        cout << "Entre com o número da aula (de 0 a 15): ";
        cin >> aula;
       
	  // escolhe o aluno para registrar
        cout << "Entre com o número do aluno (de 0 a 31): ";
        cin >> aluno;
       
	  // escolhe qual registro (presença ou ausência)
        cout << "Entre com o tipo do registro (presença = 1; ausência = 0): ";
        cin >> registro;
       
        frequencia[aula][aluno] = registro; // atualiza a matriz de frequência, inserindo o valor escolhido na posição da matriz
       
	  // confirma a atualização da tabela
        cout << "Registro atualizado.\n";
       
        // mostra a nova matriz com o valor escolhido, atualizada em tempo real
        cout << "Matriz de frequência:\n";
        for (int i = 0; i < 16; i++) {
            for (int j = 0; j < 32; j++) {
                cout << frequencia[i][j] << " ";
            }
            cout << endl;
        }
    }
   
    system ("pause");


    return 0;
}
