import 'package:esdm/src/Model/user.dart';

class AddUser{
  List<User> _listUser;

  AddUser() {
    this._listUser = new List();
  }

  AddUser addItem(User user) {
    this._listUser.add(user);
    return this;
  }

  List<User> ShowData(){
    return this._listUser;
  }
}