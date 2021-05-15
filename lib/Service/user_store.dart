import 'package:mobx/mobx.dart';
import 'package:mobx_demo/Utils/Constants.dart';

import 'package:mobx_demo/model/User.dart';

import 'network_service.dart';

part 'user_store.g.dart';

class UserStore = _UserStore with _$UserStore;

abstract class _UserStore with Store {
  final NetworkService httpClient = NetworkService();

  @observable
  ObservableFuture<List<User>> userListFuture;

  @action
  Future fetchUsers() => userListFuture = ObservableFuture(httpClient
      .getData(Constants.userUrl())
      .then((users) => users));


  void getTheUsers() {
    fetchUsers();
  }
}