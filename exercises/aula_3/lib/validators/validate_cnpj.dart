import 'package:dart_project/utils/messages.dart';

/// Responsabilidade:
/// - Validar o número de CNPJ completo.
///
/// Regras:
/// - É válido se tiver 14 dígitos.
/// - Só são permitidos números.
///
/// Assinatura:
/// - Recebe uma [String] que é o valor a ser validado
/// - Retorna uma [String] que pode ser nula - [value]
///   - Se for [null], está válido
///   - Se for uma [String], está inválido

String? validateCNPJ(String value) {
  RegExp regExp = RegExp(r'^\d+$');

  if (!regExp.hasMatch(value)) {
    return Messages.invalidNumbers;
  }

  if (value.length != 14) {
    return Messages.invalidCpnj;
  }

  return null;
}
