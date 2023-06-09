import 'package:emp_2/src/domain/models/task_model.dart';
import 'package:emp_2/src/presentation/widgets/task_variable.dart';
import 'package:flutter/material.dart';

class AddTaskPage extends StatelessWidget {
  const AddTaskPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const TaskVariable(forEdit: false),
    );
  }
}
