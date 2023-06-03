import 'package:flutter/material.dart';
import 'package:kolaycateslimat/models/user_model.dart';
import 'package:mobx/mobx.dart';

part 'auth_store.g.dart';

class AuthStore = _AuthStore with _$AuthStore;

abstract class _AuthStore with Store {
  @observable
  UserModel? user;

  @computed
  bool get isLoggedIn => user != null;

  @action
  void login(String _phoneNumber) {
    if (_phoneNumber == '123456') {
      user = UserModel(
        firstName: 'John',
        lastName: 'Doe',
        phoneNumber: _phoneNumber,
      );
    } else {
      user = null;
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
