import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:to_do_list/app/core/services/local_storage/i_local_storage_service.dart';
import 'package:to_do_list/app/modules/home/pages/widgets/home_elevated_button_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO(jsalafia): criar uma splash
    Modular.get<ILocalStorageService>().load();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('State Management'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            HomeElevatedButtonWidget(
              route: '/vn/',
              title: 'ValueNotifier',
            ),
            HomeElevatedButtonWidget(
              route: '/cn/',
              title: 'ChangeNotifier',
            ),
            HomeElevatedButtonWidget(
              route: '/bloc/',
              title: 'Bloc',
            ),
            HomeElevatedButtonWidget(
              route: '/cubit/',
              title: 'Cubit',
            ),
            HomeElevatedButtonWidget(
              route: '/triple/',
              title: 'Triple',
            ),
          ],
        ),
      ),
    );
  }
}
