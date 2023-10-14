import '../../helper/constants/constants.dart';
import '../../helper/readers/read_int.dart';

enum OperationsMenu {
  carteira,
  espacoPIX,
  gerarCartaoVirtual,
  pagarBoleto,
  segundaViaCartao,
  rastrearCartao,
  ajuda,
  nenhum;

  OperationsMenu menuOptions() {
    OperationsMenu chosenOperation;

    int chooseMenuOption = readInt(availableOptionsMenu, 7);

    switch (chooseMenuOption) {
      case 1:
        chosenOperation = OperationsMenu.carteira;
        break;
      case 2:
        chosenOperation = OperationsMenu.espacoPIX;
        break;

      case 3:
        chosenOperation = OperationsMenu.gerarCartaoVirtual;
        break;

      case 4:
        chosenOperation = OperationsMenu.pagarBoleto;
        break;

      case 5:
        chosenOperation = OperationsMenu.segundaViaCartao;
        break;

      case 6:
        chosenOperation = OperationsMenu.rastrearCartao;
        break;

      case 7:
        chosenOperation = OperationsMenu.ajuda;
        break;

      default:
        chosenOperation = OperationsMenu.nenhum;
        break;
    }
    return chosenOperation;
  }
}
