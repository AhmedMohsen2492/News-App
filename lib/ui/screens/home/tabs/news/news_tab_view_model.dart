import 'package:flutter/cupertino.dart';
import 'package:news_route/data/api/api_manager.dart';
import 'package:news_route/data/model/sources_response.dart';

class NewsTabViewModel extends ChangeNotifier {
  List<Source> sources = [];
  bool isLoading = true;

  String? errorText;

  void getSource(String categoryId) async {
    isLoading = true;
    notifyListeners();
    try {
      sources = await ApiManager.getSources(categoryId);
      isLoading = false;
      notifyListeners();
    } catch (error) {
      isLoading = false;
      errorText = error.toString();
      notifyListeners();
    }
  }
}
