import 'dart:io';
import 'dart:math';

import 'package:dart_project/models/error_model.dart';
import 'package:dart_project/models/persons/person_model.dart';
import 'package:dart_project/models/user_model.dart';
import 'package:dart_project/utils/console.dart';
import 'package:dart_project/utils/labels.dart';
import 'package:dart_project/utils/messages.dart';
import 'package:dart_project/validators/validate_account.dart';
import 'package:dart_project/validators/validate_agency.dart';
import 'package:dart_project/validators/validate_email.dart';
import 'package:dart_project/validators/validate_telephone.dart';

import 'models/accounts/account_model.dart';
import 'models/cards/credit_card_model.dart';
import 'models/persons/physical_person_model.dart';

abstract class Printer with Console {
  void showPersonData({required PersonModel person, required UserModel user}) {
    if (person is PhysicalPersonModel) {
      showPhysicalPersonData(user: user, person: person);
    } else {
      showLegalPersonData(user: user, person: person);
    }
  }

  void showCardData({required AccountModel account}) {
    if (account.card is CreditCardModel) {
      showCreditCardInfo(account: account);
    } else {
      showDebitCardInfo(account: account);
    }
  }

  void showAccountLabelInfo({required AccountModel account}) {
    switch (account.accountType.label) {
      case Labels.savingAccount:
        showSavingAccountInfo(account: account);
        break;
      case Labels.salaryAccount:
        showSalaryAccountInfo(account: account);
        break;
      case Labels.investmentAccount:
        showInvestmentAccountInfo(account: account);
        break;
      default:
        showCurrentAccountInfo(account: account);
        break;
    }
  }

  void showUserLoginData({required user}) {
    print('''  
=====================================================
                  LOGIN CADASTRADO
=====================================================
  Usuário cadastrado: ${user.email}
  Senha: ${user.password}
=====================================================
''');
  }

  void showPhysicalPersonData({required user, required person}) {
    print('''  
=====================================================
                  DADOS DO USUÁRIO
=====================================================
  Nome: ${user.person.name}
  Telefone: ${user.person.telephone}  
  Endereço: ${user.person.address}
  CPF: ${person.cpf}
  Nascimento: ${person.birthAt}  
''');
  }

  void showLegalPersonData({required user, required person}) {
    print('''   
=====================================================
                  DADOS DO USUÁRIO
=====================================================

  Nome: ${user.person.name}
  Telefone: ${user.person.telephone}  
  Endereço: ${user.person.address}
  CNPJ: ${person.cnpj}  
''');
  }

  void showCreditCardInfo({required account}) {
    print('''  
=====================================================
            DADOS DO CARTÃO DE CRÉDITO
=====================================================
  
  Número: ${account.card.cardNumber}
  CVV: ${account.card.cvv}
  Bandeira: ${account.card.flag.label}
  Data de expiração: ${account.card.expirationDate}
''');
  }

  void showDebitCardInfo({required account}) {
    print('''  
=====================================================
            DADOS DO CARTÃO DE DÉBITO
=====================================================
  
  Número: ${account.card.cardNumber}
  CVV: ${account.card.cvv}
  Bandeira: ${account.card.flag.label}
  Data de expiração: ${account.card.expirationDate}
''');
  }

  void showAccountInfo({required user}) {
    print('''
=====================================================
                CONTAS CADASTRADAS
=====================================================
 
  Tipo de conta: ${user.person.accounts}
''');
  }

  void showAccountTypeInfo({required account}) {
    print('''
=====================================================
                CONTAS CADASTRADAS
=====================================================
  
  Tipo de conta: ${account.accountType.label}
''');
  }

  void showCurrentAccountInfo({required account}) {
    print('''
=====================================================
                  CONTA CORRENTE
=====================================================
 
  Saldo: ${account.balance}
  Conta: ${account.accountNumber}
  Agência: ${account.agencyNumber}
  Histórico de transações: ${account.transactionHistory}
  Cartão: ${account.card.toString()}
''');
  }

  void showSavingAccountInfo({required AccountModel account}) {
    print('''
=====================================================
                  CONTA POUPANÇA
=====================================================
 
  Saldo: ${account.balance}
  Conta: ${account.accountNumber}
  Agência: ${account.agencyNumber}
  Histórico de transações: ${account.transactionHistory}
  Cartão: ${account.card.toString()}
''');
  }

  void showSalaryAccountInfo({required AccountModel account}) {
    print('''
=====================================================
                  CONTA SALÁRIO
=====================================================
  
  Saldo: ${account.balance}
  Conta: ${account.accountNumber}
  Agência: ${account.agencyNumber}
  Histórico de transações: ${account.transactionHistory}
  Cartão: ${account.card.toString()}
''');
  }

