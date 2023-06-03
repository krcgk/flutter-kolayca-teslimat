import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kolaycateslimat/stores/counter.dart';
import 'package:kolaycateslimat/widgets/my_custom_drawer.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // int myCounter = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kolayca Teslimat'),
      ),
      drawer: MyCustomDrawer(),
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
              tag: 'logo',
              child: Icon(
                Icons.local_shipping,
                size: 50,
                color: Colors.brown,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget buildBody() {
  //   return Container(
  //     child: SingleChildScrollView(
  //       child: Column(
  //         children: [
  //           Hero(
  //             tag: 'logo',
  //             child: Icon(
  //               Icons.local_shipping,
  //               size: 50,
  //               color: Colors.brown,
  //             ),
  //           ),
  //           Text(
  //             'My Counter: ' + myCounter.toString(),
  //           ),
  //           ElevatedButton(
  //             onPressed: () {
  //               setState(() {
  //                 myCounter = myCounter + 1;
  //               });
  //             },
  //             child: Text('Arttir'),
  //           ),
  //           Divider(),
  //           Image.asset('assets/images/package-1.png'),
  //           Image.asset('assets/images/package-2.png'),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
