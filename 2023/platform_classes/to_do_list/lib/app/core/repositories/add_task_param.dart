class AddTaskParam {
  final String title;
  final String description;
  final DateTime initialDate;
  final DateTime endDate;

  const AddTaskParam({
    required this.title,
    required this.description,
    required this.initialDate,
    required this.endDate,
  });
}
