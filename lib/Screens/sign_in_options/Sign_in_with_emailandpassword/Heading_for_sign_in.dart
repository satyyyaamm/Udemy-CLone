import 'package:flutter/material.dart';

class HeadingForSignIn extends StatelessWidget {
  final String title1;
  final String title2;
  final bool hastitle2;
  const HeadingForSignIn({
    Key key,
    this.title1,
    this.title2,
    this.hastitle2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool _hastitle2 = hastitle2 ?? true;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title1,
          style: TextStyle(
              fontSize: 26, color: Colors.white, fontWeight: FontWeight.w300),
        ),
        if (_hastitle2)
          Text(
            title2,
            style: TextStyle(
                fontSize: 16, color: Colors.white, fontWeight: FontWeight.w300),
            textAlign: TextAlign.center,
          ),
      ],
    );
  }
}
