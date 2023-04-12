import 'package:emp_2/src/presentation/cubit/app_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TaskCalendar extends StatelessWidget {
  final ValueChanged<DateTime> onValueChanged;

  const TaskCalendar({
    required this.onValueChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        final now = DateTime.now();

        return Container(
          margin: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: const BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: CalendarDatePicker(
            initialDate: now,
            firstDate: now.copyWith(month: now.month - 1),
            lastDate: now.copyWith(month: now.month),
            onDateChanged: onValueChanged,
            initialCalendarMode: DatePickerMode.day,
          ),
        );
      },
    );
  }
}
