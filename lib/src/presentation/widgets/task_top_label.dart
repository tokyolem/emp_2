import 'package:emp_2/src/domain/models/task_model.dart';
import 'package:emp_2/src/presentation/widgets/task_calendar.dart';
import 'package:flutter/material.dart';

class TaskTopLabel extends StatelessWidget {
  final List<TaskModel> tasks;

  const TaskTopLabel({
    required this.tasks,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'ToDoList',
              style: TextStyle(
                fontSize: 18,
                color: Colors.blue.shade400,
              ),
            ),
            Text(
              'Все задачи',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue.shade400,
              ),
            ),
          ],
        ),
        const Spacer(),
        Material(
          color: Colors.blue.shade400,
          borderRadius: const BorderRadius.all(
            Radius.circular(36),
          ),
          child: InkWell(
            onTap: () {
              showBottomSheet(
                elevation: 0,
                backgroundColor: Colors.transparent,
                context: context,
                builder: (_) => TaskCalendar(
                  onValueChanged: (value) {},
                  tasks: tasks,
                ),
              );
            },
            borderRadius: const BorderRadius.all(
              Radius.circular(36),
            ),
            child: const Padding(
              padding: EdgeInsets.all(8),
              child: Icon(
                Icons.calendar_today,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
