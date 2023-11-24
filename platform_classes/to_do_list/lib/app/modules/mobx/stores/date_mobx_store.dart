import 'package:mobx/mobx.dart';
part 'date_mobx_store.g.dart';

// ignore: library_private_types_in_public_api
class DateMobxStore = _DateMobxStore with _$DateMobxStore;

abstract class _DateMobxStore with Store {
  _DateMobxStore() : _state = DateTime.now();

  @readonly
  DateTime _state;

  @action
  void nextDate() {
    _state = _state.add(const Duration(days: 1));
  }

  @action
  void previousDate() {
    _state = _state.subtract(const Duration(days: 1));
  }

  @action
  void changeDate(DateTime newDate) {
    _state = newDate;
  }
}
