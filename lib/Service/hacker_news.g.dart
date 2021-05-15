// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hacker_news.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HackerNews on HackerNewsBase, Store {
  final _$newsListAtom = Atom(name: 'HackerNewsBase.newsList');

  @override
  List<dynamic> get newsList {
    _$newsListAtom.reportRead();
    return super.newsList;
  }

  @override
  set newsList(List<dynamic> value) {
    _$newsListAtom.reportWrite(value, super.newsList, () {
      super.newsList = value;
    });
  }

  final _$newsAtom = Atom(name: 'HackerNewsBase.news');

  @override
  List<News> get news {
    _$newsAtom.reportRead();
    return super.news;
  }

  @override
  set news(List<News> value) {
    _$newsAtom.reportWrite(value, super.news, () {
      super.news = value;
    });
  }

  final _$newsLimitAtom = Atom(name: 'HackerNewsBase.newsLimit');

  @override
  int get newsLimit {
    _$newsLimitAtom.reportRead();
    return super.newsLimit;
  }

  @override
  set newsLimit(int value) {
    _$newsLimitAtom.reportWrite(value, super.newsLimit, () {
      super.newsLimit = value;
    });
  }

  final _$HackerNewsBaseActionController =
      ActionController(name: 'HackerNewsBase');

  @override
  dynamic increaseNewsLimit() {
    final _$actionInfo = _$HackerNewsBaseActionController.startAction(
        name: 'HackerNewsBase.increaseNewsLimit');
    try {
      return super.increaseNewsLimit();
    } finally {
      _$HackerNewsBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getNewsList() {
    final _$actionInfo = _$HackerNewsBaseActionController.startAction(
        name: 'HackerNewsBase.getNewsList');
    try {
      return super.getNewsList();
    } finally {
      _$HackerNewsBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
newsList: ${newsList},
news: ${news},
newsLimit: ${newsLimit}
    ''';
  }
}
