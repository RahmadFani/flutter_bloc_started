import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:location_repository/location_repository.dart';

class LocationRepository {
  LocationRepository();

  String apiKey = 'AIzaSyAv-NMNRBz-nOIo4zHZ8O-KnNluzTdzNCQ';

  String url = 'https://maps.googleapis.com/maps/api/place/autocomplete/json?';

  Future<List<LocationModel>> getPlace(String text) async {
    final response =
        await http.get(Uri.parse(url + 'input=$text&radius=1500&key=$apiKey'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      List predictions = data['predictions'];
      final locationModels = predictions.map((prediction) {
        return LocationModel(
          prediction['description'],
          prediction['place_id'],
        );
      }).toList();

      return locationModels;
    } else {
      return [];
    }
  }
}
