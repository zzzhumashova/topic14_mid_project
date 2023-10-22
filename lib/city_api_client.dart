import 'dart:convert';

import 'package:api_app_mid/city.dart';
import 'package:api_app_mid/config1.dart';
import 'package:http/http.dart' as http;

class CityApiClient {
  Future<List<City>> getCityInfo(String cityName) async {
     final url =
        '${Config().baseUrl}$cityName${Config().currentUrl}${Config().apiKey}';
    print(url);

    final response = await http.get(Uri.parse(url));
    
    if (response.statusCode != 200) {
      print('Request failed with status: ${response.statusCode}');
      throw Exception('Error getting weather for $cityName');
    }
    
    final Map<String, dynamic> jsonResponse = Map.castFrom(jsonDecode(response.body));
    if (jsonResponse.isEmpty) {
      throw Exception('$cityName not found');
    }
    List<City> list  = [];
    final  predictions = jsonResponse['predictions'];
      for (var prediction in predictions) {
        list.add(City.fromJson(prediction));
      }
    return list;
  }
}

// class CityApiException implements Exception {
//   final String message;

//   const CityApiException(this.message);
// }



// https://maps.googleapis.com/maps/api/place/autocomplete/json?input=Almaty&language=en&types=%28cities%29&?key=AIzaSyDSc3bK2uacejfepEMiJlrVw9DFC8WVonI
// https://maps.googleapis.com/maps/api/place/autocomplete/json?input=Man&language=pt_BR&types=%28cities%29&key=AIzaSyDSc3bK2uacejfepEMiJlrVw9DFC8WVonI