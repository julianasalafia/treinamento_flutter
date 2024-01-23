import 'package:dart_project/utils/messages.dart';

/// Responsabilidade:
/// - Validar o endereço.
///
/// Regras:
/// - É válido se contiver o tipo de rua (por exemplo, "Rua", "Avenida", etc.) e o nome da rua.
/// - Deve conter pelo menos um espaço para separar o tipo de rua do nome da rua.
///
/// Assinatura:
/// - Recebe uma [String] que é o valor a ser validado
/// - Retorna uma [String] que pode ser nula - [value]
///   - Se for [null], está válido
///   - Se for uma [String], está inválido

String? validateAddress(String value) {
  if (!value.contains(' ')) {
    return Messages.invalidAddress;
  }

  return null;
}
