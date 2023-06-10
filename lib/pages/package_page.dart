import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kolaycateslimat/models/package_model.dart';
import 'package:kolaycateslimat/routes.dart';
import 'package:kolaycateslimat/stores/auth_store.dart';
import 'package:kolaycateslimat/stores/package_store.dart';
import 'package:kolaycateslimat/stores/root_store.dart';
import 'package:kolaycateslimat/widgets/take_photo_page.dart';
import 'package:location/location.dart';
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
  late AuthStore _authStore;
  late PackageStore _packageStore;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _rootStore = Provider.of<RootStore>(context);
    _authStore = _rootStore.authStore;
    _packageStore = _rootStore.packageStore;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Paket Detayı'),
      ),
      body: buildBody(),
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.home),
      //   onPressed: () async {
      //     // await _packageStore.fetchPackages();
      //     // Navigator.of(context).popUntil((route) => route.isFirst);
      //     // Navigator.of(context).pushNamedAndRemoveUntil(Routes.home, (route) => false);
      //   },
      // ),
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
              buildBasicInfo(),
              buildReceiverInfo(),
              buildSenderInfo(),
              buildMoveToCar(),
              buildComplete(),
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

  Widget buildBasicInfo() {
    return Observer(builder: (BuildContext context) {
      return Container(
        width: double.infinity,
        margin: EdgeInsets.all(15),
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.5),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _packageStore.package?.status ?? '',
                  style: TextStyle(fontSize: 24),
                ),
                Text(
                  '#' + (_packageStore.package?.id.toString() ?? ''),
                  style: TextStyle(fontSize: 24),
                ),
              ],
            ),
            Text(
              _packageStore.package?.typeName ?? '',
              style: TextStyle(fontSize: 16),
            ),
            Text('₺' + (_packageStore.package?.price.toString() ?? '')),
          ],
        ),
      );
    });
  }

  Widget buildSenderInfo() {
    return Observer(builder: (BuildContext context) {
      return Container(
        width: double.infinity,
        margin: EdgeInsets.all(15),
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.5),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Gönderici',
              style: TextStyle(fontSize: 24),
            ),
            Text(
              (_packageStore.package?.sender.firstName ?? '') + ' ' + (_packageStore.package?.sender.lastName ?? ''),
              style: TextStyle(fontSize: 16),
            ),
            Text(
              (_packageStore.package?.sender.phoneNumber ?? ''),
              style: TextStyle(fontSize: 16),
            ),
            Text(
              "${_packageStore.package?.sender.address}, ${_packageStore.package?.sender.district}, ${_packageStore.package?.sender.city}",
              style: TextStyle(fontSize: 16),
            ),
            Text(
              (_packageStore.package?.sender.postalCode ?? ''),
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      );
    });
  }

  Widget buildReceiverInfo() {
    return Observer(builder: (BuildContext context) {
      return Container(
        width: double.infinity,
        margin: EdgeInsets.all(15),
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.5),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Alıcı',
              style: TextStyle(fontSize: 24),
            ),
            Text(
              (_packageStore.package?.receiver.firstName ?? '') + ' ' + (_packageStore.package?.receiver.lastName ?? ''),
              style: TextStyle(fontSize: 16),
            ),
            Text(
              (_packageStore.package?.receiver.phoneNumber ?? ''),
              style: TextStyle(fontSize: 16),
            ),
            Text(
              "${_packageStore.package?.receiver.address}, ${_packageStore.package?.receiver.district}, ${_packageStore.package?.receiver.city}",
              style: TextStyle(fontSize: 16),
            ),
            Text(
              (_packageStore.package?.receiver.postalCode ?? ''),
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      );
    });
  }

  Widget buildMoveToCar() {
    return Observer(builder: (BuildContext context) {
      if (_packageStore.package?.status == 'Bekleniyor' &&
          (_packageStore.package?.responsibleUserId == null || _packageStore.package?.responsibleUserId == _authStore.user?.id)) {
        return Container(
          child: ElevatedButton(
            child: Text('Araca Taşı'),
            onPressed: () async {
              await _packageStore.moveToCar();
            },
          ),
        );
      }

      return SizedBox.shrink();
    });
  }

  Widget buildComplete() {
    return Observer(builder: (BuildContext context) {
      if (_packageStore.package?.status == 'Araçta' && _packageStore.package?.responsibleUserId == _authStore.user?.id) {
        return Container(
          child: ElevatedButton(
            child: Text('Teslim Et'),
            onPressed: () async {
              var photoPageResult = await Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => TakePhotoPage(),
                ),
              );

              if (photoPageResult is XFile) {
                LocationData? locationData = await fetchMyLocation();
                if (locationData != null) {
                  await _packageStore.complete(photoPageResult, locationData.latitude!, locationData.longitude!);
                } else {}
              }
            },
          ),
        );
      }

      return SizedBox.shrink();
    });
  }

  Future<LocationData?> fetchMyLocation() async {
    try {
      Location location = new Location();

      bool _serviceEnabled;
      PermissionStatus _permissionGranted;
      LocationData _locationData;

      _serviceEnabled = await location.serviceEnabled();
      if (!_serviceEnabled) {
        _serviceEnabled = await location.requestService();
        if (!_serviceEnabled) {
          return null;
        }
      }

      _permissionGranted = await location.hasPermission();
      if (_permissionGranted == PermissionStatus.denied) {
        _permissionGranted = await location.requestPermission();
        if (_permissionGranted != PermissionStatus.granted) {
          return null;
        }
      }

      return _locationData = await location.getLocation();
    } catch (err) {
      rethrow;
    }
  }
}
