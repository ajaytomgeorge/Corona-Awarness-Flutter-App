import 'dart:async'; 
import 'dart:convert'; 
import 'package:http/http.dart' as http;
import 'package:tour_app/models/guidlines.dart'; 
List<Guidlines> parseGuidlines(String responseBody) { 
   final parsed = json.decode(responseBody).cast<Map<String, dynamic>>(); 
   return parsed.map<Guidlines>((json) =>Guidlines.fromJson(json)).toList(); 
} 
Future<List<Guidlines>> fetchGitGuidlineURLS() async { 
   final response = await http.get('https://ajaytomgeorge.github.io/flutterapp/guidliness_model.json'); 
   if (response.statusCode == 200) { 
      return parseGuidlines(response.body); 
   } else { 
      throw Exception('Unable to fetch products from the REST API');
   } 
}