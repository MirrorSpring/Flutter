import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqlite_app/students.dart';

class DatabaseHandler {
  Future<Database> initializeDB() async {
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, 'student.db'),
      onCreate: (db, version) async {
        //없으면 만들고 있으면 그대로 둠
        await db.execute(
            'create table students(id integer primary key autoincrement, code text, name text, dept text, phone text)');
      },
      version: 1,
    );
  }

  Future<List<Students>> queryStudents() async {
    final Database db = await initializeDB();
    final List<Map<String, Object?>> queryResult =
        await db.rawQuery('select * from students');
    return queryResult.map((e) => Students.fromMap(e)).toList();
  }

  Future<int> insertStudents(Students student) async {
    int result = 0;
    final Database db = await initializeDB();
    result = await db.rawInsert(
        'insert into students (code,name,dept,phone) values (?,?,?,?)',
        [student.code, student.name, student.dept, student.phone]);

    return result;
  }

  Future<List<Students>> selectStudents(int id) async {
    final Database db = await initializeDB();
    final List<Map<String, Object?>> queryResult =
        await db.rawQuery('select * from students where id=?', [id]);

    return queryResult.map((e) => Students.fromMap(e)).toList();
  }

  Future<int> updateStudents(Students student) async {
    int result = 0;
    final Database db = await initializeDB();
    result = await db.rawInsert(
        'update students set code=?,name=?,dept=?,phone=? where id=?',
        [student.code, student.name, student.dept, student.phone, student.id]);
    return result;
  }

  Future<int> deleteStudents(int id) async{
    int result = 0;
    final Database db = await initializeDB();
    result = await db.rawInsert(
        'delete from students where id=?',
        [id]);
    return result;
  }
}
