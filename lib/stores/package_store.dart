import 'package:collection/collection.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:kolaycateslimat/injector.dart' as injector;
import 'package:kolaycateslimat/models/package_model.dart';
import 'package:kolaycateslimat/network/package_service.dart';
import 'package:mobx/mobx.dart';

part 'package_store.g.dart';

class PackageStore = _PackageStore with _$PackageStore;

abstract class _PackageStore with Store {
  final PackageService packageService = injector.serviceLocator.get<PackageService>();

  @observable
  List<PackageModel> packages = ObservableList.of([]);

  @observable
  int? choosedPackageId;

  @computed
  PackageModel? get package => packages.firstWhereOrNull((element) => element.id == choosedPackageId);

  @action
  Future<void> fetchPackages() async {
    try {
      List<PackageModel> fetchedPackages = await packageService.getPackages();

      packages.clear();
      packages.addAll(fetchedPackages);
    } catch (err) {
      throw Exception('Failed to fetch packages');
    }
  }

  @action
  void choosePackage(PackageModel _package) {
    choosedPackageId = _package.id;
  }
}
