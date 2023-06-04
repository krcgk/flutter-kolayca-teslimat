import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kolaycateslimat/injector.dart' as injector;
import 'package:kolaycateslimat/pages/example_service.dart';
import 'package:kolaycateslimat/routes.dart';
import 'package:kolaycateslimat/stores/auth_store.dart';
import 'package:kolaycateslimat/stores/root_store.dart';
import 'package:kolaycateslimat/stores/theme_store.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late RootStore _rootStore;
  late AuthStore _authStore;
  late ThemeStore _themeStore;

  final ExampleService _exampleService = injector.serviceLocator.get<ExampleService>();
  final TextEditingController _phoneNumberController = new TextEditingController();

  bool loginIsStarted = false;

  @override
  void initState() {
    super.initState();
    SharedPreferences.getInstance().then((SharedPreferences sharedPreferences) {
      _phoneNumberController.text = sharedPreferences.getString('phoneNumber') ?? '';
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _rootStore = Provider.of<RootStore>(context);
    _authStore = _rootStore.authStore;
    _themeStore = _rootStore.themeStore;
  }

  void attemptLogin() {
    if (_phoneNumberController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Lütfen telefon numaranızı giriniz.'),
        ),
      );
    } else {
      startLogin();
    }
  }

  Future<void> startLogin() async {
    await _authStore.login(_phoneNumberController.text);

    if (_authStore.isLoggedIn == true) {
      Navigator.of(context).pushReplacementNamed(Routes.home);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Bilgileriniz Hatali.'),
        ),
      );
    }
  }

  // void startLoginRequestWithException() {
  //   try {
  //     _authStore.loginWithException(_phoneNumberController.text);

  //     if (_authStore.isLoggedIn == true) {
  //       Navigator.of(context).pushReplacementNamed(Routes.home);
  //     } else {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(
  //           content: Text('Bilgileriniz Hatali.'),
  //         ),
  //       );
  //     }
  //   } catch (error) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         content: Text(error.toString()),
  //       ),
  //     );
  //   } finally {
  //     print('Login Request Finished');
  //   }
  // }

  // void startLoginRequest() {
  //   _authStore.login(_phoneNumberController.text);

  //   if (_authStore.isLoggedIn == true) {
  //     print('Login Success');
  //     Navigator.of(context).pushReplacementNamed(Routes.home);
  //   } else {
  //     print('Login Failed');
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         content: Text('Bilgileriniz Hatali.'),
  //       ),
  //     );
  //   }
  // }

  // void startFakeRequest() {
  //   setState(() {
  //     loginIsStarted = true;
  //   });

  //   Future.delayed(Duration(seconds: 1), () {
  //     setState(() {
  //       loginIsStarted = false;
  //     });

  //     SharedPreferences.getInstance().then((SharedPreferences sharedPreferences) {
  //       sharedPreferences.setString('phoneNumber', _phoneNumberController.text);
  //     });

  //     if (_phoneNumberController.text == '123456') {
  //       Navigator.of(context).pushReplacementNamed(Routes.home);
  //     } else {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(
  //           content: Text('Bilgileriniz Hatali.'),
  //         ),
  //       );
  //     }
  //   }).catchError((err) {
  //     print(err);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.blueGrey,
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return Observer(builder: (context) {
      return Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: 'logo',
              child: Icon(
                Icons.local_shipping,
                size: 100,
                color: _themeStore.primaryColor,
              ),
            ),
            //
            buildPhoneNumber(),
            //
            buildLoginButton(),

            //
            // ElevatedButton(
            //   onPressed: () {
            //     _themeStore.changePrimaryColor(Colors.yellow);
            //   },
            //   child: Text('Yellow'),
            // ),
            // ElevatedButton(
            //   onPressed: () {
            //     _themeStore.changePrimaryColor(Colors.purple);
            //   },
            //   child: Text('Purple'),
            // ),
          ],
        ),
      );
    });
  }

  Widget buildLoginButton() {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20),
      padding: EdgeInsets.all(20),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: loginIsStarted == true
          ? SizedBox(
              width: 50,
              height: 50,
              child: SizedBox(
                width: 50,
                height: 50,
                child: CircularProgressIndicator(),
              ),
            )
          : SizedBox(
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  attemptLogin();
                },
                child: Text('Giriş Yap'),
              ),
            ),
    );
  }

  Widget buildPhoneNumber() {
    return Observer(builder: (context) {
      return Container(
        margin: EdgeInsets.only(left: 20, right: 20),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: new TextField(
          controller: _phoneNumberController,
          decoration: new InputDecoration(
            hintText: 'Telefon Numaranız',
            icon: new Icon(Icons.person, color: _themeStore.primaryColor),
          ),
        ),
      );
    });
  }
}
