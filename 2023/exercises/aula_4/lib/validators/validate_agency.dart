import 'package:dart_project/utils/messages.dart';

/// Responsabilidade:
/// - Validar o número da agência.
///
/// Regras:
/// - É válido se contiver exatamente 4 números.
///
/// Assinatura:
/// - Recebe uma [String] que é o valor a ser validado
/// - Retorna uma [String] que pode ser nula - [value]
///   - Se for [null], está válido
///   - Se for uma [String], está inválido

String? validateAgency(String value) {
  RegExp regExp = RegExp(r'^\d{4}$');

  if (!regExp.hasMatch(value)) {
    return Messages.invalidAgency;
  }

  return null;
}
