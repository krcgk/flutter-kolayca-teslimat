import 'package:flutter/material.dart';
import 'package:kolaycateslimat/injector.dart' as injector;
import 'package:kolaycateslimat/models/package_model.dart';
import 'package:kolaycateslimat/pages/home_page.dart';
import 'package:kolaycateslimat/pages/login_page.dart';
import 'package:kolaycateslimat/pages/package_page.dart';
import 'package:kolaycateslimat/pages/splash_page.dart';
import 'package:kolaycateslimat/pages/waiting_packages_page.dart';
import 'package:kolaycateslimat/routes.dart';

void main() async {
  await injector.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: const SplashPage(),
      onGenerateRoute: Routes().onGenerateRoute,
    );
  }
}
