// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'root_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RootStore on _RootStore, Store {
  late final _$authStoreAtom =
      Atom(name: '_RootStore.authStore', context: context);

  @override
  AuthStore get authStore {
    _$authStoreAtom.reportRead();
    return super.authStore;
  }

  @override
  set authStore(AuthStore value) {
    _$authStoreAtom.reportWrite(value, super.authStore, () {
      super.authStore = value;
    });
  }

  late final _$themeStoreAtom =
      Atom(name: '_RootStore.themeStore', context: context);

  @override
  ThemeStore get themeStore {
    _$themeStoreAtom.reportRead();
    return super.themeStore;
  }

  @override
  set themeStore(ThemeStore value) {
    _$themeStoreAtom.reportWrite(value, super.themeStore, () {
      super.themeStore = value;
    });
  }

  late final _$packageStoreAtom =
      Atom(name: '_RootStore.packageStore', context: context);

  @override
  PackageStore get packageStore {
    _$packageStoreAtom.reportRead();
    return super.packageStore;
  }

  @override
  set packageStore(PackageStore value) {
    _$packageStoreAtom.reportWrite(value, super.packageStore, () {
      super.packageStore = value;
    });
  }

  @override
  String toString() {
    return '''
authStore: ${authStore},
themeStore: ${themeStore},
packageStore: ${packageStore}
    ''';
  }
}
