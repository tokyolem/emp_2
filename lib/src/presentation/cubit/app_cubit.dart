import 'dart:math';

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
              tasks: Labels.tasks),
        );

  void onTaskTitleChanged(String value) {
    emit(
      state.copyWith(
        task: state.task.copyWith(title: value),
      ),
    );
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
    final maxId = state.tasks.map((task) => task.id).reduce(max);

    emit(
      state.copyWith(
        tasks: [
          ...state.tasks,
          state.task.copyWith(id: maxId + 1),
        ],
      ),
    );
  }
}
