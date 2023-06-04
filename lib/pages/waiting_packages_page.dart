import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kolaycateslimat/models/package_model.dart';
import 'package:kolaycateslimat/routes.dart';
import 'package:kolaycateslimat/stores/package_store.dart';
import 'package:kolaycateslimat/stores/root_store.dart';
import 'package:kolaycateslimat/widgets/my_custom_drawer.dart';
import 'package:provider/provider.dart';

class WaitingPackagesPage extends StatefulWidget {
  @override
  _WaitingPackagesPageState createState() => _WaitingPackagesPageState();
}

class _WaitingPackagesPageState extends State<WaitingPackagesPage> {
  late RootStore _rootStore;
  late PackageStore _packageStore;

  int crossAxisCount = 1;

  @override
  void initState() {
    super.initState();

    () async {
      await Future.delayed(Duration.zero);

      await _packageStore.fetchPackages();
    }();
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
    return Observer(builder: (context) {
      return Container(
        width: double.infinity,
        height: double.infinity,
        child: RefreshIndicator(
          backgroundColor: Colors.brown,
          onRefresh: () async {
            await _packageStore.fetchPackages();
          },
          child: GridView.count(
            crossAxisCount: crossAxisCount,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            childAspectRatio: crossAxisCount > 1 ? 1 : 16 / 9,
            padding: EdgeInsets.all(20),
            children: _packageStore.packages.map((package) {
              return buildPackageContainer(package);
            }).toList(),
          ),
        ),
      );
    });
  }

  Widget buildPackageContainer(PackageModel package) {
    return GestureDetector(
      onTap: () {
        _packageStore.choosePackage(package);
        Navigator.of(context).pushNamed(Routes.package);
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
            Text('Durum: ${package.status}'),
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
