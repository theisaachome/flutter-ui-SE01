import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  final screenheight;
  final Widget child;
  const MyCard({Key key, this.screenheight, this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
      margin: EdgeInsets.symmetric(horizontal: 16),
      height: screenheight / 3.5,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(color: Colors.black12, blurRadius: 2, spreadRadius: 2)
          ]),
    );
  }
}
