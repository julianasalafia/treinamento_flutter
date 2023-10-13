import 'dart:io';

import 'package:aula_1/shared/read_int.dart';
import 'package:aula_1/shared/read_string.dart';

enum TipoPessoa { pessoaFisica, pessoaJuridica }

enum TipoCartao { cartaoCredito, cartaoDebito }

enum OperacoesMenu {
  carteira,
  espacoPIX,
  gerarCartaoVirtual,
  pagarBoleto,
  segundaViaCartao,
  rastrearCartao,
  ajuda,
  nenhum,
}

void main() {
  String name;
  String surname;
  String address;
  String phone;
  String cpf;
  String cnpj;

  messageSignUp();
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

  welcomeMessage(name);
}

OperacoesMenu welcomeMessage(String name) {
  stdout.write('Seja bem-vindo(a) $name! ');

  int escolhaOperacao = readInt(
      'Conta criada com sucesso. Deseja realizar alguma operação? Digite o número correspondente: '
      '\n1) Carteira '
      '\n2) Espaço PIX'
      '\n3) Gerar cartão virtual'
      '\n4) Pagar boleto'
      '\n5) 2ª via do cartão'
      '\n6) Rastrear cartão'
      '\n7) Ajuda'
      '\n:: ',
      7);

  switch (escolhaOperacao) {
    case 1:
      return OperacoesMenu.carteira;
    case 2:
      return OperacoesMenu.espacoPIX;
    case 3:
      return OperacoesMenu.gerarCartaoVirtual;
    case 4:
      return OperacoesMenu.pagarBoleto;
    case 5:
      return OperacoesMenu.segundaViaCartao;
    case 6:
      return OperacoesMenu.rastrearCartao;
    case 7:
      return OperacoesMenu.ajuda;
    default:
      return OperacoesMenu.nenhum;
  }
}

void messageSignUp() {
  print(
      '\n ============================================================================== \nOlá, para iniciar seu cadastro, vamos precisar de algumas informações sobre você. \n ============================================================================== \n');
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
