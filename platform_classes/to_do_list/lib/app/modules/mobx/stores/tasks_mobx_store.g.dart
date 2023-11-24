// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tasks_mobx_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TasksMobxStore on _TasksMobxStore, Store {
  late final _$_stateAtom =
      Atom(name: '_TasksMobxStore._state', context: context);

  TasksMobxState get state {
    _$_stateAtom.reportRead();
    return super._state;
  }

  @override
  TasksMobxState get _state => state;

  @override
  set _state(TasksMobxState value) {
    _$_stateAtom.reportWrite(value, super._state, () {
      super._state = value;
    });
  }

  late final _$doneTaskAsyncAction =
      AsyncAction('_TasksMobxStore.doneTask', context: context);

  @override
  Future<void> doneTask(TaskModel task) {
    return _$doneTaskAsyncAction.run(() => super.doneTask(task));
  }

  late final _$archiveTaskAsyncAction =
      AsyncAction('_TasksMobxStore.archiveTask', context: context);

  @override
  Future<void> archiveTask(TaskModel task) {
    return _$archiveTaskAsyncAction.run(() => super.archiveTask(task));
  }

  late final _$getTasksAsyncAction =
      AsyncAction('_TasksMobxStore.getTasks', context: context);

  @override
  Future<void> getTasks(DateTime date) {
    return _$getTasksAsyncAction.run(() => super.getTasks(date));
  }

  late final _$_TasksMobxStoreActionController =
      ActionController(name: '_TasksMobxStore', context: context);

  @override
  void filterTasksDate(DateTime date) {
    final _$actionInfo = _$_TasksMobxStoreActionController.startAction(
        name: '_TasksMobxStore.filterTasksDate');
    try {
      return super.filterTasksDate(date);
    } finally {
      _$_TasksMobxStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearStatusFilter() {
    final _$actionInfo = _$_TasksMobxStoreActionController.startAction(
        name: '_TasksMobxStore.clearStatusFilter');
    try {
      return super.clearStatusFilter();
    } finally {
      _$_TasksMobxStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void filterTasksStatus(TaskStatus status) {
    final _$actionInfo = _$_TasksMobxStoreActionController.startAction(
        name: '_TasksMobxStore.filterTasksStatus');
    try {
      return super.filterTasksStatus(status);
    } finally {
      _$_TasksMobxStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
