import 'package:flutter/material.dart';

class WaitingPackagesPage extends StatefulWidget {
  @override
  _WaitingPackagesPageState createState() => _WaitingPackagesPageState();
}

class _WaitingPackagesPageState extends State<WaitingPackagesPage> {
  List<int> packages = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bekleyen Paketler'),
        // actions: [
        //   TextButton(
        //     child: Text(
        //       'Rota Oluştur',
        //       style: TextStyle(color: Colors.white),
        //     ),
        //     onPressed: () {
        //       //
        //     },
        //   ),
        // ],
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
      child: SingleChildScrollView(
        child: Column(
          children: packages.map((packageNumber) {
            return buildPack(packageNumber);
          }).toList(),
        ),
      ),
    );
  }

  Widget buildPack(int packageNumber) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(left: 20, right: 20, top: 20),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(10),
      ),
      // child: Text('Paket ' + packageNumber.toString()),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Standart Paket',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              Text('15 TL'),
            ],
          ),
          SizedBox(height: 20),
          //
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Gönderici',
              ),
              Text('Alıcı'),
            ],
          ),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Ahmet',
              ),
              Text('Ayşe'),
            ],
          ),
        ],
      ),
    );
  }
}
