import 'package:flutter/material.dart';
import 'package:notlar_uygulamasi/model/course.dart';
import 'package:notlar_uygulamasi/views/course_detail_page.dart';
import 'package:notlar_uygulamasi/views/course_registration_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<List<Course>> showAllCourses() async {
    List<Course> coursesList = [];

    var n1 = Course(1, "Tarih", 100, 78);
    var n2 = Course(2, "Matematik", 10, 56);
    var n3 = Course(3, "Kimya", 65, 3);

    coursesList.add(n1);
    coursesList.add(n2);
    coursesList.add(n3);
    return coursesList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Notlar Uygulamasi",
              style: TextStyle(fontSize: 16),
            ),
            FutureBuilder(
              future: showAllCourses(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  List<Course> coursesList = snapshot.data;
                  double result = 0.0;
                  if (coursesList.isNotEmpty) {
                    double total = 0.0;
                    for (var n in coursesList) {
                      total = total + (n.pointOne + n.pointTwo) / 2;
                    }
                    result = total / coursesList.length;
                  }
                  return Text(
                    "Ortalama = ${result.toInt()}",
                    style: const TextStyle(fontSize: 14),
                  );
                } else {
                  return const Text(
                    "Ortalama = 0",
                    style: TextStyle(fontSize: 14),
                  );
                }
              },
            ),
          ],
        ),
      ),
      body: FutureBuilder<List<Course>>(
        future: showAllCourses(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            List<Course> coursesList = snapshot.data;
            return ListView.builder(
              itemCount: coursesList.length,
              itemBuilder: (BuildContext context, int index) {
                Course course = coursesList[index];
                return Card(
                  elevation: 5,
                  margin: const EdgeInsets.all(5),
                  child: ListTile(
                    leading:
                        CircleAvatar(child: Text(course.courseId.toString())),
                    title: Text(course.courseName),
                    subtitle: Text(
                        "P1: ${course.pointOne} P2: ${course.pointTwo} = ${(course.pointOne + course.pointTwo) / 2}"),
                    trailing: const Icon(Icons.edit),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                CourseDetailPage(point: course),
                          ));
                    },
                  ),
                );
              },
            );
          } else {
            return Container();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CourseRegistrationPage(),
              ));
        },
        tooltip: "Ders Ekle",
        child: const Icon(Icons.add),
      ),
    );
  }
}
