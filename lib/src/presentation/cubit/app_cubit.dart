import 'dart:math';

import 'package:collection/collection.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:emp_2/src/domain/models/task_model.dart';
import 'package:emp_2/src/presentation/utils/constants/labels.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_state.dart';

part 'app_cubit.freezed.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit()
      : super(
          AppState(
            task: TaskModel(
              id: -1,
              title: 'task',
              date: DateTime.now(),
              description: 'description',
              taskEvent: 'task_event',
            ),
            tasks: Labels.tasks.toIList(),
          ),
        );

  void setTask(TaskModel task) {
    emit(
      state.copyWith(
        task: task,
      ),
    );
  }

  @override
  void onChange(Change<AppState> change) {
    super.onChange(change);
    print('${change.currentState.task.title} ${change.nextState.task.title}');
  }

  void onTaskTitleChanged(String value) {
    emit(
      state.copyWith(
        task: state.task.copyWith(title: value),
      ),
    );
    print(state.task.title);
  }

  void onTaskDescriptionChanged(String value) {
    emit(
      state.copyWith(
        task: state.task.copyWith(description: value),
      ),
    );
  }

  void onTaskDateChanged(DateTime value) {
    emit(
      state.copyWith(
        task: state.task.copyWith(date: value),
      ),
    );
  }

  void onTaskEventChanged(String value) {
    emit(
      state.copyWith(
        task: state.task.copyWith(title: value),
      ),
    );
  }

  void addTask() {
    final int maxId;
    if (state.tasks.isEmpty) {
      maxId = 0;
    } else {
      maxId = state.tasks.map((task) => task.id).reduce(max);
    }

    emit(
      state.copyWith(
        tasks: state.tasks.add(
          state.task.copyWith(id: maxId + 1),
        ),
      ),
    );
  }

  void editTask(TaskModel task) {
    print(state.task.title);

    final tasks = state.tasks.map((el) {
      if (task.id == el.id) {
        return task.copyWith(
            title: state.task.title, taskEvent: state.task.taskEvent);
      } else {
        return el;
      }
    });

    emit(
      state.copyWith(
        tasks: tasks
            .sorted(
              (a, b) => a.date.compareTo(b.date),
            )
            .toIList(),
      ),
    );
  }

  void deleteTask(TaskModel task) {
    emit(
      state.copyWith(
          tasks: state.tasks.removeWhere((el) => el.id == task.id).toIList()),
    );
  }

  void updateDone(TaskModel task) {
    final tasks = state.tasks.map((el) {
      if (task.id == el.id) {
        return task.copyWith(
          isDone: !task.isDone
        );
      } else {
        return el;
      }
    });

    emit(
      state.copyWith(
        tasks: tasks.toIList(),
      ),
    );
  }
}
