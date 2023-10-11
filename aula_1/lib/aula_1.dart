import 'package:aula_1/shared/read_int.dart';
import 'package:aula_1/shared/read_string.dart';

enum TipoPessoa { pessoaFisica, pessoaJuridica }

void main() {
  String name;
  String surname;
  String address;
  String phone;
  String cpf;
  String cnpj;

  print(
      '\n ============================================================================== \nOlá, para iniciar seu cadastro, vamos precisar de algumas informações sobre você. \n ============================================================================== \n');

  TipoPessoa tipoPessoa = getTipoPessoa();

  name = readString('Qual seu nome? ');
  surname = readString('Qual seu sobrenome? ');
  address = readString('Qual seu endereço? ');
  phone = readNumberAsString('Qual seu telefone? ');

  if (tipoPessoa == TipoPessoa.pessoaFisica) {
    cpf = readNumberAsString('Qual seu CPF? ');
  } else {
    cnpj = readNumberAsString('Qual seu CNPJ? ');
  }
}

TipoPessoa getTipoPessoa() {
  while (true) {
    int tipoPessoa = readInt(
        'Você é pessoa física ou jurídica? Digite o número correspondente: \n1) Física \n2) Jurídica \n:: ',
        2);

    switch (tipoPessoa) {
      case 1:
        return TipoPessoa.pessoaFisica;
      case 2:
        return TipoPessoa.pessoaJuridica;
      default:
        return TipoPessoa.pessoaFisica;
    }
  }
}
