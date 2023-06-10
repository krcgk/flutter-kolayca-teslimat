import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class TakePhotoPage extends StatefulWidget {
  @override
  _TakePhotoPageState createState() => _TakePhotoPageState();
}

class _TakePhotoPageState extends State<TakePhotoPage> {
  late CameraController controller;

  XFile? takedPhoto;

  @override
  void initState() {
    super.initState();

    () async {
      await Future.delayed(Duration.zero);

      List<CameraDescription> _cameras = await availableCameras();

      controller = CameraController(_cameras[0], ResolutionPreset.max);
      controller.initialize().then((_) {
        if (!mounted) {
          return;
        }
        setState(() {});
      }).catchError((Object e) {
        if (e is CameraException) {
          switch (e.code) {
            case 'CameraAccessDenied':
              // Handle access errors here.
              break;
            default:
              // Handle other errors here.
              break;
          }
        }
      });
    }();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!controller.value.isInitialized) {
      return Container();
    }

    return Scaffold(
      body: takedPhoto != null
          ? Center(
              child: Image.file(
                File(
                  takedPhoto!.path,
                ),
              ),
            )
          : Center(child: CameraPreview(controller)),
      floatingActionButton: takedPhoto != null
          ? FloatingActionButton(
              child: Icon(Icons.check),
              onPressed: () {
                Navigator.of(context).pop(takedPhoto);
              },
            )
          : FloatingActionButton(
              child: Icon(Icons.camera_alt),
              onPressed: () async {
                if (controller == null || !controller.value.isInitialized) {
                  return null;
                }
                controller.takePicture().then((XFile file) {
                  setState(() {
                    takedPhoto = file;
                  });
                }).onError((error, stackTrace) {
                  print(error);
                  takedPhoto = null;
                });
              },
            ),
    );
  }
}
