class AddressModel {
  final String street;
  final String number;
  final String complement;
  final String neighbourhood;
  final String cep;
  final String city;
  final String state;

  AddressModel({
    required this.street,
    required this.number,
    required this.complement,
    required this.neighbourhood,
    required this.cep,
    required this.city,
    required this.state,
  });

  Map<String, dynamic> toJson() {
    return {
      'street': street,
      'number': number,
      'complement': complement,
      'neighbourhood': neighbourhood,
      'CEP': cep,
      'city': city,
      'state': state,
    };
  }

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      street: json['street'],
      number: json['number'],
      complement: json['complement'],
      neighbourhood: json['neighbourhood'],
      cep: json['CEP'],
      city: json['city'],
      state: json['state'],
    );
  }
}