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
}