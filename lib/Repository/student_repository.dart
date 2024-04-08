
import 'package:studentapp/database/db_helper.dart';
import 'package:studentapp/model/student_model.dart';

class StudentRepository {
  DBHelper dbHelper = DBHelper();
  static const tableName = 'student';

  Future<List<StudentModel>> getStudent() async {
    var dbclient = await dbHelper.db;
    List<Map<String, dynamic>> maps = await dbclient
        .query(tableName, columns: ['id', 'name', 'domain', 'batch', 'image']);
    List<StudentModel> student = [];
    for (var i = 0; i < maps.length; i++) {
      student.add(StudentModel.fromMap(maps[i]));
    }
    return student;
  }

  Future<int> add(StudentModel studentModel) async {
    var dbClient = await dbHelper.db;
    return await dbClient.insert(tableName, studentModel.toMap());
  }

  Future<int> update(StudentModel studentModel) async {
    var dbclient = await dbHelper.db;
    return await dbclient.update(tableName, studentModel.toMap(),
        where: 'id=?', whereArgs: [studentModel.id]);
  }

  Future<int> delete(int id) async {
    var dbClient = await dbHelper.db;
  return await dbClient.delete(tableName, where: 'id=?', whereArgs: [id]);
  }
}
