#include <iostream>
using namespace std;

int main()
{
    int frequencia[16] = {0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF,
                          0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF,
                          0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF,
                          0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF};

    while (true)
    {
        int dia, aluno, registro;

        cout << "Entre com o numero da aula (de 0 a 15): ";
        cin >> dia;

        cout << "Entre com o numero do aluno (de 0 a 31): ";
        cin >> aluno;

        cout << "Entre com o tipo do registro (presenca = 1; ausencia = 0): ";
        cin >> registro;

        // Máscara de bits
        int mascara = 1 << aluno;

        if (registro == 0)
        { // Registro de ausência
            mascara = ~mascara;

            frequencia[dia] &= mascara;
        }
        else
        { // Registro de presença
            frequencia[dia] |= mascara;
        }

        // Imprime a frequência atualizada
        cout << "Frequencia atualizada para o dia " << dia << ":" << endl;
        for (int i = 0; i < 32; i++)
        {
            if (frequencia[dia] & (1 << i))
            {
                cout << "Aluno " << i << ": Presente" << endl;
            }
            else
            {
                cout << "Aluno " << i << ": Ausente" << endl;
            }
        }
    }

    return 0;
}
