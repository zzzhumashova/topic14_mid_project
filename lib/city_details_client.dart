import 'dart:convert';

import 'package:api_app_mid/citydetails.dart';
import 'package:api_app_mid/config2.dart';
import 'package:http/http.dart' as http;

class CityDetailsClient {
  Future<List<CityDetails>> getCityDetailsInfo(String placeId) async {
    // https://maps.googleapis.com/maps/api/place/details/json?place_id=ChIJCUa1fcSARUIRKJKx3Y0U-Zc&key=AIzaSyDSc3bK2uacejfepEMiJlrVw9DFC8WVonI
     final url =
        '${Config().baseUrl}$placeId${Config().currentUrl}${Config().apiKey}';
    print(url);

    final response = await http.get(Uri.parse(url));
    
    if (response.statusCode != 200) {
      print('Request failed with status: ${response.statusCode}');
      throw Exception('Error getting weather for $placeId');
    }
    
    final Map<String, dynamic> jsonResponse = Map.castFrom(jsonDecode(response.body));
    if (jsonResponse.isEmpty) {
      throw Exception('$placeId not found');
    }
    List<CityDetails> list = [];

    final details = jsonResponse['result'];
    if (details is List) {
  // Если details является списком, используйте его как есть
      list = details.map((det) => CityDetails.fromJson(det)).toList();
    }else if (details is Map<String, dynamic>) {
  // Если details является мапом, добавьте его как один элемент в список
      list.add(CityDetails.fromJson(details));
    }

    return list;
  }
}
// https://maps.googleapis.com/maps/api/place/autocomplete/json?input=Almaty&language=en&types=%28cities%29&?key=AIzaSyDSc3bK2uacejfepEMiJlrVw9DFC8WVonI
// https://maps.googleapis.com/maps/api/place/autocomplete/json?input=Man&language=pt_BR&types=%28cities%29&key=AIzaSyDSc3bK2uacejfepEMiJlrVw9DFC8WVonI