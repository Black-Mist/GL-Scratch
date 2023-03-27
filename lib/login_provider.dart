// import 'package:calltracker/models/user_model.dart';
// import 'package:calltracker/networking/repository/repository.dart';
// import 'package:calltracker/networking/riverpod/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:gl_tasks/user_model.dart';

import 'auth_provider.dart';
import 'repository.dart';

class LoginProvider extends ChangeNotifier {
  LoginProvider(this._authentication);
  final Authentication _authentication;

  LoginStatus _status = LoginStatus.initialize;
  String _error = '';
  UserModel? _user;
  LoginStatus get status => _status;
  String get error => _error;
  UserModel? get user => _user;

  void login(String username, String password) async {
    notifyState(LoginStatus.loading);

    try {
      _user = await AppRepository().login(username, password);

      _authentication.authenticate(_user!);
      notifyState(LoginStatus.success);
    } catch (e) {
      _error = e.toString().replaceAll('Exception:', '');
      notifyState(LoginStatus.failed);
    }
  }

  void notifyState(LoginStatus state) {
    _status = state;
    notifyListeners();
  }
}

enum LoginStatus { initialize, loading, success, failed }
