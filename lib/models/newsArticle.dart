import 'dart:convert';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:tour_app/utils/constants.dart';


class NewsArticle {
  
  final String title; 
  final String descrption; 
  final String urlToImage;
  final String url;
  final String publishedAt;
  final String content; 

  NewsArticle({this.title, this.descrption,this.url, this.urlToImage,this.publishedAt,this.content});

  factory NewsArticle.fromJson(Map<String,dynamic> json) {
    return NewsArticle(
      title: json['title'], 
      descrption: json['description'],
      url: json['url'], 
      urlToImage: json['urlToImage'], //?? Constants.NEWS_PLACEHOLDER_IMAGE_ASSET_URL,
      publishedAt: json['publishedAt'],
      content: json['content']

    
    );
  
}

  static Resource<List<NewsArticle>> get all {
    
    return Resource(
      url: Constants.HEADLINE_NEWS_URL,
      parse: (response) {
        final result = json.decode(response.body); 
        Iterable list = result['articles'];
        return list.map((model) => NewsArticle.fromJson(model)).toList();
      }
    );

  }

}

class Resource<T> {
  final String url; 
  T Function(Response response) parse;

  Resource({this.url,this.parse});
}

class Webservice {

  Future<T> load<T>(Resource<T> resource) async {

      final response = await http.get(resource.url);
      if(response.statusCode == 200) {
        return resource.parse(response);
      } else {
        throw Exception('Failed to load data!');
      }
  }

}