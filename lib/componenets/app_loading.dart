import 'package:flutter/cupertino.dart';

class AppLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: CupertinoActivityIndicator(),
    );
  }
}
