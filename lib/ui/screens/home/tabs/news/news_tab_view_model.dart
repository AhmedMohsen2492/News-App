import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_route/data/repositories/news_repo/data_sources/offline_data_source.dart';
import 'package:news_route/data/repositories/news_repo/data_sources/online_data_source.dart';
import 'package:news_route/data/model/sources_response.dart';
import 'package:news_route/data/repositories/news_repo/news_repo.dart';

class NewsTabViewModel extends Cubit<NewTabStates> {
  NewsRepo newsRepo = NewsRepo(OnlineDataSource(), OfflineDataSource());

  NewsTabViewModel() : super(NewsTabLoadingState());

  void getSource(String categoryId) async {
    emit(NewsTabLoadingState());
    try {
      SourcesResponse? sourcesResponse = await newsRepo.getSources(categoryId);

      if (sourcesResponse != null &&
          sourcesResponse.sources?.isNotEmpty == true) {
        emit(NewsTabSuccessState(sourcesResponse.sources!));
      } else {
        throw "somthing went wrong please try again later";
      }
    } catch (error) {
      emit(NewsTabErrorState(error.toString()));
    }
  }
}

abstract class NewTabStates {}

class NewsTabLoadingState extends NewTabStates {}

class NewsTabSuccessState extends NewTabStates {
  List<Source> sources;

  NewsTabSuccessState(this.sources);
}

class NewsTabErrorState extends NewTabStates {
  String errorMessage;

  NewsTabErrorState(this.errorMessage);
}
