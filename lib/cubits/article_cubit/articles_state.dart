// ignore_for_file: must_be_immutable

part of 'articles_cubit.dart';

@immutable
sealed class ArticlesState {}

final class ArticlesInitial extends ArticlesState {}
class ArticlesSuccess extends ArticlesState {
  
  dynamic articles={} ;
  ArticlesSuccess({required this.articles});
}

class ArticlesFailed extends ArticlesState {}

class ArticlesLoading extends ArticlesState {}

class SingleArticlesSuccess extends ArticlesState {
  
 dynamic article={} ;
 
  SingleArticlesSuccess({required this.article});
}

class SingleArticlesFailed extends ArticlesState {}

class SingleArticlesLoading extends ArticlesState {}