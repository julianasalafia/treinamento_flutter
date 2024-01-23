import 'package:dart_project/app.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

void main() async {
  await Parse().initialize('7T3LMu5EyWtjxsl4AgFUtiueUvTL6fNR8YVQ9LpV',
      'https://parseapi.back4app.com',
      clientKey: 'qdbIShDwenNVUxQvPBQkwqERoeVNHQNjYZRghtBV',
      debug: true,
      autoSendSessionId: true,
      coreStore: CoreStoreMemoryImp());

  App app = App();
  app.run();
}
