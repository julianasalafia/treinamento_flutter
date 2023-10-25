import 'package:dart_project/utils/messages.dart';

/// Responsabilidade:
/// - Validar o numero de CPF completo.
///
/// Regras:
/// - É valido se tiver 11 digitos.
/// - Só são permitidos números.
///
/// Assinatura:
/// - Recebe uma [String] que é o valor a ser validado
/// - Retornar uma [String] que pode ser nula - [value]
///   - Se for [null], está valido
///   - Se for uma [String], está invalido
String? validateCPF(String value) {
  RegExp regExp = RegExp(r'^\d+$');

  if (!regExp.hasMatch(value)) {
    return Messages.invalidNumbers;
  }

  if (value.length != 11) {
    return Messages.invalidCpf;
  }

  return null;
}
