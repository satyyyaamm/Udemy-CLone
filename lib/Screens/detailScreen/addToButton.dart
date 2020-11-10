import 'package:flutter/material.dart';

class AddToButton extends StatelessWidget {
  final String title;
  final Function onpressed;
  const AddToButton({
    Key key,
    this.title,
    this.onpressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onpressed,
        child: Container(
          margin: EdgeInsets.only(left: 4, top: 5, bottom: 5, right: 3),
          padding: EdgeInsets.symmetric(vertical: 15),
          width: 170,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(04),
              color: Colors.grey.shade600),
          child: Center(
            child: Text(
              title,
              style: TextStyle(fontSize: 14, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
