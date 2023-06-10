// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'package_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PackageStore on _PackageStore, Store {
  Computed<PackageModel?>? _$packageComputed;

  @override
  PackageModel? get package =>
      (_$packageComputed ??= Computed<PackageModel?>(() => super.package,
              name: '_PackageStore.package'))
          .value;

  late final _$packagesAtom =
      Atom(name: '_PackageStore.packages', context: context);

  @override
  List<PackageModel> get packages {
    _$packagesAtom.reportRead();
    return super.packages;
  }

  @override
  set packages(List<PackageModel> value) {
    _$packagesAtom.reportWrite(value, super.packages, () {
      super.packages = value;
    });
  }

  late final _$routesAtom =
      Atom(name: '_PackageStore.routes', context: context);

  @override
  List<PackageRouteModel> get routes {
    _$routesAtom.reportRead();
    return super.routes;
  }

  @override
  set routes(List<PackageRouteModel> value) {
    _$routesAtom.reportWrite(value, super.routes, () {
      super.routes = value;
    });
  }

  late final _$choosedPackageIdAtom =
      Atom(name: '_PackageStore.choosedPackageId', context: context);

  @override
  int? get choosedPackageId {
    _$choosedPackageIdAtom.reportRead();
    return super.choosedPackageId;
  }

  @override
  set choosedPackageId(int? value) {
    _$choosedPackageIdAtom.reportWrite(value, super.choosedPackageId, () {
      super.choosedPackageId = value;
    });
  }

  late final _$fetchPackagesAsyncAction =
      AsyncAction('_PackageStore.fetchPackages', context: context);

  @override
  Future<void> fetchPackages() {
    return _$fetchPackagesAsyncAction.run(() => super.fetchPackages());
  }

  late final _$moveToCarAsyncAction =
      AsyncAction('_PackageStore.moveToCar', context: context);

  @override
  Future<void> moveToCar() {
    return _$moveToCarAsyncAction.run(() => super.moveToCar());
  }

  late final _$completeAsyncAction =
      AsyncAction('_PackageStore.complete', context: context);

  @override
  Future<void> complete(XFile file, num latitude, num longitude) {
    return _$completeAsyncAction
        .run(() => super.complete(file, latitude, longitude));
  }

  late final _$routeAsyncAction =
      AsyncAction('_PackageStore.route', context: context);

  @override
  Future<void> route(num latitude, num longitude) {
    return _$routeAsyncAction.run(() => super.route(latitude, longitude));
  }

  late final _$_PackageStoreActionController =
      ActionController(name: '_PackageStore', context: context);

  @override
  void choosePackage(PackageModel _package) {
    final _$actionInfo = _$_PackageStoreActionController.startAction(
        name: '_PackageStore.choosePackage');
    try {
      return super.choosePackage(_package);
    } finally {
      _$_PackageStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
packages: ${packages},
routes: ${routes},
choosedPackageId: ${choosedPackageId},
package: ${package}
    ''';
  }
}
