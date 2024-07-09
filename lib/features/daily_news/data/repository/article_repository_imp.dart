
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:news_app_clean_architecture/constants/constants.dart';
import 'package:news_app_clean_architecture/core/resources/data_state.dart';
import 'package:news_app_clean_architecture/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:news_app_clean_architecture/features/daily_news/data/models/article.dart';
import 'package:news_app_clean_architecture/features/daily_news/domain/entities/article.dart';
import 'package:news_app_clean_architecture/features/daily_news/domain/repository/article_repository.dart';

class ArticleRepositoryImp implements ArticlesRepository{

  final NewsApiService _newsApiService ;
  ArticleRepositoryImp(this._newsApiService);
  @override
  Future<DataState<List<ArticleModel>>> getNewsArticles() async{
  try{
    final htttpResponse =await
   _newsApiService.getNewsArticles(
   apiKey: newsAPIKey,
     country: countryQuery,
     category: categoryQuery
   );
    if(htttpResponse.response.statusCode == HttpStatus.ok){
      return DataSuccess(htttpResponse.data);
    }
    else {
      return DataFailed(
          DioError(
              error: htttpResponse.response.statusMessage,
              response: htttpResponse.response,
              type: DioErrorType.response,
              requestOptions: htttpResponse.response.requestOptions
          )
      );
    }
    }on DioError catch(e){
    return DataFailed(e);
  }
  }

}