  void showInvestmentAccountInfo({required AccountModel account}) {
    print('''
=====================================================
                CONTA INVESTIMENTO
=====================================================
  
  Saldo: ${account.balance}
  Conta: ${account.accountNumber}
  Agência: ${account.agencyNumber}
  Histórico de transações: ${account.transactionHistory}
  Cartão: ${account.card.toString()}
''');
  }

  AccountModel deposit({required AccountModel account}) {
    if (account.enabledDeposit) {
      Messages.depositTitle;
      stdout.write(Messages.questionDeposit);
      final valueDeposit = double.parse(stdin.readLineSync()!);

      try {
        final destinyAccount =
            writeAndReadWithValidator(Messages.destinyAccount, validateAccount);

        final destinyAgency =
            writeAndReadWithValidator(Messages.destinyAgency, validateAgency);

        account.deposit(
          account: account,
          valueDeposit: valueDeposit,
          destinyAccount: destinyAccount,
          destinyAgency: destinyAgency,
        );

        showDepositInfo(
          account,
          destinyAccount,
          destinyAgency,
          valueDeposit,
        );
      } on ErrorModel catch (e, _) {
        print(e.message);
      }
    } else {
      print(Messages.unauthorized);
    }

    return account;
  }

  AccountModel withdraw({required AccountModel account}) {
    Messages.withdrawTitle;
    stdout.write(Messages.questionWithdraw);
    final valueWithdraw = double.parse(stdin.readLineSync()!);

    try {
      account =
          account.withdraw(account: account, valueWithdraw: valueWithdraw);
      print(Messages.withdrawSuccess);
      showWithdrawInfo(account, valueWithdraw);
    } on ErrorModel catch (e, _) {
      print(e.message);
    }
    return account;
  }

  AccountModel transfer({required AccountModel account}) {
    List<String> keysPix = List.from(account.keysPix);
    late String userPixKey;

    print(Messages.transferTitle);

    String answer;

    stdout.write(Messages.questionTransfer);
    answer = stdin.readLineSync()!.toUpperCase();

    while (answer == 'Y') {
      if (keysPix.isNotEmpty) {
        for (var element in account.keysPix) {
          print('Chave cadastrada: $element.');
        }

        stdout.write(Messages.pixRegisteredKeys);
        answer = stdin.readLineSync()!.toUpperCase();

        if (answer == 'Y') {
          userPixKey = keysPix.first;
        }
      } else if (keysPix.isEmpty) {
        stdout.write(Messages.newPixTransfer);
        final userChoice = int.parse(stdin.readLineSync()!);

        switch (userChoice) {
          case 1:
            final pixEmail =
                writeAndReadWithValidator(Messages.typeEmail, validateEmail);
            userPixKey = pixEmail;
            break;
          case 2:
            final pixPhone = writeAndReadWithValidator(
                Messages.typePhoneNumber, validateTelephone);
            userPixKey = pixPhone;
            break;
          case 3:
            final pixRandomKey = generateRandomPixKey();
            userPixKey = pixRandomKey;
            break;
          default:
            print(Messages.invalidOption);
            break;
        }

        keysPix.add(userPixKey);
        account = account.copyWith(
          keysPix: keysPix,
        );
      }
      stdout.write(Messages.pixReceiverTransfer);
      final pixReceiver = stdin.readLineSync()!;

      stdout.write(Messages.pixAmountTransfer);
      final pixAmount = double.parse(stdin.readLineSync()!);

      if (account.balance > pixAmount) {
        final balance = account.balance - pixAmount;

        account = account.copyWith(
          balance: balance,
        );

        print('''
=====================================================
                PIX EFETUADO COM SUCESSO
=====================================================
  
     Remetente: $userPixKey
     Destinatário: $pixReceiver
        
     Saldo: ${account.balance}     
      
     ''');

        stdout.write('Deseja realizar outra transferência? [Y/N]:: ');
        answer = stdin.readLineSync()!.toUpperCase();
      }
    }

    return account;
  }

  void showWithdrawInfo(
    AccountModel account,
    double withdrawValue,
  ) {
    print(
      '''       
    VALOR SACADO: $withdrawValue 
    SALDO ATUALIZADO: ${account.balance}     
=====================================================

    ''',
    );
  }

  void showDepositInfo(
    AccountModel account,
    String destinyAccount,
    String destinyAgency,
    double depositedValue,
  ) {
    print(
      '''       
    VALOR DEPOSITADO: $depositedValue  
    
=====================================================
      
    DADOS DESTINO
    Conta: $destinyAccount
    Agência: $destinyAgency
    
=====================================================

    DADOS REMETENTE
    Conta: ${account.accountNumber}
    Agência: ${account.agencyNumber}    
    
=====================================================
    ''',
    );
  }

  String generateRandomPixKey() {
    final random = Random();
    const characters =
        'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
    final pixKey = List<String>.generate(
        30, (index) => characters[random.nextInt(characters.length)]).join();
    return pixKey;
  }
}
