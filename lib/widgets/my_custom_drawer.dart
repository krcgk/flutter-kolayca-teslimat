import 'package:flutter/material.dart';
import 'package:kolaycateslimat/routes.dart';

class MyCustomDrawer extends StatefulWidget {
  const MyCustomDrawer({Key? key}) : super(key: key);

  @override
  _MyCustomDrawerState createState() => _MyCustomDrawerState();
}

class _MyCustomDrawerState extends State<MyCustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Text('Kolayca Teslimat'),
            decoration: BoxDecoration(
              color: Colors.brown,
            ),
          ),
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
              Navigator.pop(context);
              Navigator.of(context).pushReplacementNamed(Routes.login);
            },
          ),
        ],
      ),
    );
  }
}
