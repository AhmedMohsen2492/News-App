import 'package:flutter/cupertino.dart';
import 'package:news_route/data/repositories/news_repo/data_sources/offline_data_source.dart';
import 'package:news_route/data/repositories/news_repo/data_sources/online_data_source.dart';
import 'package:news_route/data/model/sources_response.dart';
import 'package:news_route/data/repositories/news_repo/news_repo.dart';

class NewsTabViewModel extends ChangeNotifier {
  List<Source> sources = [];
  bool isLoading = true;
  NewsRepo newsRepo = NewsRepo(OnlineDataSource(), OfflineDataSource());
  String? errorText;

  void getSource(String categoryId) async {
    isLoading = true;
    notifyListeners();
    try {
      SourcesResponse? sourcesResponse = await newsRepo.getSources(categoryId);
      if (sourcesResponse != null &&
          sourcesResponse.sources?.isNotEmpty == true) {
        isLoading = false;
        sources = sourcesResponse.sources!;
        notifyListeners();
      } else {
        throw "somthing went wrong please try again later";
      }
    } catch (error) {
      isLoading = false;
      errorText = error.toString();
      notifyListeners();
    }
  }
}
