enum UserChoice {
  email(code: 1, label: 'Email'),
  phone(code: 2, label: 'Telefone'),
  random(code: 3, label: 'Chave Aleatória');

  const UserChoice({required this.code, required this.label});
  final int code;

  static UserChoice fromCode(int code) {
    return UserChoice.values.firstWhere((element) => element.code == code);
  }

  final String label;
}
