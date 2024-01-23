// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_task_mobx_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AddTaskMobxStore on _AddTaskMobxStore, Store {
  late final _$_stateAtom =
      Atom(name: '_AddTaskMobxStore._state', context: context);

  AddTaskMobxState get state {
    _$_stateAtom.reportRead();
    return super._state;
  }

  @override
  AddTaskMobxState get _state => state;

  @override
  set _state(AddTaskMobxState value) {
    _$_stateAtom.reportWrite(value, super._state, () {
      super._state = value;
    });
  }

  late final _$addAsyncAction =
      AsyncAction('_AddTaskMobxStore.add', context: context);

  @override
  Future<void> add(AddTaskParam param) {
    return _$addAsyncAction.run(() => super.add(param));
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
