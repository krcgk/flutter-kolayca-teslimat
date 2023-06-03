import 'package:get_it/get_it.dart';
import 'package:kolaycateslimat/pages/example_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

GetIt serviceLocator = GetIt.instance;

Future<void> init() async {
  serviceLocator.registerLazySingleton(() => ExampleService());
}
