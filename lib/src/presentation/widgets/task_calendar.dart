import 'package:emp_2/src/domain/models/task_model.dart';
import 'package:emp_2/src/presentation/cubit/app_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:table_calendar/table_calendar.dart';

class TaskCalendar extends StatefulWidget {
  final ValueChanged<DateTime> onValueChanged;
  final List<TaskModel> tasks;

  const TaskCalendar({
    required this.onValueChanged,
    required this.tasks,
    super.key,
  });

  @override
  State<TaskCalendar> createState() => _TaskCalendarState();
}

class _TaskCalendarState extends State<TaskCalendar> {
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();

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
          child: TableCalendar(
            firstDay: now.copyWith(day: 0),
            focusedDay: _focusedDay,
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
              });
              widget.onValueChanged(selectedDay);
            },
            lastDay: now.copyWith(day: 30),
            calendarBuilders: CalendarBuilders(
              selectedBuilder: (context, day, focusedDay) {
                final haveTasks =
                    widget.tasks.any((e) => isSameDay(e.date, day));
                return Stack(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: const BoxDecoration(
                          color: Colors.blue,
                          shape: BoxShape.circle,
                        ),
                        child: Text(
                          day.day.toString(),
                          style: const TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    if (haveTasks)
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: 10,
                          width: 10,
                          margin: const EdgeInsets.only(bottom: 8),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                  ],
                );
              },
              todayBuilder: (context, day, focusedDay) {
                return Stack(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Text(day.day.toString()),
                    ),
                    if (widget.tasks.any((e) => isSameDay(e.date, day)))
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: 10,
                          width: 10,
                          margin: const EdgeInsets.only(bottom: 8),
                          decoration: const BoxDecoration(
                            color: Colors.blue,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                  ],
                );
              },
              defaultBuilder: (context, day, focusedDay) {
                return Stack(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Text(day.day.toString()),
                    ),
                    if (widget.tasks.any((e) => isSameDay(e.date, day)))
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: 10,
                          width: 10,
                          margin: const EdgeInsets.only(bottom: 8),
                          decoration: const BoxDecoration(
                            color: Colors.blue,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }
}
