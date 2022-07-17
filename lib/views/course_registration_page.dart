import 'package:flutter/material.dart';
import 'package:notlar_uygulamasi/views/home_page.dart';
import 'package:notlar_uygulamasi/widgets/save_textfield.dart';

class CourseRegistrationPage extends StatefulWidget {
  const CourseRegistrationPage({Key? key}) : super(key: key);

  @override
  State<CourseRegistrationPage> createState() => _CourseRegistrationPageState();
}

class _CourseRegistrationPageState extends State<CourseRegistrationPage> {
  TextEditingController tfLessonName = TextEditingController();
  TextEditingController tfpointOne = TextEditingController();
  TextEditingController tfpointTwo = TextEditingController();

  Future<void> saveLesson(String lessonName, int p1, int p2) async {
    print("$lessonName $p1 $p2 kayit edildi");
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ders Kayit'),
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
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          saveLesson(tfLessonName.text, int.parse(tfpointOne.text),
              int.parse(tfpointTwo.text));
        },
        label: const Text("Kaydet"),
        icon: const Icon(Icons.save_outlined),
      ),
    );
  }
}
