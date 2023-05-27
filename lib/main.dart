import 'package:flutter/material.dart';
import 'package:kolaycateslimat/pages/home_page.dart';
import 'package:kolaycateslimat/pages/login_page.dart';
import 'package:kolaycateslimat/pages/waiting_packages_page.dart';

void main() {
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
      home: MyHomePage(),
    );
  }
}
