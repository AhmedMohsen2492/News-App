import 'package:news_route/data/model/sources_response.dart';
import 'package:news_route/data/repositories/news_repo/data_sources/offline_data_source.dart';
import 'package:news_route/data/repositories/news_repo/data_sources/online_data_source.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class NewsRepo {
  OfflineDataSource offlineDataSource;
  OnlineDataSource onlineDataSource;

  NewsRepo(this.onlineDataSource, this.offlineDataSource);

  Future<SourcesResponse?> getSources(String categoryId) async {
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      SourcesResponse response = await onlineDataSource.getSources(categoryId);
      offlineDataSource.saveSources(response, categoryId);
      return response;
    } else {
      return offlineDataSource.getSources(categoryId);
    }
  }
}
