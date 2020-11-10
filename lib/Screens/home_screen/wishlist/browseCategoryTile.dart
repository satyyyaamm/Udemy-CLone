import 'package:flutter/material.dart';

class BrowseCategoryTile extends StatelessWidget {
  final String title;
  final Icon icon;
  const BrowseCategoryTile({
    Key key,
    this.title,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: icon,
      title: Text(
        title,
        style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
      ),
    );
  }
}
