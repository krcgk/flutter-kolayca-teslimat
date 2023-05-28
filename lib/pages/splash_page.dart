import 'package:flutter/material.dart';
import 'package:kolaycateslimat/routes.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    print('splash page  init state');

    Future.delayed(Duration(seconds: 3), () {
      print('redirecting');
      Navigator.of(context).pushReplacementNamed(Routes.login);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
