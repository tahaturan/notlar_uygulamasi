import 'package:flutter/material.dart';
import 'package:notlar_uygulamasi/database/courses_dao.dart';
import 'package:notlar_uygulamasi/model/course.dart';
import 'package:notlar_uygulamasi/views/home_page.dart';
import 'package:notlar_uygulamasi/widgets/save_textfield.dart';

class CourseDetailPage extends StatefulWidget {
  Course point;
  CourseDetailPage({required this.point, Key? key}) : super(key: key);

  @override
  State<CourseDetailPage> createState() => _CourseDetailPageState();
}

class _CourseDetailPageState extends State<CourseDetailPage> {
  TextEditingController tfLessonName = TextEditingController();
  TextEditingController tfpointOne = TextEditingController();
  TextEditingController tfpointTwo = TextEditingController();

  Future<void> delete(int pointId) async {
    await CourseDao.delete(pointId);
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ));
  }

  Future<void> update(int pointId, String lessonName, int p1, int p2) async {
    await CourseDao.update(pointId, lessonName, p1, p2);
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ));
  }

  @override
  void initState() {
    super.initState();
    Course course = widget.point;
    tfLessonName.text = course.courseName;
    tfpointOne.text = course.pointOne.toString();
    tfpointTwo.text = course.pointTwo.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Not Detay'),
        actions: [
          TextButton(
            onPressed: () {
              delete(widget.point.courseId);
            },
            child: const Text(
              "Sil",
              style: TextStyle(color: Colors.black),
            ),
          ),
          TextButton(
            onPressed: () {
              update(widget.point.courseId, tfLessonName.text,
                  int.parse(tfpointOne.text), int.parse(tfpointTwo.text));
            },
            child: const Text(
              "Guncelle",
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SaveTextField(tfLessonName: tfLessonName, hintText: "Ders Adi"),
            SaveTextField(tfLessonName: tfpointOne, hintText: "1.Not"),
            SaveTextField(tfLessonName: tfpointTwo, hintText: "2.Not"),
          ],
        ),
      ),
    );
  }
}
