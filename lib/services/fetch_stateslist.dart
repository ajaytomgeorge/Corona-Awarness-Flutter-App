import 'package:tour_app/models/states_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
 
class Services {
  static const String url = 'https://ajaytomgeorge.github.io/flutterapp/stateslist.json';
 
  static Future<List<IndianState>> getIndianStates() async {
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        List<IndianState> list = parseIndianStates(response.body);
        return list;
      } else {
        throw Exception("Error");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
 
  static List<IndianState> parseIndianStates(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<IndianState>((json) => IndianState.fromJson(json)).toList();
  }
}