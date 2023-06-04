import 'package:flutter/material.dart';
import 'package:kolaycateslimat/injector.dart' as injector;
import 'package:kolaycateslimat/models/user_model.dart';
import 'package:kolaycateslimat/network/auth_service.dart';
import 'package:mobx/mobx.dart';

part 'auth_store.g.dart';

class AuthStore = _AuthStore with _$AuthStore;

abstract class _AuthStore with Store {
  final AuthService authService = injector.serviceLocator.get<AuthService>();

  @observable
  UserModel? user;

  @computed
  bool get isLoggedIn => user != null;

  @action
  Future<void> login(String _phoneNumber) async {
    try {
      UserModel _userModel = await authService.login(_phoneNumber);

      user = _userModel;
    } catch (err) {
      throw Exception('Login failed');
    }
  }

  @action
  void logout() {
    user = null;
  }

  //

  // @observable
  // bool isLoggedIn = false;

  // @observable
  // String? firstName;

  // @observable
  // String? lastName;

  // @observable
  // String? phoneNumber;

  // @action
  // void login(String _phoneNumber) {
  //   if (_phoneNumber == '123456') {
  //     firstName = 'John';
  //     lastName = 'Doe';
  //     phoneNumber = _phoneNumber;
  //     isLoggedIn = true;
  //   } else {
  //     firstName = null;
  //     lastName = null;
  //     phoneNumber = null;
  //     isLoggedIn = false;
  //   }
  // }

  // @action
  // void loginWithException(String _phoneNumber) {
  //   if (_phoneNumber == '123456') {
  //     firstName = 'John';
  //     lastName = 'Doe';
  //     phoneNumber = _phoneNumber;
  //     isLoggedIn = true;
  //   } else {
  //     firstName = null;
  //     lastName = null;
  //     phoneNumber = null;
  //     isLoggedIn = false;

  //     throw Exception('Login failed');
  //   }
  // }

  // @action
  // void logout() {
  //   isLoggedIn = false;
  // }
}
