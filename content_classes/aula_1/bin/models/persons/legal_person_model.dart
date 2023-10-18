import 'person_model.dart';

class LegalPersonModel extends PersonModel {
  final String cnpj;

  LegalPersonModel({
    required this.cnpj,
    required super.id,
    required super.name,
    required super.address,
    required super.phone,
    required super.createdAt,
    required super.contas,
  });
}

// definir os métodos / ações
// quais ações uma conta tem? comprar, passar no credito? debito? pagar com pix? saque? deposito?

// terminal: cadastrar tudo no terminal
// coloque email e senha, nome, cpf, etc, nao precisa validar

// usermodel, personmodel (legal, physical), account (current, investment - qdo pode selecionar cada tipo de conta?)