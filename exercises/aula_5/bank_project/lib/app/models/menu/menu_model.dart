abstract class MenuModel {
  final String options;

  MenuModel({required this.options});
}

enum MenuOption {
  myData(code: 1, label: 'Meus Dados'),
  deposit(code: 2, label: 'Depósito'),
  transfer(code: 3, label: 'Transferência'),
  withdraw(code: 4, label: 'Saque'),
  statement(code: 5, label: 'Extrato'),
  quit(code: 6, label: 'Sair');

  const MenuOption({required this.label, required this.code});
  final int code;

  static MenuOption fromCode(int code) {
    return MenuOption.values.firstWhere((element) => element.code == code);
  }

  final String label;
}
