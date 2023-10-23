import 'package:dart_project/utils/messages.dart';

/// Responsabilidade:
/// - Validar o endereço de email.
///
/// Regras:
/// - É válido se estiver no formato correto de email.
///
/// Assinatura:
/// - Recebe uma [String] que é o valor a ser validado
/// - Retorna uma [String] que pode ser nula - [value]
///   - Se for [null], está válido
///   - Se for uma [String], está inválido

String? validateEmail(String value) {
  RegExp regExp = RegExp(r'^[^@]+@[^@]+\.[^@]+$');

  if (!regExp.hasMatch(value)) {
    return Messages.invalidEmail;
  }

  return null;
}
