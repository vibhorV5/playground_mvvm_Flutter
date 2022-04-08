import 'package:flutter/material.dart';
import 'package:playground/componenets/app_title.dart';
import 'package:playground/users_list/view_models/users_view_model.dart';
import 'package:provider/provider.dart';

class UserDetailsScreeen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UsersViewModel usersViewModel = context.watch<UsersViewModel>();

    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppTitle(text: '${usersViewModel.selectedModel!.name}'),
            Text(
              '${usersViewModel.selectedModel!.email}',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
