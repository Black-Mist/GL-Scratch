import 'package:flutter/material.dart';

class TestNotifier extends ChangeNotifier {
  // LoginStatus _status = LoginStatus.initialize;
  // String _error = '';
  // UserModel? _user;
  // LoginStatus get status => _status;
  // String get error => _error;
  // UserModel? get user => _user;

  // void login(String username, String password) async {
  //   notifyState(LoginStatus.loading);

  //   try {
  //     _user = await AppRepository().login(username, password);

  //     _authentication.authenticate(_user!);
  //     notifyState(LoginStatus.success);
  //   } catch (e) {
  //     _error = e.toString().replaceAll('Exception:', '');
  //     notifyState(LoginStatus.failed);
  //   }
  // }

  // void notifyState(LoginStatus state) {
  //   _status = state;
  //   notifyListeners();
  // }

  List<String> testList = ['a', 'b', 'c'];

  addToList(String value) {
    testList.add(value);
    notifyListeners();
  }
}

enum LoginStatus { initialize, loading, success, failed }
