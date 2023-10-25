import 'package:dart_project/utils/messages.dart';

/// Responsabilidade:
/// - Validar a data de nascimento.
///
/// Regras:
/// - É válido se tiver 8 dígitos.
/// - Deve estar no formato dia/mês/ano.
/// - O dia deve ser entre 1 e 31.
/// - O mês deve ser entre 1 e 12.
/// - O ano deve ser razoável (por exemplo, nos últimos 130 anos).
///
/// Assinatura:
/// - Recebe uma [String] que é o valor a ser validado
/// - Retorna uma [String] que pode ser nula - [value]
///   - Se for [null], está válido
///   - Se for uma [String], está inválido

String? validateBirthAt(String value) {
  RegExp regExp = RegExp(r'^(\d{2})/(\d{2})/(\d{4})$');

  if (!regExp.hasMatch(value)) {
    return Messages.invalidFormatBirthAt;
  }

  final match = regExp.firstMatch(value)!;
  final day = int.parse(match.group(1)!);
  final month = int.parse(match.group(2)!);
  final year = int.parse(match.group(3)!);

  if (day < 1 || day > 31) {
    return Messages.invalidDayBirthAt;
  }

  if (month < 1 || month > 12) {
    return Messages.invalidMonthBirthAt;
  }

  final currentYear = DateTime.now().year;

  if (year < currentYear - 130 || year > currentYear) {
    return 'Ano inválido, deve ser entre ${currentYear - 130} e $currentYear.';
  }

  return null;
}
