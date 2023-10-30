import 'package:news_route/data/model/sources_response.dart';
import 'package:news_route/data/repositories/news_repo/data_sources/offline_data_source.dart';
import 'package:news_route/data/repositories/news_repo/data_sources/online_data_source.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class NewsRepo {
  OfflineDataSource offlineDataSource;
  OnlineDataSource onlineDataSource;
  NewsRepo(this.onlineDataSource, this.offlineDataSource);

  Future<SourcesResponse?> getSources(String categoryId) async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.wifi ||
        connectivityResult == ConnectivityResult.mobile) {
      SourcesResponse response = await onlineDataSource.getSources(categoryId);
      offlineDataSource.saveSources(response,categoryId);
      return response;
    } else {
      return offlineDataSource.getSources(categoryId);
    }
  }
}
