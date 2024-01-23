import 'package:bank_project/app/models/address_model.dart';
import 'package:bank_project/app/services/i_http_service.dart';

class AddressService {
  final IHttpService _httpService;

  const AddressService({required IHttpService httpService}) : _httpService = httpService;

  Future<AddressModel> getAddress(String cep) async {
    final response = await _httpService.get(url: 'https://viacep.com.br/ws/$cep/json/');

    final result =  AddressModel(
      street: response.data['logradouro'],
      number: '',
      complement: '',
      neighbourhood: response.data['bairro'],
      cep: response.data['cep'],
      city: response.data['localidade'],
      state: response.data['uf'],
    );

    await Future.delayed(const Duration(seconds: 2));
    return result;
  }
}
