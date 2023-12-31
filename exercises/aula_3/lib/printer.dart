import 'package:dart_project/models/persons/person_model.dart';
import 'package:dart_project/models/user_model.dart';
import 'package:dart_project/utils/console.dart';
import 'package:dart_project/utils/labels.dart';

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
    if (account.accountType.label == Labels.currentAccount) {
      showCurrentAccountInfo(account: account);
    } else if (account.accountType.label == Labels.savingAccount) {
      showSavingAccountInfo(account: account);
    } else if (account.accountType.label == Labels.salaryAccount) {
      showSalaryAccountInfo(account: account);
    } else if (account.accountType.label == Labels.investmentAccount) {
      showInvestmentAccountInfo(account: account);
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
}
