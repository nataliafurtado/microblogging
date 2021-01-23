import 'message.dart';
import 'user.dart';

class LatestNews {
  User user;
  Message message;

  LatestNews({
    this.user,
    this.message,
  });

  factory LatestNews.fromJson(dynamic json) {
    return LatestNews(
      message: Message.fromJson(json["message"]),
      user: User.fromJson(json["user"]),
    );
  }
}
