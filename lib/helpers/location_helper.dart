import 'dart:convert';

import 'package:http/http.dart' as http;

const G_MAPS_API_KEY = 'AIzaSyDWbijk5AX-Y1FujpuCgQz7Pq7G8npGPZQ';

const G_MAPS_SIGNATURE = "QgDzNXyqOQ1ORLLKfUeTThkJWfw=";

class LocationHelper {
  static String generateLocationPreviewImage(
      {required String latitude, required String longitude}) {
    return "https://maps.googleapis.com/maps/api/staticmap?center=&$latitude,$longitude&zoom=16&size=600x300&maptype=roadmap&markers=color:red%7Clabel:A%7C$latitude,$longitude&key=$G_MAPS_API_KEY";
  }

  static Future<String> getPlaceAddress(double lat, double lng) async {
    final url = Uri.parse(
        "https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$lng&key=$G_MAPS_API_KEY");
    final response = await http.get(url);
    return json.decode(response.body)['results'][0]['formatted_address'];
  }
}
