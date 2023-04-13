import 'package:emp_2/src/presentation/cubit/app_cubit.dart';
import 'package:emp_2/src/presentation/pages/add_task_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TaskAddButton extends StatelessWidget {
  const TaskAddButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return SizedBox(
          height: 56,
          child: Material(
            borderRadius: const BorderRadius.all(
              Radius.circular(16),
            ),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const AddTaskPage(),
                  ),
                );
              },
              borderRadius: const BorderRadius.all(
                Radius.circular(16),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.add,
                    size: 36,
                    color: Colors.blue,
                  ),
                  SizedBox(width: 8),
                  Text(
                    'Добавить задачу',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
