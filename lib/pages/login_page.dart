import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _phoneNumberController = new TextEditingController();

  bool loginIsStarted = false;

  void attemptLogin() {
    if (_phoneNumberController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Lütfen telefon numaranızı giriniz.'),
        ),
      );
    } else {
      startFakeRequest();
    }
  }

  void startFakeRequest() {
    setState(() {
      loginIsStarted = true;
    });

    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        loginIsStarted = false;
      });

      if (_phoneNumberController.text == '123456') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Bilgileriniz Dogru.'),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Bilgileriniz Hatali.'),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.blueGrey,
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildPhoneNumber(),
          //
          buildLoginButton()
        ],
      ),
    );
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
          icon: new Icon(Icons.person),
        ),
      ),
    );
  }
}
