import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'article.dart';

class NewsResponse {
  final String status;
  final int totalResults;
  final List<Article> articles;
  NewsResponse({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  NewsResponse copyWith({
    String? status,
    int? totalResults,
    List<Article>? articles,
  }) {
    return NewsResponse(
      status: status ?? this.status,
      totalResults: totalResults ?? this.totalResults,
      articles: articles ?? this.articles,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'status': status,
      'totalResults': totalResults,
      'articles': articles.map((x) => x.toMap()).toList(),
    };
  }

  factory NewsResponse.fromMap(Map<String, dynamic> map) {
    return NewsResponse(
      status: map['status'] as String,
      totalResults: map['totalResults'].toInt() as int,
       articles: List<Article>.from((map['articles'] as List<dynamic>).map<Article>((x) => Article.fromMap(x as Map<String,dynamic>),),),
    );
  }

  String toJson() => json.encode(toMap());

  factory NewsResponse.fromJson(String source) => NewsResponse.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'NewsResponse(status: $status, totalResults: $totalResults, articles: $articles)';

  @override
  bool operator ==(covariant NewsResponse other) {
    if (identical(this, other)) return true;
  
    return 
      other.status == status &&
      other.totalResults == totalResults &&
      listEquals(other.articles, articles);
  }

  @override
  int get hashCode => status.hashCode ^ totalResults.hashCode ^ articles.hashCode;
}