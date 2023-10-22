import 'dart:io';

class Pessoa {
  String nome;
  double peso;
  double altura;
  double imc;
  String classificacao;

  Pessoa(this.nome, this.peso, this.altura)
      : imc = calcularIMC(peso, altura),
        classificacao = classificarIMC(calcularIMC(peso, altura));

  static double calcularIMC(double peso, double altura) {
    if (altura <= 0 || peso <= 0) {
      throw ArgumentError('Altura e peso devem ser valores positivos.');
    }
    return peso / (altura * altura);
  }

  static String classificarIMC(double imc) {
    if (imc < 18.5) {
      return 'Abaixo do peso';
    } else if (imc < 24.9) {
      return 'Peso normal';
    } else if (imc < 29.9) {
      return 'Sobrepeso';
    } else if (imc < 34.9) {
      return 'Obesidade grau 1';
    } else if (imc < 39.9) {
      return 'Obesidade grau 2';
    } else {
      return 'Obesidade grau 3';
    }
  }
}

void main() {
  try {
    print('Digite seu nome: ');
    String nome = stdin.readLineSync() ?? "";

    print('Digite seu peso (em kg): ');
    double? peso = double.tryParse(stdin.readLineSync() ?? "");

    print('Digite sua altura (em metros): ');
    double? altura = double.tryParse(stdin.readLineSync() ?? "");

    if (peso == null || altura == null) {
      throw FormatException('Dados de peso ou altura inválidos');
    }

    Pessoa pessoa = Pessoa(nome, peso, altura);

    print('Nome: ${pessoa.nome}');
    print('IMC: ${pessoa.imc}');
    print('Classificação: ${pessoa.classificacao}');
  } catch (e) {
    print('Erro: $e');
  }
}