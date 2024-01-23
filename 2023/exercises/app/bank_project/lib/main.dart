import 'package:bank_project/pages/register_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Builder( // Adiciona um Builder aqui
          builder: (newContext) => Column( // Usa o novo contexto
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        newContext, // Usa o novo contexto
                        MaterialPageRoute(builder: (context) => const RegisterPage()),
                      );
                    }, 
                    child: const Text('Registro')
                  ),
                  TextButton(onPressed: () {}, child: const Text('Login')),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
