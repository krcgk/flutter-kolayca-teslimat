import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:kolaycateslimat/network/auth_service.dart';
import 'package:kolaycateslimat/pages/example_service.dart';
import 'package:kolaycateslimat/stores/auth_store.dart';
import 'package:kolaycateslimat/stores/counter.dart';
import 'package:kolaycateslimat/stores/package_store.dart';
import 'package:kolaycateslimat/stores/root_store.dart';
import 'package:kolaycateslimat/stores/theme_store.dart';
import 'package:shared_preferences/shared_preferences.dart';

GetIt serviceLocator = GetIt.instance;

Future<void> init() async {
  serviceLocator.registerLazySingleton(() => Dio());
  serviceLocator.registerLazySingleton(() => ExampleService());

  // serviceLocator.registerLazySingleton(() => Counter());

  serviceLocator.registerLazySingleton(() => AuthService(serviceLocator.get<Dio>()));

  serviceLocator.registerFactory(() => AuthStore());
  serviceLocator.registerFactory(() => ThemeStore());
  serviceLocator.registerFactory(() => PackageStore());

  serviceLocator.registerLazySingleton(
    () => RootStore(
      authStore: serviceLocator.get<AuthStore>(),
      themeStore: serviceLocator.get<ThemeStore>(),
      packageStore: serviceLocator.get<PackageStore>(),
    ),
  );
}
