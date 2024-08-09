import 'package:hive/hive.dart';
import 'package:news_route/data/model/sources_response.dart';

class OfflineDataSource {
  Future<SourcesResponse?> getSources(String categoryId) async {
    var box = await Hive.openBox('tabs');
    Map? json = box.get(categoryId);
    if (json == null) return null;
    SourcesResponse sourcesResponse = SourcesResponse.fromJson(json);
    return sourcesResponse;
  }

  void saveSources(SourcesResponse sourcesResponse, String categoryId) async {
    var box = await Hive.openBox('tabs');
    await box.put(categoryId, sourcesResponse.toJson());
    box.close();
  }
}
