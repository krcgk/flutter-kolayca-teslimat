import 'package:flutter/material.dart';
import 'package:kolaycateslimat/models/package_model.dart';
import 'package:kolaycateslimat/routes.dart';
import 'package:provider/provider.dart';

class PackagePage extends StatefulWidget {
  PackagePage({
    Key? key,
  }) : super(key: key);

  @override
  _PackagePageState createState() => _PackagePageState();
}

class _PackagePageState extends State<PackagePage> {
  Package? package;

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () {
      setState(() {
        package = ModalRoute.of(context)!.settings.arguments as Package;
      });
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Paket Detayı'),
      ),
      body: buildBody(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.home),
        onPressed: () {
          Navigator.of(context).popUntil((route) => route.isFirst);
          // Navigator.of(context).pushNamedAndRemoveUntil(Routes.home, (route) => false);
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Text(
              'Paket ID: ${this.package?.id}',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              'Durum: ${this.package?.status}',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text('Tipi: ${this.package?.typeName}'),
            Text('Fiyatı: ${this.package?.price} TL'),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Divider(),
            ),
            Text('Gönderen: ${this.package?.sender}'),
            Text('Gönderen Adresi: ${this.package?.senderAddress}'),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Divider(),
            ),
            Text('Alıcı: ${this.package?.receiver}'),
            Text('Alıcı Adresi: ${this.package?.receiverAddress}'),
          ],
        ),
      ),
    );
  }
}
