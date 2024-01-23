import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

import 'app/modules/app_widget.dart';
import 'app/modules/app_module.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  const keyApplicationId = '7rX0ttJNUBQoPriSnIJDP2Gp3YOQDmQhOJtZZl4m';
  const keyClientKey = 'tEgDYszh2wZgRCUewOCpCMtZGjb8KT7MZub8dmL5';
  const keyParseServerUrl = 'https://parseapi.back4app.com';

  await Parse().initialize(keyApplicationId, keyParseServerUrl,
      clientKey: keyClientKey, autoSendSessionId: true);

  runApp(
    ModularApp(
      module: AppModule(),
      child: const AppWidget(),
    ),
  );
}
