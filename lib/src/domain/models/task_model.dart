class TaskModel {
  final int id;
  final String title;
  final DateTime date;
  final String description;
  final String taskEvent;
  final bool isDone;

  const TaskModel({
    required this.id,
    required this.title,
    required this.date,
    required this.description,
    required this.taskEvent,
    this.isDone = false,
  });

  TaskModel copyWith({
    int? id,
    String? title,
    DateTime? date,
    String? description,
    String? taskEvent,
    bool? isDone,
  }) =>
      TaskModel(
        id: id ?? this.id,
        title: title ?? this.title,
        date: date ?? this.date,
        description: description ?? this.description,
        taskEvent: taskEvent ?? this.taskEvent,
        isDone: isDone ?? this.isDone,
      );
}
