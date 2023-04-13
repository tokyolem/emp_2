import 'package:emp_2/src/domain/models/task_model.dart';
import 'package:emp_2/src/presentation/cubit/app_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TaskAddSaveButton extends StatelessWidget {
  final bool forEdit;
  final TaskModel? task;

  const TaskAddSaveButton({
    required this.forEdit,
    this.task,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return Material(
          borderRadius: const BorderRadius.all(
            Radius.circular(36),
          ),
          color: Colors.blue,
          child: InkWell(
            onTap: () {
              forEdit
                  ? context.read<AppCubit>().editTask(task!)
                  : context.read<AppCubit>().addTask();
              Navigator.pop(context);
            },
            borderRadius: const BorderRadius.all(
              Radius.circular(36),
            ),
            child: const Padding(
              padding: EdgeInsets.all(16),
              child: Center(
                child: Text(
                  'СОХРАНИТЬ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
