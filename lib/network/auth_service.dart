import 'package:dio/dio.dart';
import 'package:kolaycateslimat/models/user_model.dart';

class AuthService {
  final Dio dio;

  AuthService(
    this.dio,
  );

  Future<UserModel> login(String phoneNumber) async {
    try {
      var response = await dio.post(
        'https://flutter.gokhankaraca.com/api/login',
        data: {
          'phoneNumber': phoneNumber,
        },
      );

      print(response.data);

      return UserModel.fromJson(response.data['user']);
    } on DioError catch (err) {
      print(phoneNumber);
      print(err.response?.data);
      rethrow;
    } catch (err) {
      print(phoneNumber);
      print(err);
      rethrow;
    }
  }
}
