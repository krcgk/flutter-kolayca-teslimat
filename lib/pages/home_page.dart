import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kolaycateslimat/stores/counter.dart';
import 'package:kolaycateslimat/stores/package_store.dart';
import 'package:kolaycateslimat/stores/root_store.dart';
import 'package:kolaycateslimat/widgets/my_custom_drawer.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late RootStore _rootStore;
  late PackageStore _packageStore;

  final Completer<GoogleMapController> _controller = Completer<GoogleMapController>();

  Set<Marker> _markers = {};

  CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.214994, 28.363613),
    zoom: 14,
  );

  @override
  void initState() {
    super.initState();

    () async {
      await Future.delayed(Duration.zero);

      await _packageStore.fetchPackages();

      print(_packageStore.packages.length);

      bindMarkers();
    }();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _rootStore = Provider.of<RootStore>(context);
    _packageStore = _rootStore.packageStore;
  }

  void bindMarkers() {
    setState(() {
      _markers = _packageStore.packages.map((package) {
        return Marker(
          markerId: MarkerId(package.id.toString()),
          position: LatLng(package.position.latitude, package.position.longitude),
          infoWindow: InfoWindow(
            title: package.id.toString(),
            snippet: package.receiver.address,
          ),
        );
      }).toSet();
    });

    print(_markers.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kolayca Teslimat'),
      ),
      drawer: MyCustomDrawer(),
      // body: buildBody(),
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        markers: _markers,
      ),
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
