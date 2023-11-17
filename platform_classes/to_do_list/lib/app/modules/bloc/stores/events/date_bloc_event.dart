class DateBlocEvent {
  const DateBlocEvent();
}

class NextDateBlocEvent extends DateBlocEvent {
  const NextDateBlocEvent();
}

class PreviousDateBlocEvent extends DateBlocEvent {
  const PreviousDateBlocEvent();
}

class ChangeDateBlocEvent extends DateBlocEvent {
  final DateTime date;
  const ChangeDateBlocEvent(this.date);
}
