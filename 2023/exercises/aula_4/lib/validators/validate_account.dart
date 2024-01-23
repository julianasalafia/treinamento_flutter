import '../utils/messages.dart';

/// Responsabilidade:
/// - Validar o número da conta.
///
/// Regras:
/// - É válido se estiver no formato correto de conta (00000-0).
///
/// Assinatura:
/// - Recebe uma [String] que é o valor a ser validado
/// - Retorna uma [String] que pode ser nula - [value]
///   - Se for [null], está válido
///   - Se for uma [String], está inválido
String? validateAccount(String value) {
  RegExp regExp = RegExp(r'^\d{4}-\d$');

  if (!regExp.hasMatch(value)) {
    return Messages.invalidAccount;
  }

  return null;
}
