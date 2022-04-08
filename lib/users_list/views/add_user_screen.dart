import 'package:flutter/material.dart';
import 'package:playground/users_list/view_models/users_view_model.dart';
import 'package:provider/provider.dart';

class AddUserScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UsersViewModel usersViewModel = context.watch<UsersViewModel>();

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () async {
                bool userAdded = await usersViewModel.addUser();
                if (!userAdded) {
                  return;
                }
                Navigator.pop(context);
              },
              icon: Icon(Icons.save))
        ],
        title: Center(
          child: Text('Add User'),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            TextFormField(
              onChanged: (value) {
                usersViewModel.addingUser.name = value;
              },
              decoration: InputDecoration(hintText: 'Name'),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              onChanged: (value) {
                usersViewModel.addingUser.email = value;
              },
              decoration: InputDecoration(hintText: 'Email'),
            ),
          ],
        ),
      ),
    );
  }
}
