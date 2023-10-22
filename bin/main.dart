import 'dart:io';

import 'package:api_app_mid/city_api_client.dart';
import 'package:api_app_mid/city_details_client.dart';

void main(List<String> arguments) async {
  print('Enter a city name: ');
  final cityName = stdin.readLineSync();

  if (cityName == null || cityName.isEmpty) {
    print('City name is required.');
    return;
  }

  final findCity = CityApiClient();

  try {
    final cityInfo = await findCity.getCityInfo(cityName);
    for (var info in cityInfo){
       print('City info for $cityName');
       print(info);
       print('---------------------------\n');

    }
  } on SocketException catch (_) {
    print(
        'Could not fetch city info data. Check your internet connection!');
  } catch (e) {
    print(e);
  }
// Второй запрос плейс айди
  print('Enter a Place Id: ');
  final placeId = stdin.readLineSync();

  if (placeId == null || placeId.isEmpty) {
    print('Place id is required.');
    return;
  }
  final findCityDets = CityDetailsClient();

  try {
    final cityDets = await findCityDets.getCityDetailsInfo(placeId);
    for (var info in cityDets){
       print('City details for $placeId');
       print(info);
       print('---------------------------\n');

    }
  } on SocketException catch (_) {
    print(
        'Could not fetch city info data. Check your internet connection!');
  } catch (e) {
    print(e);
  }
}





































  // print('Enter a place Id: ');
  // final placeId = stdin.readLineSync();
  // if (placeId == null || placeId.isEmpty) {
  //   print('place Id is required.');
  //   return;

  // try {
  //   final uri =
  //       Uri.https('maps.googleapis.com', '/maps/api/place/details/json', {
  //     'place_id': placeId,
  //     'key': apiKey,
  //   });

  //   final requestt = await httpClientt.getUrl(uri);
  //   final response = await requestt.close();

  //   if (response.statusCode == HttpStatus.ok) {
  //     final responseBody = await response.transform(utf8.decoder).join();
  //     final data = json.decode(responseBody);
  //     final viewport = data['viewport'];

  //     if (viewport.isNotEmpty) {
  //       print('\nSearch viewport by $placeId\n');
  //       for (var viewports in viewport) {
  //         print(viewports);
  //         print("---------------------------'\n'");
  //       }
  //     } else {
  //       print('No results found for $placeId');
  //     }
  //   } else {
  //     print('HTTP Error: ${response.statusCode}');
  //   }
  // } finally {
  //   httpClientt.close();
  // }
