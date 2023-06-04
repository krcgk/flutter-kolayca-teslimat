import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kolaycateslimat/routes.dart';
import 'package:kolaycateslimat/stores/auth_store.dart';
import 'package:kolaycateslimat/stores/root_store.dart';
import 'package:kolaycateslimat/stores/theme_store.dart';
import 'package:provider/provider.dart';

class MyCustomDrawer extends StatefulWidget {
  const MyCustomDrawer({Key? key}) : super(key: key);

  @override
  _MyCustomDrawerState createState() => _MyCustomDrawerState();
}

class _MyCustomDrawerState extends State<MyCustomDrawer> {
  late RootStore _rootStore;
  late AuthStore _authStore;
  late ThemeStore _themeStore;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _rootStore = Provider.of<RootStore>(context);
    _authStore = _rootStore.authStore;
    _themeStore = _rootStore.themeStore;
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Drawer(
        child: ListView(
          children: [
            Observer(builder: (context) {
              return DrawerHeader(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${_authStore.user?.firstName ?? ''} ${_authStore.user?.lastName ?? ''}",
                      style: TextStyle(
                        fontSize: 24,
                      ),
                    ),
                    Text("Kazancın: ₺ ${_authStore.user?.balanceAmount ?? ''}"),
                  ],
                ),
                decoration: BoxDecoration(
                  color: _themeStore.primaryColor,
                ),
              );
            }),
            ListTile(
              title: Text('Rota Haritasi'),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).popUntil((route) => route.isFirst);
              },
            ),
            ListTile(
              title: Text('Bekleyen Paketler'),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).pushNamed(Routes.waitingPackages);
              },
            ),
            ListTile(
              title: Text('Cikis Yap'),
              onTap: () {
                _authStore.logout();
                Navigator.pop(context);
                Navigator.of(context).pushReplacementNamed(Routes.login);
              },
            ),
          ],
        ),
      );
    });
  }
}
