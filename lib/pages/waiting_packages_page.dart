import 'package:flutter/material.dart';
import 'package:kolaycateslimat/models/package_model.dart';
import 'package:kolaycateslimat/routes.dart';
import 'package:kolaycateslimat/widgets/my_custom_drawer.dart';

class WaitingPackagesPage extends StatefulWidget {
  @override
  _WaitingPackagesPageState createState() => _WaitingPackagesPageState();
}

class _WaitingPackagesPageState extends State<WaitingPackagesPage> {
  List<Package> packages = [
    Package(
        id: '85121',
        status: 'Depoda',
        typeName: 'Standart Gönderim',
        price: 15.50,
        sender: 'Amazon',
        receiver: 'Gökhan Karaca +905555555555'),
    Package(
        id: '78121',
        status: 'Depoda',
        typeName: 'Standart Gönderim',
        price: 15.50,
        sender: 'Amazon',
        receiver: 'Gökhan Karaca +905555555555'),
    Package(
        id: '6121',
        status: 'Depoda',
        typeName: 'Standart Gönderim',
        price: 15.50,
        sender: 'Amazon',
        receiver: 'Gökhan Karaca +905555555555'),
    Package(
        id: '1241',
        status: 'Depoda',
        typeName: 'Standart Gönderim',
        price: 15.50,
        sender: 'Amazon',
        receiver: 'Gökhan Karaca +905555555555'),
    Package(
        id: '41231',
        status: 'Depoda',
        typeName: 'Standart Gönderim',
        price: 15.50,
        sender: 'Amazon',
        receiver: 'Gökhan Karaca +905555555555'),
    Package(
        id: '7121',
        status: 'Depoda',
        typeName: 'Standart Gönderim',
        price: 15.50,
        sender: 'Amazon',
        receiver: 'Gökhan Karaca +905555555555'),
    Package(
        id: '6241',
        status: 'Depoda',
        typeName: 'Standart Gönderim',
        price: 15.50,
        sender: 'Amazon',
        receiver: 'Gökhan Karaca +905555555555'),
    Package(
        id: '112',
        status: 'Depoda',
        typeName: 'Standart Gönderim',
        price: 15.50,
        sender: 'Amazon',
        receiver: 'Gökhan Karaca +905555555555'),
    Package(
        id: '1252',
        status: 'Depoda',
        typeName: 'Standart Gönderim',
        price: 15.50,
        sender: 'Amazon',
        receiver: 'Gökhan Karaca +905555555555'),
    Package(
        id: '1521',
        status: 'Depoda',
        typeName: 'Standart Gönderim',
        price: 15.50,
        sender: 'Amazon',
        receiver: 'Gökhan Karaca +905555555555'),
  ];

  int crossAxisCount = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bekleyen Paketler'),
        actions: [
          IconButton(
            icon: Icon(crossAxisCount == 1 ? Icons.grid_view : Icons.view_list),
            onPressed: () {
              setState(() {
                crossAxisCount = crossAxisCount == 1 ? 2 : 1;
              });
            },
          ),
        ],
      ),
      body: buildBody(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.near_me),
        onPressed: () {
          //
        },
      ),
    );
  }

  Widget buildBody() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: GridView.count(
        crossAxisCount: crossAxisCount,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        childAspectRatio: crossAxisCount > 1 ? 1 : 16 / 9,
        padding: EdgeInsets.all(20),
        children: packages.map((package) {
          return buildPack(package);
        }).toList(),
      ),
    );
  }

  Widget buildPack(Package package) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(Routes.package, arguments: package);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Paket ID: ${package.id}'),
            Text('Tip: ${package.typeName}'),
            Text('Fiyat: ${package.price} TL'),
          ],
        ),
      ),
    );
  }

  // Widget buildBody() {
  //   return Container(
  //     width: double.infinity,
  //     height: double.infinity,
  //     child: SingleChildScrollView(
  //       child: Column(
  //         children: packages.map((packageNumber) {
  //           return buildPack(packageNumber);
  //         }).toList(),
  //       ),
  //     ),
  //   );
  // }

  // Widget buildPack(int packageNumber) {
  //   return Container(
  //     width: double.infinity,
  //     margin: EdgeInsets.only(left: 20, right: 20, top: 20),
  //     padding: EdgeInsets.all(20),
  //     decoration: BoxDecoration(
  //       color: Colors.grey,
  //       borderRadius: BorderRadius.circular(10),
  //     ),
  //     // child: Text('Paket ' + packageNumber.toString()),
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //           children: [
  //             Text(
  //               'Standart Paket',
  //               style: TextStyle(
  //                 fontSize: 18,
  //               ),
  //             ),
  //             Text('15 TL'),
  //           ],
  //         ),
  //         SizedBox(height: 20),
  //         //
  //         Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //           children: [
  //             Text(
  //               'Gönderici',
  //             ),
  //             Text('Alıcı'),
  //           ],
  //         ),
  //         SizedBox(height: 5),
  //         Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //           children: [
  //             Text(
  //               'Ahmet',
  //             ),
  //             Text('Ayşe'),
  //           ],
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
