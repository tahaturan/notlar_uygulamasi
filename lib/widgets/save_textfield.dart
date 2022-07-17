import 'package:flutter/material.dart';

class SaveTextField extends StatelessWidget {
  final TextEditingController tfLessonName;
  final String hintText;
  const SaveTextField({
    Key? key,
    required this.tfLessonName,
    required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 25, right: 25),
      child: TextField(
        controller: tfLessonName,
        decoration: InputDecoration(
          hintText: hintText,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          prefixIcon: const Icon(Icons.edit),
        ),
      ),
    );
  }
}
