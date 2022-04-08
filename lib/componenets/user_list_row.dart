import 'package:flutter/material.dart';
import 'package:playground/componenets/app_title.dart';
import 'package:playground/users_list/models/user_list_model.dart';

class UserListRow extends StatelessWidget {
  final userModel;
  final VoidCallback? tap;

  UserListRow({this.userModel, this.tap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: tap,
      child: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppTitle(text: '${userModel.name}'),
            Text(
              '${userModel.email}',
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
