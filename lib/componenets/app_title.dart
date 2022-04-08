import 'package:flutter/material.dart';

class AppTitle extends StatelessWidget {
  final String text;
  AppTitle({required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20));
  }
}
