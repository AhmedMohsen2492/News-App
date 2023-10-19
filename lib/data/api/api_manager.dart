import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_route/data/model/ArticlesResponse.dart';
import 'package:news_route/data/model/SourcesResponse.dart';

abstract class ApiManager {

  static String baseUrl = "newsapi.org" ;
  static String apiKey = "06113bb6ec544ddc83dac0645693f2a4" ;

  static Future<List<Source>> getSources() async{
    Uri url = Uri.parse("https://$baseUrl/v2/top-headlines/sources?apiKey=$apiKey");
    http.Response response = await http.get(url);
    Map json = jsonDecode(response.body);
    SourcesResponse sourcesResponse = SourcesResponse.fromJson(json);
    if(response.statusCode >= 200 && response.statusCode < 300
        && sourcesResponse.sources?.isNotEmpty == true) {
       return sourcesResponse.sources! ;
    }
    else
    {
        throw Exception(sourcesResponse.message);
    }
  }

  static Future<ArticlesResponse> getArticles(String sourceId) async{
    Uri url = Uri.https(baseUrl,"v2/everything", {
      "apiKey" : apiKey,
      "sources" :  sourceId,
    });
    http.Response response = await http.get(url);
    Map json = jsonDecode(response.body);
    ArticlesResponse articlesResponse = ArticlesResponse.fromJson(json);
    if(response.statusCode >=200 && response.statusCode<300
    && articlesResponse.articles?.isNotEmpty == true){
      return articlesResponse ;
    }
    else {
        throw Exception(articlesResponse.message);
    }
  }
}