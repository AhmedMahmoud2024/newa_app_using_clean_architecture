import 'package:news_app_clean_architecture/core/resources/data_state.dart';
import 'package:news_app_clean_architecture/core/usecases/usecase.dart';
import 'package:news_app_clean_architecture/features/daily_news/domain/entities/article.dart';
import 'package:news_app_clean_architecture/features/daily_news/domain/repository/article_repository.dart';

class GetAarticleUseCase implements UseCase<DataState<List<ArticleEntity>>,void>{
 final ArticlesRepository _articlesRepository ;

  GetAarticleUseCase(this._articlesRepository);
  @override
  Future<DataState<List<ArticleEntity>>> call({void params}) {
 return _articlesRepository.getNewsArticles();
  }

}