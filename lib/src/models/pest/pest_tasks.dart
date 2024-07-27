import 'package:json_annotation/json_annotation.dart';

part 'pest_tasks.g.dart';

@JsonSerializable()
class PestTasks {
  String pestName;
  List<Tasks> tasks;

  PestTasks({required this.pestName, required this.tasks});

  factory PestTasks.fromJson(Map<String, dynamic> json) =>
      _$PestTasksFromJson(json);

  Map<String, dynamic> toJson() => _$PestTasksToJson(this);
}

@JsonSerializable()
class Tasks {
  String taskName;
  bool isCompleted;

  Tasks({
    required this.taskName,
    this.isCompleted = false,
  });

  factory Tasks.fromJson(Map<String, dynamic> json) => _$TasksFromJson(json);

  Map<String, dynamic> toJson() => _$TasksToJson(this);
}
