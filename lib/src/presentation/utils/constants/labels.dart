import 'package:emp_2/src/domain/models/task_model.dart';

abstract class Labels {
  static List<TaskModel> tasks = [
    TaskModel(
        id: 0,
        title: 'Loh',
        date: DateTime.now(),
        description: 'Ultra loh',
        taskEvent: 'event'),
    TaskModel(
      id: 1,
      title: 'Loh1',
      date: DateTime.now(),
      description: 'Ultra loh1',
      taskEvent: 'event',
    ),
    TaskModel(
      id: 2,
      title: 'Loh2',
      date: DateTime.now(),
      description: 'Ultra loh2',
      taskEvent: 'event',
    ),
  ];
}
