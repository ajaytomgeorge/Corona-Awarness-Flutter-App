import 'dart:convert';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:tour_app/utils/constants.dart';


class UpActivity {
  
  final String imageUrl;
  final String name;
  final String type;
  final String startTimes;
  final String phoneno;

  UpActivity({
    this.imageUrl,
    this.name,
    this.type,
    this.startTimes,
  
    this.phoneno,

  });

  factory UpActivity.fromJson(Map<String,dynamic> json) {
    return UpActivity(
      imageUrl: json['imageUrl'],
      name: json['name'],
      type: json['type'], 
      startTimes: json['startTimes'] ,
      phoneno: json['phoneno'],
      

    
    );
  
}

  static Resource<List<UpActivity>> get all {
    
    return Resource(
      url: 'http://192.168.1.5:8000/keralaactivites.json',
      parse: (response) {
        final result = json.decode(response.body); 
        //Iterable list = result['articles'];
        Iterable list = result;
        return list.map((model) => UpActivity.fromJson(model)).toList();
      }
    );

  }

}

   Resource<List<UpActivity>> aller(String url) {
    
    return Resource(
      url: url,
      parse: (response) {
        final result = json.decode(response.body); 
        //Iterable list = result['articles'];
        Iterable list = result;
        return list.map((model) => UpActivity.fromJson(model)).toList();
      }
    );

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