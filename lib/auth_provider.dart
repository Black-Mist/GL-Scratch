import 'dart:convert';

// import 'package:calltracker/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:gl_tasks/user_model.dart';

enum AuthState { initialize, authenticated, unauthenticated, firstTime }

class Authentication extends ChangeNotifier {
  FlutterSecureStorage secureStorage = const FlutterSecureStorage();
  AuthState _state = AuthState.initialize;
  AuthState get state => _state;
  String _error = '';
  String get error => _error;

  Future<void> init() async {
    await Future.delayed(const Duration(seconds: 2));
    // if (await isFirstTime()) {
    //   _deleteUser();
    //   changeState(AuthState.firstTime);
    //   return;
    // }
    UserModel? user;
    try {
      user = await _getUser();
    } catch (e) {
      _error = e.toString();
    }
    if (user != null) {
      UserData().user = user;
      changeState(AuthState.authenticated);
    } else {
      changeState(AuthState.unauthenticated);
    }
  }

  Future<void> authenticate(UserModel logData) async {
    UserData().user = logData;
    await _saveUser(logData);
    changeState(AuthState.authenticated);
  }

  Future<void> unauthenticate() async {
    UserData().user = UserModel();
    await _deleteUser();
    changeState(AuthState.unauthenticated);
  }

  void changeState(value) {
    _state = value;
    notifyListeners();
  }

  // check if
  // Future<bool> isFirstTime() async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   final bool isFirstTime = prefs.getBool('first_time') ?? true;

  //   if (isFirstTime) {
  //     prefs.setBool('first_time', false);
  //     return true;
  //   } else {
  //     return false;
  //   }
  // }

  /// delete from keystore/keychain
  Future<void> _deleteUser() async {
    await secureStorage.delete(key: 'user');
  }

  /// write to keystore/keychain
  Future<void> _saveUser(UserModel userModel) async {
    final userString = json.encode(userModel.toJson());
    await secureStorage.write(key: 'user', value: userString);
  }

  /// read from keystore/keychain
  Future<UserModel?> _getUser() async {
    final userString = await secureStorage.read(key: 'user') ?? '';

    return userString != ''
        ? UserModel.fromJson(json.decode(userString) as Map<String, dynamic>)
        : null;
  }
}
