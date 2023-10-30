import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_route/data/model/articles_response.dart';
import 'package:news_route/data/model/sources_response.dart';

class OnlineDataSource {
  static const String baseUrl = "newsapi.org";
  static const String apiKey = "ab0e64eff1a44b1dbc0a94e5a003d278";

  Future<SourcesResponse> getSources(String categoryId) async {
    Uri url = Uri.https(baseUrl, "v2/top-headlines/sources", {
      "apiKey": apiKey,
      "category": categoryId,
    });
    http.Response response = await http.get(url);
    Map json = jsonDecode(response.body);
    SourcesResponse sourcesResponse = SourcesResponse.fromJson(json);
    if (response.statusCode >= 200 &&
        response.statusCode < 300 &&
        sourcesResponse.sources?.isNotEmpty == true) {
      return sourcesResponse;
    } else {
      throw Exception(sourcesResponse.message);
    }
  }

  Future<ArticlesResponse> getArticles(String sourceId) async {
    Uri url = Uri.https(baseUrl, "v2/everything", {
      "apiKey": apiKey,
      "sources": sourceId,
    });
    http.Response response = await http.get(url);
    Map json = jsonDecode(response.body);
    ArticlesResponse articlesResponse = ArticlesResponse.fromJson(json);
    if (response.statusCode >= 200 &&
        response.statusCode < 300 &&
        articlesResponse.articles?.isNotEmpty == true) {
      return articlesResponse;
    } else {
      throw Exception(articlesResponse.message);
    }
  }

  Future<ArticlesResponse> getSearchArticles(String q) async {
    Uri url = Uri.https(baseUrl, "v2/everything", {
      "apiKey": apiKey,
      "q": q,
    });
    http.Response response = await http.get(url);
    Map json = jsonDecode(response.body);
    ArticlesResponse articlesResponse = ArticlesResponse.fromJson(json);
    if (response.statusCode >= 200 &&
        response.statusCode < 300 &&
        articlesResponse.articles?.isNotEmpty == true) {
      return articlesResponse;
    } else {
      throw Exception(articlesResponse.message);
    }
  }
}
