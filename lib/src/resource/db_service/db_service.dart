import 'package:path/path.dart';
import 'package:pest_gpt/src/models/pest/pest_tasks.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseService {
  static final DatabaseService _instance = DatabaseService._internal();
  static Database? _database;

  factory DatabaseService() {
    return _instance;
  }

  DatabaseService._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    var dbPath = await getDatabasesPath();
    String path = join(dbPath, 'pest_tasks.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE PestTasks (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        pestName TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE Tasks (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        taskName TEXT,
        isCompleted INTEGER,
        pestTaskId INTEGER,
        FOREIGN KEY (pestTaskId) REFERENCES PestTasks (id) ON DELETE CASCADE
      )
    ''');
  }

  Future<int> addPestTask(PestTasks pestTask) async {
    final db = await database;
    int id = await db.insert('PestTasks', {'pestName': pestTask.pestName});

    for (var task in pestTask.tasks) {
      await db.insert('Tasks', {
        'taskName': task.taskName,
        'isCompleted': task.isCompleted ? 1 : 0,
        'pestTaskId': id
      });
    }
    return id;
  }

  Future<int> addTask(int pestTaskId, Tasks task) async {
    final db = await database;
    return await db.insert('Tasks', {
      'taskName': task.taskName,
      'isCompleted': task.isCompleted ? 1 : 0,
      'pestTaskId': pestTaskId
    });
  }

  Future<void> updateTaskStatus(int taskId, bool isCompleted) async {
    final db = await database;
    await db.update(
      'Tasks',
      {'isCompleted': isCompleted ? 1 : 0},
      where: 'id = ?',
      whereArgs: [taskId],
    );
  }

  Future<List<PestTasks>> getPestTasks() async {
    final db = await database;
    final List<Map<String, dynamic>> pestTaskMaps = await db.query('PestTasks');
    List<PestTasks> pestTasks = [];

    for (var pestTaskMap in pestTaskMaps) {
      final List<Map<String, dynamic>> taskMaps = await db.query(
        'Tasks',
        where: 'pestTaskId = ?',
        whereArgs: [pestTaskMap['id']],
      );

      List<Tasks> tasks = taskMaps.map((taskMap) {
        return Tasks(
          taskName: taskMap['taskName'],
          isCompleted: taskMap['isCompleted'] == 1,
        );
      }).toList();

      pestTasks.add(PestTasks(
        pestName: pestTaskMap['pestName'],
        tasks: tasks,
      ));
    }

    return pestTasks;
  }
}
