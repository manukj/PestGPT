// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pest_tasks.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PestTasks _$PestTasksFromJson(Map<String, dynamic> json) => PestTasks(
      pestName: json['pestName'] as String,
      tasks: (json['tasks'] as List<dynamic>)
          .map((e) => Tasks.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PestTasksToJson(PestTasks instance) => <String, dynamic>{
      'pestName': instance.pestName,
      'tasks': instance.tasks,
    };

Tasks _$TasksFromJson(Map<String, dynamic> json) => Tasks(
      taskName: json['taskName'] as String,
      isCompleted: json['isCompleted'] as bool,
    );

Map<String, dynamic> _$TasksToJson(Tasks instance) => <String, dynamic>{
      'taskName': instance.taskName,
      'isCompleted': instance.isCompleted,
    };
