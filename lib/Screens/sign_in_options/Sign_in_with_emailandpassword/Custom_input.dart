import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  final String labelText;
  final bool obscureText;
  final TextEditingController controller;
  final Function(String) validator;
  final FocusNode focusNode;
  final EdgeInsetsGeometry padding;
  const CustomInput({
    Key key,
    this.labelText,
    this.obscureText,
    this.controller,
    this.validator,
    this.focusNode,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Padding(
      padding: padding,
      child: Form(
        key: _formKey,
        child: TextFormField(
            focusNode: focusNode,
            validator: validator,
            controller: controller,
            obscureText: obscureText,
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
              errorStyle: TextStyle(color: Colors.yellow, fontSize: 16),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(08),
                borderSide: BorderSide(color: Colors.yellow),
              ),
              labelText: labelText,
              labelStyle: TextStyle(color: Colors.white),
            ),
            cursorColor: Colors.white),
      ),
    );
  }
}
