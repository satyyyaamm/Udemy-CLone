import 'package:flutter/material.dart';

class SignInOptionsButton extends StatelessWidget {
  final Function onpressed;
  final Icon icon;
  final String title;
  final EdgeInsets padding;
  const SignInOptionsButton({
    Key key,
    this.title,
    this.onpressed,
    this.icon,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: RaisedButton.icon(
        elevation: 6,
        padding: padding,
        color: Colors.white,
        onPressed: onpressed,
        icon: icon,
        label: Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
