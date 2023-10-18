import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_route/data/model/SourcesResponse.dart';

abstract class ApiManager {

  static String baseUrl = "newsapi.org" ;
  static String apiKey = "ab0e64eff1a44b1dbc0a94e5a003d278" ;
  static String sourcesEndpoint = "v2/top-headlines/sources" ;

  static Future<List<Source>> getSources() async{
    Uri url = Uri.parse("https://$baseUrl/$sourcesEndpoint?apiKey=$apiKey");
    http.Response response = await http.get(url);
    Map json = jsonDecode(response.body);

    SourcesResponse sourcesResponse = SourcesResponse.fromJson(json);

    if(response.statusCode >= 200 && response.statusCode < 300
        && sourcesResponse.sources?.isNotEmpty == true) {
       return sourcesResponse.sources! ;
    }
    else {
        throw Exception(sourcesResponse.message);
    }
  }

  static getArticles(){

  }
}