import 'package:flutter/material.dart';
import 'package:playground/users_list/models/user_error.dart';
import 'package:playground/users_list/models/user_list_model.dart';
import 'package:playground/users_list/repo/api_status.dart';
import 'package:playground/users_list/repo/user_services.dart';

class UsersViewModel extends ChangeNotifier {
  bool _isLoading = false;
  List<UserModel> _userListModel = [];
  UserError? _userError;
  UserModel? _selectedUserModel;
  UserModel _addingUser = UserModel();

  bool get loading => _isLoading;
  List<UserModel> get userListModel => _userListModel;
  UserError? get userError => _userError;
  UserModel? get selectedModel => _selectedUserModel;
  UserModel get addingUser => _addingUser;

  addUser() async {
    if (!isValid()) {
      return;
    }
    _userListModel.add(addingUser);
    _addingUser = UserModel();
    notifyListeners();
    return true;
  }

  isValid() {
    if (_addingUser.name == null && _addingUser.name!.isEmpty) {
      return false;
    }

    if (_addingUser.email == null && _addingUser.email!.isEmpty) {
      return false;
    }
    return true;
  }

  UsersViewModel() {
    getUsers();
  }

  selectedUserModel(UserModel selectedUserModel) {
    _selectedUserModel = selectedUserModel;
  }

  setLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  setUserListModel(List<UserModel> userListModel) {
    _userListModel = userListModel;
  }

  setUserError(UserError userError) {
    _userError = userError;
  }

  getUsers() async {
    setLoading(true);
    var response = await UserServices.getUsers();
    if (response is Success) {
      setUserListModel(response.response as List<UserModel>);
    }
    if (response is Failure) {
      UserError userError = UserError(
          code: response.code, message: response.errorResponse as String);
      setUserError(userError);
    }
    setLoading(false);
  }
}
