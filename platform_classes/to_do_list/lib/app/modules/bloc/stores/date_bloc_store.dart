import 'package:bloc/bloc.dart';
import 'package:to_do_list/app/modules/bloc/stores/date_bloc_event.dart';

class DateBlocStore extends Bloc<DateBlocEvent, DateTime> {
  DateBlocStore() : super(DateTime.now()) {
    on<NextDateBlocEvent>(nextDate);
    on<PreviousDateBlocEvent>(previousDate);
  }

  void nextDate(NextDateBlocEvent event, Emitter<DateTime> emitter) {
    final newState = state.add(const Duration(days: 1));
    emitter(newState);
  }

  void previousDate(PreviousDateBlocEvent event, Emitter<DateTime> emitter) {
    final newState = state.subtract(const Duration(days: 1));
    emitter(newState);
  }

  void changeDate(ChangeDateBlocEvent event, Emitter<DateTime> emitter) {
    emitter(event.date);
  }
}
