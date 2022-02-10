import 'package:bong_vai/data/api_services.dart';
import 'package:bong_vai/models/user.dart';
import 'package:flutter/cupertino.dart';

class UserListViewModel with ChangeNotifier {
  List<User> userList = [];

  fetchUserList() async {
    this.userList = await ApiServices().fetchUser();
    notifyListeners();
  }
}
