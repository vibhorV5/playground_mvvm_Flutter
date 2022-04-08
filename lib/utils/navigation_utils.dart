import 'package:flutter/material.dart';
import 'package:playground/users_list/views/add_user_screen.dart';
import 'package:playground/users_list/views/user_details_screen.dart';

void openUserDetails(BuildContext context) async {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => UserDetailsScreeen(),
    ),
  );
}

void openAddUser(BuildContext context) async {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => AddUserScreen(),
    ),
  );
}
