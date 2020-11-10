import 'package:flutter/material.dart';

class OptionCustomListTile extends StatelessWidget {
  final String title;
  final Function onpressed;
  const OptionCustomListTile({
    Key key,
    this.title,
    this.onpressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onpressed,
      title: Text(
        title,
        style: TextStyle(fontSize: 18, color: Colors.white),
      ),
      trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 18),
    );
  }
}
