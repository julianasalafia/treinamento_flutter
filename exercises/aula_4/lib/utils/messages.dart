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
  static const invalidAccount = 'Conta inválida';
  static const invalidAgency = 'Agência inválida';
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

  static const signUpSuccess = '''
=====================================================
           CONTA CADASTRADA COM SUCESSO
=====================================================
      ''';

  static const depositTitle = '''
=====================================================
                   DEPOSITAR
=====================================================
      ''';

  static const depositSuccess = '''
=====================================================
           DEPÓSITO EFETUADO COM SUCESSO
=====================================================
      ''';

  static const withdrawSuccess = '''
=====================================================
             SAQUE EFETUADO COM SUCESSO
=====================================================
      ''';

  static const withdrawTitle = '''
=====================================================
                      SACAR
=====================================================
      ''';

  static const transferTitle = '''
=====================================================
                   TRANSFERÊNCIA
=====================================================
      ''';

  static const unauthorized = '''
=====================================================
                   NÃO AUTORIZADO
=====================================================

  Ação não autorizada para esse tipo de conta.
  
      ''';

  static const menuOptions = '''
=====================================================
                      M E N U
=====================================================
  
    Seja bem vindo ao banco, escolha uma operação:
    
    [1] Meus dados
    [2] Depositar
    [3] Transferir
    [4] Sacar
    [5] Extrato
    :: ''';

  static const questionDeposit = 'Qual valor deseja depositar? ';
  static const questionWithdraw = 'Qual valor deseja sacar? ';
  static const questionTransfer =
      'Deseja efetuar uma transferência via PIX? [Y/N]:: ';

  static const newPixTransfer = '''
Para continuar, vamos cadastrar uma chave PIX. 
Escolha a opção desejada:
  [1] Email
  [2] Celular
  [3] Aleatória
  ::  ''';

  static const userPixKey = 'Digite a chave escolhida: ';

  static const chooseKeyPixTransfer = 'Qual chave PIX deseja utilizar? ';

  static const pixReceiverTransfer = 'PIX de destino: ';
  static const pixAmountTransfer = 'Qual valor deseja transferir? ';
  static const pixRegisteredKeys =
      'Você já possui uma chave pix cadastrada. Deseja utiliza-la? [Y/N]:: ';

  static const destinyAccount = 'Conta destino: ';
  static const destinyAgency = 'Agência destino: ';
  static const notEnoughBalance = '''
  
=====================================================
                SALDO INSUFICIENTE
=====================================================
   Você não possui dinheiro o suficiente em sua 
   conta para efetuar a transação.
   
      ''';
}
