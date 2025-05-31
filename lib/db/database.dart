import 'package:path/path.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class SkillDatabase {
  Future<Database> getDatabase() async {
    final dbPath = await getDatabasesPath();
    return openDatabase(
      join(dbPath, 'skills.db'),
      onCreate: (db, version) {
        return db.execute('''
          CREATE TABLE skill (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT NOT NULL,
            description TEXT NOT NULL,
            startDate TEXT NOT NULL,
            endDate TEXT NOT NULL
          )
        ''');
      },
      version: 1,
    );
  }
}
