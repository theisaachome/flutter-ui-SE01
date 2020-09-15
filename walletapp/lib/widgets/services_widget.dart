import 'dart:ui';

import 'package:flutter/material.dart';

class ServiceWidget extends StatelessWidget {
  final IconData iconData;
  final String label;
  final Color bgColor;
  final Color iconColor;

  const ServiceWidget(
      {Key key, this.iconData, this.label, this.bgColor, this.iconColor})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: iconColor),
          color: bgColor,
          borderRadius: BorderRadius.circular(8)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            iconData,
            color: iconColor,
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            label,
            style: TextStyle(color: iconColor),
          )
        ],
      ),
    );
  }
}
