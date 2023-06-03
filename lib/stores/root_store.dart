import 'package:kolaycateslimat/stores/auth_store.dart';
import 'package:kolaycateslimat/stores/package_store.dart';
import 'package:kolaycateslimat/stores/theme_store.dart';
import 'package:mobx/mobx.dart';

part 'root_store.g.dart';

class RootStore = _RootStore with _$RootStore;

abstract class _RootStore with Store {
  _RootStore({
    required this.authStore,
    required this.themeStore,
    required this.packageStore,
  });

  @observable
  late AuthStore authStore;

  @observable
  late ThemeStore themeStore;

  @observable
  late PackageStore packageStore;
}
