import 'package:flutter/material.dart';

import '../repositories/login_repository.dart';
import 'states/login_state.dart';

class LoginStore extends ChangeNotifier {
  LoginState state = const InitialLoginState();
  final LoginRepository _repository;

  LoginStore(this._repository);

  Future<void> login(String email, String password) async {
    state = const LoadingLoginState();
    notifyListeners();

    final isLogged = await _repository.login(email, password);

    if (isLogged) {
      state = const LoggedLoginState();
    } else {
      state = const FailureLoginState();
    }
    notifyListeners();
  }
}
