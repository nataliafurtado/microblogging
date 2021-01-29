import '../../models/post.dart';
import 'list_of_posts_mock.dart';

class ListOfPostsRepository {
  Future<List<Post>> fetchListOsPosts() async {
    return ListOfPostsMock().fetchListOfPosts();
  }
}
