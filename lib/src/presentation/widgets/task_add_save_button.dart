import 'package:emp_2/src/presentation/cubit/app_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TaskAddSaveButton extends StatelessWidget {

  const TaskAddSaveButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: const BorderRadius.all(
        Radius.circular(36),
      ),
      color: Colors.blue,
      child: InkWell(
        onTap: () {
          context.read<AppCubit>().addTask();
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
  }
}
