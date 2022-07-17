import 'package:notlar_uygulamasi/database/data_base_helper.dart';
import 'package:notlar_uygulamasi/model/course.dart';

class CourseDao {
  Future<List<Course>> allCourse() async {
    var db = await DataBaseHelper.dataBaseConnect();
    String allCourseSql = "SELECT * FROM notlar";

    List<Map<String, dynamic>> maps = await db.rawQuery(allCourseSql);

    return List.generate(maps.length, (index) {
      var line = maps[index];
      return Course(
          line["not_id"], line["ders_adi"], line["not1"], line["not2"]);
    });
  }

  Future<void> addCourse(String courseName, int pointOne, int pointTwo) async {
    var db = await DataBaseHelper.dataBaseConnect();

    Map<String, dynamic> informations = {};

    informations["ders_adi"] = courseName;
    informations["not1"] = pointOne;
    informations["not2"] = pointTwo;

    await db.insert("notlar", informations);
  }

  Future<void> update(
      int courseId, String courseName, int pointOne, int pointTwo) async {
    var db = await DataBaseHelper.dataBaseConnect();

    Map<String, dynamic> informations = {};

    informations["ders_adi"] = courseName;
    informations["not1"] = pointOne;
    informations["not2"] = pointTwo;
    db.update("notlar", informations, where: "not_id=?", whereArgs: [courseId]);
  }

  Future<void> delete(int courseId) async {
    var db = await DataBaseHelper.dataBaseConnect();

    db.delete("notlar", where: "not_id=?", whereArgs: [courseId]);
  }
}
