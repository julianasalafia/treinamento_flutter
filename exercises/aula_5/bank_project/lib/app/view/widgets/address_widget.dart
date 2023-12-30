import 'package:bank_project/app/view/controllers/register_page_controller.dart';
import 'package:bank_project/app/view/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';

class AddressWidget extends StatelessWidget {
  final AddressController address;

  const AddressWidget({super.key, required this.address});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.75,
      child: SingleChildScrollView(
        child: ListenableBuilder(
          listenable: address,
          builder: (context, _) {
            return Column(
              children: [
                const SizedBox(height: 25),
                TextFieldWidget(hintText: 'cep', controller: address.cep, onChanged: address.getAddress),
                const SizedBox(height: 15),
                TextFieldWidget(hintText: 'rua', controller: address.street, isLoading: address.isLoading),
                const SizedBox(height: 15),
                TextFieldWidget(hintText: 'número', controller: address.number),
                const SizedBox(height: 15),
                TextFieldWidget(
                    hintText: 'complemento', controller: address.complement),
                const SizedBox(height: 15),
                TextFieldWidget(hintText: 'bairro', controller: address.neighbourhood),
                const SizedBox(height: 15),
                TextFieldWidget(hintText: 'cidade', controller: address.city),
                const SizedBox(height: 15),
                TextFieldWidget(hintText: 'UF', controller: address.state),
                const SizedBox(height: 15),
              ],
            );
          },
        ),
      ),
    );
  }
}
