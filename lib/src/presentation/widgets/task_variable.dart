import 'package:emp_2/src/domain/models/task_model.dart';
import 'package:emp_2/src/presentation/cubit/app_cubit.dart';
import 'package:emp_2/src/presentation/utils/extension/datetime_extension.dart';
import 'package:emp_2/src/presentation/widgets/task_add_save_button.dart';
import 'package:emp_2/src/presentation/widgets/task_add_text_field.dart';
import 'package:emp_2/src/presentation/widgets/task_calendar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TaskVariable extends StatelessWidget {
  final bool forEdit;
  final TaskModel? task;

  const TaskVariable({
    required this.forEdit,
    this.task,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(
            right: 16.0,
            left: 16.0,
            bottom: 16.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text(
                'Ваша задача',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                'Заполните данные ниже, чтобы\nдобавить задачу в ToDoList',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 16),
              TaskAddTextField(
                labelText: 'Название задачи',
                initialValue: task?.title,
                onValueChanged: (value) =>
                    context.read<AppCubit>().onTaskTitleChanged(value),
              ),
              TaskAddTextField(
                labelText: 'Описание задачи',
                initialValue: task?.description,
                onValueChanged: (value) =>
                    context.read<AppCubit>().onTaskDescriptionChanged(value),
              ),
              TaskAddTextField(
                labelText: 'Событие задачи',
                initialValue: task?.taskEvent,
                onValueChanged: (value) =>
                    context.read<AppCubit>().onTaskEventChanged(value),
              ),
              Row(
                children: [
                  Material(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(36),
                    child: InkWell(
                      onTap: () {
                        showBottomSheet(
                          elevation: 0,
                          backgroundColor: Colors.transparent,
                          context: context,
                          builder: (_) => TaskCalendar(
                            tasks: state.tasks.toList(),
                            onValueChanged: (value) => context
                                .read<AppCubit>()
                                .onTaskDateChanged(value),
                          ),
                        );
                      },
                      borderRadius: BorderRadius.circular(36),
                      child: const Padding(
                        padding: EdgeInsets.all(8),
                        child: Icon(
                          Icons.date_range,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        const TextSpan(
                          text: 'Дата задачи: ',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: task?.date.dateYMMMMDFormat() ??
                              state.task.date.dateYMMMMDFormat(),
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const TextSpan(
                          text: ', ',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: task?.date.dateJMFormat() ??
                              state.task.date.dateJMFormat(),
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              TaskAddSaveButton(forEdit: forEdit, task: task),
            ],
          ),
        );
      },
    );
  }
}
