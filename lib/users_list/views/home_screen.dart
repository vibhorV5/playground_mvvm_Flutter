import 'package:flutter/material.dart';
import 'package:playground/componenets/app_error.dart';
import 'package:playground/componenets/app_loading.dart';
import 'package:playground/componenets/user_list_row.dart';
import 'package:playground/users_list/models/user_list_model.dart';
import 'package:playground/users_list/view_models/users_view_model.dart';
import 'package:playground/utils/navigation_utils.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UsersViewModel usersViewModel = context.watch<UsersViewModel>();

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          actions: [
            InkWell(
              onTap: () async {
                openAddUser(context);
              },
              child: Icon(
                Icons.add,
              ),
            ),
          ],
          title: Center(
            child: Text('Users'),
          ),
        ),
        body: Container(
          color: Colors.white,
          child: Column(
            children: [_ui(usersViewModel)],
          ),
        ));
  }

  _ui(UsersViewModel usersViewModel) {
    if (usersViewModel.loading) {
      return AppLoading();
    }
    if (usersViewModel.userError != null) {
      return AppError(errorText: usersViewModel.userError!.message);
    }

    return Expanded(
      child: ListView.separated(
          itemCount: usersViewModel.userListModel.length,
          itemBuilder: ((context, index) {
            UserModel userModel = usersViewModel.userListModel[index];
            return UserListRow(
              userModel: userModel,
              tap: () async {
                //
                usersViewModel.selectedUserModel(userModel);
                openUserDetails(context);
              },
            );
          }),
          separatorBuilder: (context, index) => Divider()),
    );
  }
}
