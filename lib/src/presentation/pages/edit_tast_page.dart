import 'package:emp_2/src/domain/models/task_model.dart';
import 'package:emp_2/src/presentation/widgets/task_variable.dart';
import 'package:flutter/material.dart';

class EditTaskPage extends StatelessWidget {
  final TaskModel task;

  const EditTaskPage({
    required this.task,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: TaskVariable(forEdit: true, task: task),
    );
  }
}
