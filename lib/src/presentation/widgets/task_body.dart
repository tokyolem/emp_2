import 'package:emp_2/src/presentation/cubit/app_cubit.dart';
import 'package:emp_2/src/presentation/widgets/task_add_button.dart';
import 'package:emp_2/src/presentation/widgets/task_card.dart';
import 'package:emp_2/src/presentation/widgets/task_top_label.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TaskBody extends StatefulWidget {
  const TaskBody({super.key});

  @override
  State<TaskBody> createState() => _TaskBodyState();
}

class _TaskBodyState extends State<TaskBody> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (_, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),
              TaskTopLabel(
                tasks: state.tasks.toList(),
              ),
              Expanded(
                child: ListView(
                  children: [
                    ...state.tasks.where((e) => !e.isDone).map(
                          (e) => TaskCard(task: e),
                        ),
                    if (state.tasks
                        .where((e) => e.isDone)
                        .map(
                          (e) => TaskCard(task: e),
                        )
                        .isNotEmpty) ...[
                      const SizedBox(
                        height: 24,
                      ),
                      const Text(
                        'Done',
                        style: TextStyle(fontSize: 18),
                      ),
                      const Divider(
                        thickness: 2,
                      ),
                    ],
                    ...state.tasks.where((e) => e.isDone).map(
                          (e) => TaskCard(task: e),
                        ),
                  ],
                ),
              ),
              const TaskAddButton(),
            ],
          ),
        );
      },
    );
  }
}
