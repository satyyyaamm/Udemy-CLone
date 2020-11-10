import 'package:flutter/material.dart';

class DetailPageChips extends StatelessWidget {
  final String title;
  final Icon icon;
  final bool hasIcon;
  const DetailPageChips({
    Key key,
    this.title,
    this.icon,
    this.hasIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool _hasIcons = hasIcon ?? true;
    return Container(
      padding: EdgeInsets.all(6),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(40)),
      child: Row(
        children: [
          if (_hasIcons)
            icon ?? Icon(Icons.person, color: Colors.white, size: 15),
          SizedBox(width: 5),
          Text(
            title,
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
