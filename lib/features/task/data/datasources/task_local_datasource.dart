import 'package:path/path.dart' show join;
import 'package:riverpod_todo/core/utils/app_keys/db_keys.dart';
import 'package:riverpod_todo/features/task/data/models/task_model.dart';
import 'package:sqflite/sqflite.dart';

class TaskLocalDatasource {
  static final TaskLocalDatasource instance = TaskLocalDatasource._();
  factory TaskLocalDatasource() => instance;
  TaskLocalDatasource._() {
    _initDB();
  }

  Database? _database;

  Future<Database> get database async {
    _database ??= await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, DBKeys.dbName);
    return await openDatabase(
      path,
      version: DBKeys.dbVersion,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE ${DBKeys.dbTable}(
            ${DBKeys.idColumn} INTEGER PRIMARY KEY AUTOINCREMENT,
            ${DBKeys.titleColumn} TEXT,
            ${DBKeys.noteColumn} TEXT,
            ${DBKeys.categoryColumn} TEXT,
            ${DBKeys.dueDateColumn} TEXT,
            ${DBKeys.isCompletedColumn} INTEGER DEFAULT 0
          )
        ''');
      },
    );
  }

  Future<void> closeDB() async {
    final db = await database;
    return await db.close();
  }

  Future<int> insertTask(TaskModel task) async {
    final db = await database;
    return db.transaction((txn) async {
      return await txn.insert(DBKeys.dbTable, task.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
    });
  }

  Future<List<TaskModel>> getAllTasks() async {
    final db = await database;
    final maps = await db.query(DBKeys.dbTable, orderBy: '${DBKeys.dueDateColumn} ASC');
    return maps.map((map) => TaskModel.fromMap(map)).toList();
  }

  Future<int> updateTask(TaskModel task) async {
    final db = await database;
    return db.transaction((txn) async {
      return await txn.update(DBKeys.dbTable, task.toMap(), where: '${DBKeys.idColumn} = ?', whereArgs: [task.id]);
    });
  }

  Future<int> deleteTask(int id) async {
    final db = await database;
    return db.transaction((txn) async {
      return await txn.delete(DBKeys.dbTable, where: '${DBKeys.idColumn} = ?', whereArgs: [id]);
    });
  }
}
