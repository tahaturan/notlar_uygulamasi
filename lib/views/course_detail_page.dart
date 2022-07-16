import 'package:flutter/material.dart';

class CourseDetailPage extends StatefulWidget {
  const CourseDetailPage({Key? key}) : super(key: key);

  @override
  State<CourseDetailPage> createState() => _CourseDetailPageState();
}

class _CourseDetailPageState extends State<CourseDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Not Detay'),
      ),
      body: Container(),
    );
  }
}
