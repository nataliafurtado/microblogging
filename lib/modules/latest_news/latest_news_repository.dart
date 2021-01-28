import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../models/news.dart';

class LatestNwesRepository {
  Future<News> fetchLatestNews() async {
    String url = "https://gb-mobile-app-teste.s3.amazonaws.com/data.json";

    News news = News(news: []);
    try {
      http.Response response = await http.get(url);
      if (response.statusCode > 199 && response.statusCode < 300) {
        String body = utf8.decode(response.bodyBytes);

        news = News.fromJson(json.decode(body));
      } else {
        throw response.statusCode;
      }
    } catch (e) {
      throw "Erro inesperado";
    }

    return news;
  }
}
