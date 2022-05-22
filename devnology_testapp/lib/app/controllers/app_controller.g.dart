// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AppController on AppControllerBase, Store {
  late final _$quantityAtom =
      Atom(name: 'AppControllerBase.quantity', context: context);

  @override
  int get quantity {
    _$quantityAtom.reportRead();
    return super.quantity;
  }

  @override
  set quantity(int value) {
    _$quantityAtom.reportWrite(value, super.quantity, () {
      super.quantity = value;
    });
  }

  late final _$cartListNumAtom =
      Atom(name: 'AppControllerBase.cartListNum', context: context);

  @override
  int get cartListNum {
    _$cartListNumAtom.reportRead();
    return super.cartListNum;
  }

  @override
  set cartListNum(int value) {
    _$cartListNumAtom.reportWrite(value, super.cartListNum, () {
      super.cartListNum = value;
    });
  }

  late final _$AppControllerBaseActionController =
      ActionController(name: 'AppControllerBase', context: context);

  @override
  int incrementItemQuantity(int itemQuantity) {
    final _$actionInfo = _$AppControllerBaseActionController.startAction(
        name: 'AppControllerBase.incrementItemQuantity');
    try {
      return super.incrementItemQuantity(itemQuantity);
    } finally {
      _$AppControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  int decrementItemQuantity(int itemQuantity) {
    final _$actionInfo = _$AppControllerBaseActionController.startAction(
        name: 'AppControllerBase.decrementItemQuantity');
    try {
      return super.decrementItemQuantity(itemQuantity);
    } finally {
      _$AppControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
quantity: ${quantity},
cartListNum: ${cartListNum}
    ''';
  }
}
