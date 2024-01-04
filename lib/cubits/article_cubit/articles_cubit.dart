import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'dart:convert';
import '../../services/articles_servise.dart';

part 'articles_state.dart';

class ArticlesCubit extends Cubit<ArticlesState> {
  ArticlesCubit() : super(ArticlesInitial());
  void getArticles() async {
    emit(ArticlesLoading());

    ArticlesService.getArticles().then((response) async {
      if (response.statusCode == 200) {
        dynamic responseData = jsonDecode(response.body);
      

        emit(ArticlesSuccess(articles: responseData));
      } else {
       
        emit(ArticlesFailed());
      }
    });
  }



  void getSingleArticle(String id) async {
   
    emit(SingleArticlesLoading());

    ArticlesService.getSingleArticle(id).then((response) async {
      if (response.statusCode == 200) {
        dynamic responseData = jsonDecode(response.body);

        
        emit(SingleArticlesSuccess(article: responseData));
      } else {
        
       
        emit(SingleArticlesFailed());
      }
    });
  }
}
