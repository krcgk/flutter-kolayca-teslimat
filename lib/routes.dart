import 'package:flutter/material.dart';
import 'package:kolaycateslimat/pages/home_page.dart';
import 'package:kolaycateslimat/pages/login_page.dart';
import 'package:kolaycateslimat/pages/package_page.dart';
import 'package:kolaycateslimat/pages/splash_page.dart';
import 'package:kolaycateslimat/pages/waiting_packages_page.dart';

class Routes {
  Routes();

  static const String splash = '/splash';
  static const String login = '/login';
  static const String home = '/home';
  static const String waitingPackages = '/waitingPackages';
  static const String package = '/package';

  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splash:
        return MaterialPageRoute(
          builder: (context) {
            return const SplashPage();
          },
          settings: settings,
        );

      case Routes.login:
        return MaterialPageRoute(
          builder: (context) {
            return LoginPage();
          },
          settings: settings,
        );

      case Routes.home:
        return MaterialPageRoute(
          builder: (context) {
            return MyHomePage();
          },
          settings: settings,
        );

      case Routes.waitingPackages:
        return MaterialPageRoute(
          builder: (context) {
            return WaitingPackagesPage();
          },
          settings: settings,
        );

      case Routes.package:
        return MaterialPageRoute(
          builder: (context) {
            return PackagePage();
          },
          settings: settings,
        );
    }

    return MaterialPageRoute(builder: (context) {
      return const Scaffold(
        body: Center(
          child: Text('Page Not Found'),
        ),
      );
    });
  }
}
