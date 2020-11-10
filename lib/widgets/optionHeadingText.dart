import 'package:flutter/material.dart';

class OptionHeadingText extends StatelessWidget {
  final String title;
  const OptionHeadingText({
    Key key,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: Text(
        title,
        style: TextStyle(fontSize: 14, color: Colors.grey),
      ),
    );
  }
}
