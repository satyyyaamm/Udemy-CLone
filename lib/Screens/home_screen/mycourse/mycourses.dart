import 'package:flutter/material.dart';

class MyCourse extends StatefulWidget {
  @override
  _MyCourseState createState() => _MyCourseState();
}

class _MyCourseState extends State<MyCourse> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'My course',
          style: TextStyle(
              color: Colors.white, fontSize: 28, fontWeight: FontWeight.w300),
        ),
      ),
      body: Center(
        child: Text('My Course'),
      ),
    );
  }
}
