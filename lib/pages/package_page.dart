import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kolaycateslimat/models/package_model.dart';
import 'package:kolaycateslimat/routes.dart';
import 'package:kolaycateslimat/stores/package_store.dart';
import 'package:kolaycateslimat/stores/root_store.dart';
import 'package:provider/provider.dart';

class PackagePage extends StatefulWidget {
  PackagePage({
    Key? key,
  }) : super(key: key);

  @override
  _PackagePageState createState() => _PackagePageState();
}

class _PackagePageState extends State<PackagePage> {
  late RootStore _rootStore;
  late PackageStore _packageStore;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _rootStore = Provider.of<RootStore>(context);
    _packageStore = _rootStore.packageStore;
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
    return Observer(builder: (context) {
      return Container(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(_packageStore.package?.price.toString() ?? ''),
              Text(_packageStore.package?.sender.firstName ?? ''),
              Text(_packageStore.package?.receiver.firstName ?? ''),
              // SizedBox(height: 20),
              // Text(
              //   'Paket ID: ${this.package?.id}',
              //   textAlign: TextAlign.center,
              //   style: TextStyle(
              //     fontSize: 24,
              //     fontWeight: FontWeight.w700,
              //   ),
              // ),
              // Text(
              //   'Durum: ${this.package?.status}',
              //   textAlign: TextAlign.center,
              //   style: TextStyle(
              //     fontSize: 20,
              //     fontWeight: FontWeight.w700,
              //   ),
              // ),
              // Text('Tipi: ${this.package?.typeName}'),
              // Text('Fiyatı: ${this.package?.price} TL'),
              // Padding(
              //   padding: EdgeInsets.symmetric(vertical: 20),
              //   child: Divider(),
              // ),
              // Text('Gönderen: ${this.package?.sender}'),
              // Text('Gönderen Adresi: ${this.package?.senderAddress}'),
              // Padding(
              //   padding: EdgeInsets.symmetric(vertical: 20),
              //   child: Divider(),
              // ),
              // Text('Alıcı: ${this.package?.receiver}'),
              // Text('Alıcı Adresi: ${this.package?.receiverAddress}'),
            ],
          ),
        ),
      );
    });
  }
}
