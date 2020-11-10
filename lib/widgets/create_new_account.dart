import 'package:flutter/material.dart';

class CreateNewAccount extends StatelessWidget {
  final String title;
  final String title2;
  final Function onpressed;
  const CreateNewAccount({
    Key key,
    this.onpressed,
    this.title,
    this.title2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 70),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.w300, color: Colors.white),
          ),
          GestureDetector(
            onTap: onpressed,
            child: Text(
              title2,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
