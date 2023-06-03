import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'package_store.g.dart';

class PackageStore = _PackageStore with _$PackageStore;

abstract class _PackageStore with Store {}
