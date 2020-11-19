import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  final String labelText;
  final bool obscureText;
  final TextEditingController controller;
  final Function validator;
  final EdgeInsetsGeometry padding;
  final Function onchanged;

  const CustomInput({
    Key key,
    this.labelText,
    this.obscureText,
    this.controller,
    this.validator,
    this.padding,
    this.onchanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: TextFormField(
          validator: validator,
          controller: controller,
          obscureText: obscureText,
          onChanged: onchanged,
          style: TextStyle(
              fontSize: 18,
              color: Colors.white,
              decoration: TextDecoration.none),
          textInputAction: TextInputAction.done,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(08),
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(08),
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(08),
              borderSide: BorderSide(color: Colors.yellow),
            ),
            errorStyle: TextStyle(color: Colors.yellow),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(08),
              borderSide: BorderSide(color: Colors.yellow),
            ),
            labelText: labelText,
            labelStyle: TextStyle(color: Colors.white),
          ),
          cursorColor: Colors.white),
    );
  }
}
