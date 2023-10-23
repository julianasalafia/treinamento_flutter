import 'package:dart_project/utils/messages.dart';

/// Responsabilidade:
/// - Validar a senha.
///
/// Regras:
/// - É válida se contiver letras e números, e pelo menos uma letra maiúscula.
///
/// Assinatura:
/// - Recebe uma [String] que é o valor a ser validado
/// - Retorna uma [String] que pode ser nula - [value]
///   - Se for [null], está válido
///   - Se for uma [String], está inválido

String? validatePassword(String value) {
  RegExp regExp = RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$');

  if (!regExp.hasMatch(value)) {
    return Messages.invalidPassword;
  }

  return null;
}
