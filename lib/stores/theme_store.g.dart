// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ThemeStore on _ThemeStore, Store {
  late final _$primaryColorAtom =
      Atom(name: '_ThemeStore.primaryColor', context: context);

  @override
  Color get primaryColor {
    _$primaryColorAtom.reportRead();
    return super.primaryColor;
  }

  @override
  set primaryColor(Color value) {
    _$primaryColorAtom.reportWrite(value, super.primaryColor, () {
      super.primaryColor = value;
    });
  }

  late final _$_ThemeStoreActionController =
      ActionController(name: '_ThemeStore', context: context);

  @override
  void changePrimaryColor(Color _color) {
    final _$actionInfo = _$_ThemeStoreActionController.startAction(
        name: '_ThemeStore.changePrimaryColor');
    try {
      return super.changePrimaryColor(_color);
    } finally {
      _$_ThemeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
primaryColor: ${primaryColor}
    ''';
  }
}
