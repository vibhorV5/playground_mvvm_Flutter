import 'package:flutter/material.dart';

class AppError extends StatelessWidget {
  final errorText;
  AppError({this.errorText});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Text(
        errorText,
        style: TextStyle(color: Colors.red),
      ),
    );
  }
}
