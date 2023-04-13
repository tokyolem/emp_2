import 'package:emp_2/src/domain/models/task_model.dart';

abstract class Labels {
  static List<TaskModel> tasks = [
    TaskModel(
      id: 0,
      title: 'Some task',
      date: DateTime(2023, 4, 10, 13, 21),
      description: 'Description',
      taskEvent: 'event',
    ),
    TaskModel(
      id: 1,
      title: 'Another task',
      date: DateTime(2023, 4, 11, 5, 49),
      description: 'Some really useful info',
      taskEvent: 'event',
    ),
    TaskModel(
      id: 2,
      title: 'Task',
      date: DateTime(2023, 4, 12, 12, 10),
      description: 'Boring description',
      taskEvent: 'event',
    ),
  ];
}
