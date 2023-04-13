part of 'app_cubit.dart';

@freezed
class AppState with _$AppState {
  const factory AppState({
    required TaskModel task,
    required IList<TaskModel> tasks,
  }) = _AppState;
}
