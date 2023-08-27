import 'package:flutter/material.dart';

class CustomPadding extends StatelessWidget {
  const CustomPadding(
      {super.key, required this.child, this.h = 16.0, this.v = 0.0});

  final double h, v;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: h, vertical: v),
        child: child);
  }
}
