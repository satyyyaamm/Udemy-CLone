import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CustomFlatButton extends StatelessWidget {
  final String title;
  final Function onpressed;
  final EdgeInsetsGeometry padding;
  final Color color;
  final Color titleColor;
  final double fontsize;
  final FocusNode focusNode;
  const CustomFlatButton({
    Key key,
    this.title,
    this.onpressed,
    this.padding,
    this.color,
    this.titleColor,
    this.fontsize,
    this.focusNode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: FlatButton(
        color: color,
        focusNode: focusNode,
        onPressed: onpressed,
        child: Text(
          title,
          style: TextStyle(
              fontSize: fontsize,
              fontWeight: FontWeight.w400,
              color: titleColor),
        ),
      ),
    );
  }
}
