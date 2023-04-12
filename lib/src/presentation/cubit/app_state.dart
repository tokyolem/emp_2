part of 'app_cubit.dart';

@freezed
class AppState with _$AppState {
  const factory AppState({
    required TaskModel task,
    required List<TaskModel> tasks,
  }) = _AppState;
}
