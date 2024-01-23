// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'date_mobx_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DateMobxStore on _DateMobxStore, Store {
  late final _$_stateAtom =
      Atom(name: '_DateMobxStore._state', context: context);

  DateTime get state {
    _$_stateAtom.reportRead();
    return super._state;
  }

  @override
  DateTime get _state => state;

  @override
  set _state(DateTime value) {
    _$_stateAtom.reportWrite(value, super._state, () {
      super._state = value;
    });
  }

  late final _$_DateMobxStoreActionController =
      ActionController(name: '_DateMobxStore', context: context);

  @override
  void nextDate() {
    final _$actionInfo = _$_DateMobxStoreActionController.startAction(
        name: '_DateMobxStore.nextDate');
    try {
      return super.nextDate();
    } finally {
      _$_DateMobxStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void previousDate() {
    final _$actionInfo = _$_DateMobxStoreActionController.startAction(
        name: '_DateMobxStore.previousDate');
    try {
      return super.previousDate();
    } finally {
      _$_DateMobxStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeDate(DateTime newDate) {
    final _$actionInfo = _$_DateMobxStoreActionController.startAction(
        name: '_DateMobxStore.changeDate');
    try {
      return super.changeDate(newDate);
    } finally {
      _$_DateMobxStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
