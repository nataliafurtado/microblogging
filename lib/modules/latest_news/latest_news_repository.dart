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
        news = News.fromJson(json.decode(response.body));
      } else {
        throw response.statusCode;
      }
    } catch (e) {
      throw "Erro inesperado";
    }

    return news;
  }
}
