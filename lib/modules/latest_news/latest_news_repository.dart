import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../models/news.dart';

class LatestNwesRepository {
  Future<News> fetchLatestNews() async {
    String url = "https://gb-mobile-app-teste.s3.amazonaws.com/data.json";

    News news = News(news: []);
    var response = await http.get(url);
    news = News.fromJson(json.decode(response.body));

    return news;
  }
}
