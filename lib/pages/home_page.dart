import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int myCounter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kolayca Teslimat'),
      ),
      drawer: buildDrawer(),
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return Container(
      child: Column(
        children: [
          Text(
            'My Counter: ' + myCounter.toString(),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                myCounter = myCounter + 1;
              });
            },
            child: Text('Arttir'),
          ),
        ],
      ),
    );
  }

  Widget buildDrawer() {
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
            },
          ),
          ListTile(
            title: Text('Bekleyen Paketler'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Cikis Yap'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
