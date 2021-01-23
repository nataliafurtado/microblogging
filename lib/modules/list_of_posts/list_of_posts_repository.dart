import '../../models/post.dart';
import 'list_of_posts_mock.dart';

class ListOfPostsRepository {
  Future<List<Post>> fetchLatestNews() async {
    return ListOfPostsMock().fetchListOfPosts();
  }
}
