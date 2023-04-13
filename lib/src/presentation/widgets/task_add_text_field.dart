import 'package:emp_2/src/presentation/cubit/app_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TaskAddTextField extends StatelessWidget {
  final ValueChanged<String> onValueChanged;
  final String? initialValue;

  const TaskAddTextField({
    required this.onValueChanged,
    required this.labelText,
    this.initialValue,
    super.key,
  });

  final String labelText;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 26),
          child: TextFormField(
            initialValue: initialValue,
            onChanged: onValueChanged,
            decoration: InputDecoration(
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
              labelText: labelText,
            ),
          ),
        );
      }
    );
  }
}
