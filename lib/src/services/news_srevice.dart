import 'package:flutter/material.dart';
import 'package:mfa/src/models/news_models.dart';
import 'package:http/http.dart' as http;

final _URL_NEWS = 'https://newsapi.org/v2';
final _APIKEY = 'a3830ffd74a24672b0e40181efe5bf7e';

class NewsService with ChangeNotifier {
  List<Article> headlines = [];
  String _country = 'Venezuela';
  String _av = 've';
  String _cat = 'general';

  NewsService() {
    this.getTopHeadlines();
  }

  getTopHeadlines() async {
    final url =
        '$_URL_NEWS/top-headlines?apiKey=$_APIKEY&country=$_av&category=$_cat';
    final resp = await http.get(url);
    final newsResponse = newsResponseFromJson(resp.body);
    this.headlines.addAll(newsResponse.articles);
    notifyListeners();
  }

  String get country => _country;
  void changeCountry(text, String text_av) {
    _country = text;
    _av = text_av;
    headlines = [];
    getTopHeadlines();
    notifyListeners();
  }

  getOnRefresh() {
    headlines = [];
    getTopHeadlines();
    notifyListeners();
  }

  String get category => _cat;
  void changeCategory(String text) {
    _cat = text;
    headlines = [];
    getTopHeadlines();
    notifyListeners();
  }
}
