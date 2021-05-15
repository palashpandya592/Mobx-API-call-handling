import 'package:mobx/mobx.dart';
import 'package:mobx_demo/Utils/Constants.dart';
import 'package:mobx_demo/model/Post.dart';
import 'network_service.dart';

part 'post_store.g.dart';

class PostStore = _PostStore with _$PostStore;

abstract class _PostStore with Store {
  final NetworkService httpClient = NetworkService();

  @observable
  ObservableFuture<List<Post>> postsListFuture;

  @action
  Future fetchPosts() => postsListFuture = ObservableFuture(httpClient
      .getPosts(Constants.postUrl())
      .then((posts) => posts));


  void getThePosts() {
    fetchPosts();
  }
}