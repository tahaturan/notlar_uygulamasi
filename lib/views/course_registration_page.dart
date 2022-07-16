import 'package:flutter/material.dart';

class CourseRegistrationPage extends StatefulWidget {
  const CourseRegistrationPage({Key? key}) : super(key: key);

  @override
  State<CourseRegistrationPage> createState() => _CourseRegistrationPageState();
}

class _CourseRegistrationPageState extends State<CourseRegistrationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ders Kayit'),
      ),
      body: Container(),
    );
  }
}
