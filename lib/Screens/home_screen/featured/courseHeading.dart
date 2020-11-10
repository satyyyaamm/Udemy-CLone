import 'package:flutter/material.dart';

class CourseHeading extends StatelessWidget {
  final String title;
  const CourseHeading({
    Key key,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Text(
        title,
        style: TextStyle(
            fontWeight: FontWeight.w300, color: Colors.white, fontSize: 30),
      ),
    );
  }
}
