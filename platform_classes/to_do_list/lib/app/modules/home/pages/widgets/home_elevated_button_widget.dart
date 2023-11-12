import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeElevatedButtonWidget extends StatelessWidget {
  final String route;
  final String title;

  const HomeElevatedButtonWidget({
    super.key,
    required this.route,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(bottom: 4.0),
      child: ElevatedButton(
        onPressed: () => Modular.to.pushNamed(route),
        style: ElevatedButton.styleFrom(fixedSize: Size(size.width * 0.6, 40)),
        child: Text(title),
      ),
    );
  }
}
