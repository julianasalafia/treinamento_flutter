import 'package:bloc/bloc.dart';
import 'package:to_do_list/app/modules/bloc/stores/events/date_bloc_event.dart';

class DateBlocStore extends Bloc<DateBlocEvent, DateTime> {
  DateBlocStore() : super(DateTime.now()) {
    on<NextDateBlocEvent>(_nextDate);
    on<PreviousDateBlocEvent>(_previousDate);
    on<ChangeDateBlocEvent>(_changeDate);
  }

  void _nextDate(NextDateBlocEvent event, Emitter<DateTime> emitter) {
    final newState = state.add(const Duration(days: 1));
    emitter(newState);
  }

  void _previousDate(PreviousDateBlocEvent event, Emitter<DateTime> emitter) {
    final newState = state.subtract(const Duration(days: 1));
    emitter(newState);
  }

  void _changeDate(ChangeDateBlocEvent event, Emitter<DateTime> emitter) {
    emitter(event.date);
  }
}
