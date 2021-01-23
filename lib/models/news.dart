import 'latest_news.dart';

class News {
  List<LatestNews> news;
  News({
    this.news,
  });

  factory News.fromJson(dynamic json) {
    return News(
      news: (json["news"] as List).map((i) => LatestNews.fromJson(i)).toList(),
    );
  }
}
