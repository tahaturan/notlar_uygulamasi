import 'dart:io';

import 'package:flutter/material.dart';
import 'package:notlar_uygulamasi/database/courses_dao.dart';
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
    List<Course> coursesList = await CourseDao.allCourse();
    return coursesList;
  }

  Future<bool> closeApp() async {
    await exit(0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            closeApp();
          },
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
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
                    "Genel Ortalama = ${result.toInt()}",
                    style: const TextStyle(fontSize: 14),
                  );
                } else {
                  return const Text(
                    "Genel Ortalama = 0",
                    style: TextStyle(fontSize: 14),
                  );
                }
              },
            ),
          ],
        ),
      ),
      body: WillPopScope(
        onWillPop: closeApp,
        child: FutureBuilder<List<Course>>(
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
