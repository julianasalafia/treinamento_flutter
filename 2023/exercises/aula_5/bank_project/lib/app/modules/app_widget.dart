import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../view/themes/app_theme.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'App Widget',
      routerConfig: Modular.routerConfig,
      theme: AppTheme.dark,
    );
  }
}
