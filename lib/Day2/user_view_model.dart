import 'package:flutter/material.dart';

class UserInfo {
  String nickName;
  int level;
  String imgUrl;

  UserInfo(this.nickName, this.level, this.imgUrl);
}

class MJUserViewModel extends ChangeNotifier {
  UserInfo _user;

  MJUserViewModel(this._user);

  UserInfo get user => _user;

  set user(UserInfo value) {
    _user = value;
    notifyListeners();
  }
}
