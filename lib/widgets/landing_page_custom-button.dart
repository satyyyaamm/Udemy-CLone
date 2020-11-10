import 'package:flutter/material.dart';

class LandingPageButton extends StatelessWidget {
  final Function onpressed;
  final String title;
  const LandingPageButton({
    Key key,
    this.onpressed,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onpressed,
        child: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.all(20),
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.transparent, width: 2),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            title,
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.w300),
          ),
        ),
      ),
    );
  }
}
