import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kolaycateslimat/stores/counter.dart';
import 'package:kolaycateslimat/stores/package_store.dart';
import 'package:kolaycateslimat/stores/root_store.dart';
import 'package:kolaycateslimat/widgets/my_custom_drawer.dart';
import 'package:location/location.dart';
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
  Set<Polyline> _polylines = {};

  CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.214994, 28.363613),
    zoom: 14,
  );

  BitmapDescriptor defaultMarkerIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor waitingMarkerIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor onCarMarkerIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor completedMarkerIcon = BitmapDescriptor.defaultMarker;

  @override
  void initState() {
    BitmapDescriptor.fromAssetImage(const ImageConfiguration(), "assets/images/bekleniyor.png").then(
      (icon) {
        setState(() {
          waitingMarkerIcon = icon;
        });
      },
    );

    BitmapDescriptor.fromAssetImage(const ImageConfiguration(), "assets/images/aracta.png").then(
      (icon) {
        setState(() {
          onCarMarkerIcon = icon;
        });
      },
    );

    BitmapDescriptor.fromAssetImage(const ImageConfiguration(), "assets/images/teslimedildi.png").then(
      (icon) {
        setState(() {
          completedMarkerIcon = icon;
        });
      },
    );

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
        BitmapDescriptor icon = defaultMarkerIcon;

        if (package.status == 'Bekleniyor') {
          icon = waitingMarkerIcon;
        } else if (package.status == 'Araçta') {
          icon = onCarMarkerIcon;
        } else if (package.status == 'Teslim Edildi') {
          icon = completedMarkerIcon;
        }

        return Marker(
          markerId: MarkerId(package.id.toString()),
          position: LatLng(package.position.latitude, package.position.longitude),
          infoWindow: InfoWindow(
            title: package.id.toString(),
            snippet: package.status,
          ),
          icon: icon,
        );
      }).toSet();
    });
  }

  Future<void> fetchMyLocation() async {
    try {
      Location location = new Location();

      bool _serviceEnabled;
      PermissionStatus _permissionGranted;
      LocationData _locationData;

      _serviceEnabled = await location.serviceEnabled();
      if (!_serviceEnabled) {
        _serviceEnabled = await location.requestService();
        if (!_serviceEnabled) {
          return;
        }
      }

      _permissionGranted = await location.hasPermission();
      if (_permissionGranted == PermissionStatus.denied) {
        _permissionGranted = await location.requestPermission();
        if (_permissionGranted != PermissionStatus.granted) {
          return;
        }
      }

      _locationData = await location.getLocation();

      print(_locationData);

      setState(() {
        _markers.add(Marker(
          markerId: MarkerId('MyLocation'),
          position: LatLng(_locationData.latitude!, _locationData.longitude!),
          infoWindow: InfoWindow(
            title: 'Konumum',
          ),
          icon: defaultMarkerIcon,
        ));
      });

      final GoogleMapController controller = await _controller.future;
      await controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: LatLng(_locationData.latitude!, _locationData.longitude!),
        zoom: 14,
      )));

      setState(() {
        _markers = _packageStore.packages.where((element) => element.status == 'Araçta').map((package) {
          BitmapDescriptor icon = defaultMarkerIcon;

          if (package.status == 'Bekleniyor') {
            icon = waitingMarkerIcon;
          } else if (package.status == 'Araçta') {
            icon = onCarMarkerIcon;
          } else if (package.status == 'Teslim Edildi') {
            icon = completedMarkerIcon;
          }

          return Marker(
            markerId: MarkerId(package.id.toString()),
            position: LatLng(package.position.latitude, package.position.longitude),
            infoWindow: InfoWindow(
              title: package.id.toString(),
              snippet: package.status,
            ),
            icon: icon,
          );
        }).toSet();

        // _polylines.clear();
        // _polylines.add(
        //   Polyline(
        //       polylineId: PolylineId('1'),
        //       color: Colors.yellow,
        //       points: _decode(
        //           'sa_bFkwclDoGz@YiD?OKkA}SjBS?OEIUGo@aZjCgANu@RmEbBsCrAa@FWQY?WLING\\B^@FEVUh@_Zhi@}@jAUCKBy@_@]m@o@cBUa@iBsAiDgBIWQKK@KQc@a@sB{AW]oAsBKWQi@MFwDrEaCjC_AvAs@`BmCbH]W')),
        // );
        // _polylines.add(
        //   Polyline(
        //       polylineId: PolylineId('2'),
        //       color: Colors.red,
        //       points: _decode('_zcbFc_blD\\VpDmJz@sAR[`CkCaCeDL]?_@KYUQY?GBm@aCe@mA?OwC@BrDDBBfDAx@SA')),
        // );
        // _polylines.add(
        //   Polyline(
        //       polylineId: PolylineId('3'),
        //       color: Colors.blue,
        //       points: _decode(
        //           'izcbFgtblDR@@rCA~@BHl@h@{HfScCmBs@|@wB}AZeAyCiCwAo@QCY?c@GSUIS\\ALMDS?[CYB}@HcAHu@Cg@MkAWw@Es@UsACyAAc@WaBO]Ou@AKq@[Y[OMUGD{@^?L?@C')),
        // );
        // _polylines.add(
        //   Polyline(
        //       polylineId: PolylineId('4'),
        //       color: Colors.brown,
        //       points: _decode('oydbFmfclDFm@j@k@Z{@NDNLF@FVBfAEz@?r@FRr@v@~CbCd@Hp@IL@fAg@\\@dC`@xAB~A?RDn@\\`Bf@')),
        // );
      });

      await _packageStore.route(_locationData.latitude!, _locationData.longitude!);
      print(_packageStore.routes);
      setState(() {
        _polylines.clear();

        _packageStore.routes.forEach((element) {
          var indexOf = _packageStore.routes.indexOf(element);

          _polylines.add(
            Polyline(
              polylineId: PolylineId('PolyLine$indexOf'),
              color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(0.5),
              points: _decode(element.polyline.encodedPolyline),
              zIndex: indexOf + 1,
              width: indexOf + 1,
            ),
          );
        });
      });
    } catch (err) {
      print(err);
      rethrow;
    }
  }

  Future<void> showJustMyPackages() async {
    try {
      await fetchMyLocation();
      //
    } catch (err) {
      //
    }
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
        polylines: _polylines,
        markers: _markers,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await showJustMyPackages();
        },
        child: Icon(Icons.place),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
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

  List<LatLng> _decode(String input) {
    var list = input.codeUnits;
    List lList = [];
    int index = 0;
    int len = input.length;
    int c = 0;
    List<LatLng> positions = [];
    // repeating until all attributes are decoded
    do {
      var shift = 0;
      int result = 0;

      // for decoding value of one attribute
      do {
        c = list[index] - 63;
        result |= (c & 0x1F) << (shift * 5);
        index++;
        shift++;
      } while (c >= 32);
      /* if value is negetive then bitwise not the value */
      if (result & 1 == 1) {
        result = ~result;
      }
      var result1 = (result >> 1) * 0.00001;
      lList.add(result1);
    } while (index < len);

    /*adding to previous value as done in encoding */
    for (int i = 2; i < lList.length; i++) {
      lList[i] += lList[i - 2];
    }

    for (int i = 0; i < lList.length; i += 2) {
      positions.add(LatLng(lList[i], lList[i + 1]));
    }

    return positions;
  }
}
