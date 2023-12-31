class Messages {
  static const welcome = '\nBem vindo ao Banco!';

  static const choosePersonType = '''
  
=====================================================
  Sua conta será para:

  1 - Pessoa Física
  2 - Pessoa Jurídica
=====================================================
  :: ''';

  static const chooseAccountTypePhysical = '''
  
=====================================================
  Qual conta você deseja ativar?
  
  1 - Conta Corrente
  2 - Conta Poupança
  3 - Conta Investimento 
=====================================================
  :: 
  ''';

  static const chooseAccountTypePhysicalWithSalary = '''
  
=====================================================
  Qual conta você deseja ativar?
  
  1 - Conta Corrente
  2 - Conta Poupança
  3 - Conta Investimento 
  4 - Conta Salário 
=====================================================
  ::  ''';

  static const chooseAccountTypeLegal = '''
  
=====================================================
  Qual conta você deseja ativar?
  
  1 - Conta Corrente
  2 - Conta Poupança  
=====================================================
  ::  ''';

  static const chooseTypeCard = '''
  
=====================================================
  Qual cartão você deseja ativar?
  
  1 - Crédito
  2 - Débito
=====================================================
  ::  ''';

  static const typeCompleteName = 'Digite seu nome completo: ';
  static const typePhoneNumber = 'Digite seu telefone: ';
  static const typeAddress = 'Digite seu endereço: ';
  static const typeCpf = 'Digite seu CPF: ';
  static const typeBirthAt = 'Digite sua data de nascimento: ';

  static const typeCompanyName = 'Digite o nome fantasia: ';
  static const typeCnpj = 'Digite seu CNPJ: ';

  static const typeEmail = 'Digite seu email: ';
  static const typePassword = 'Digite sua senha: ';

  static const loginData = '''  
=====================================================
Insira os dados que serão utilizados para entrar.
=====================================================
''';

  static const invalidValue = 'Valor inválido';
  static const tryAgain = 'Digite novamente';
  static const invalidAddress =
      'Valor inválido, preencha com "Rua/Avenida/etc" e o nome da rua. ';

  static const invalidBalance = 'Valor inválido, deve ser um número.';

  static const invalidFormatBirthAt =
      'Valor inválido, deve estar no formato dia/mês/ano';
  static const invalidDayBirthAt = 'Dia inválido, deve ser entre 1 e 31.';
  static const invalidMonthBirthAt = 'Mês inválido, deve ser entre 1 e 12.';

  static const invalidNumbers = 'Valor inválido, deve conter apenas números.';

  static const invalidCpnj =
      'Valor inválido, o CNPJ deve conter exatamente 14 caracteres.';

  static const invalidCpf =
      'Valor inválido, o CPF deve conter exatamente 11 caracteres.';

  static const invalidEmail =
      'Valor inválido, deve estar no formato correto de email.';

  static const invalidName = 'Valor inválido, deve ser o nome completo';

  static const invalidPassword =
      'Senha inválida, deve conter letras e números, e pelo menos uma letra maiúscula.';

  static const invalidTelephone =
      'Valor inválido, o telefone deve conter exatamente 11 caracteres.';

  static const invalidOption = 'Escolha um número válido.';
}
