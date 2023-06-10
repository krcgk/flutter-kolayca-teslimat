import 'dart:io';

import 'package:camera/camera.dart';
import 'package:dio/dio.dart';
import 'package:kolaycateslimat/models/package_model.dart';

class PackageService {
  final Dio dio;

  PackageService(
    this.dio,
  );

  Future<List<PackageModel>> getPackages() async {
    try {
      var response = await dio.get(
        'https://flutter.gokhankaraca.com/api/packages',
      );

      List<dynamic> rows = response.data['packages'];

      return rows.map((row) {
        return PackageModel.fromJson(row);
      }).toList();
    } catch (err) {
      print(err);
      rethrow;
    }
  }

  Future<PackageModel> moveToCar(int packageId) async {
    try {
      var response = await dio.put(
        'https://flutter.gokhankaraca.com/api/packages/show/$packageId/move-to-car',
      );

      return PackageModel.fromJson(response.data['package']);
    } catch (err) {
      print(err);
      rethrow;
    }
  }

  Future<List<PackageRouteModel>> routing(
    num latitude,
    num longitude,
  ) async {
    try {
      var response = await dio.get(
        'https://flutter.gokhankaraca.com/api/route?latitude=$latitude&longitude=$longitude',
      );

      List<dynamic> rows = response.data['responses'];

      print(response.data);

      return rows.map((e) {
        return PackageRouteModel.fromJson(e);
      }).toList();
    } catch (err) {
      print(err);
      rethrow;
    }
  }

  Future<PackageModel> complete(
    int packageId,
    XFile file,
    num latitude,
    num longitude,
  ) async {
    try {
      FormData formData = FormData.fromMap({
        'photo': await MultipartFile.fromFile(file.path),
        'latitude': latitude,
        'longitude': longitude,
      });

      var response = await dio.post(
        'https://flutter.gokhankaraca.com/api/packages/show/$packageId/complete',
        data: formData,
      );

      return PackageModel.fromJson(response.data);
    } catch (err) {
      print(err);
      rethrow;
    }
  }
}
