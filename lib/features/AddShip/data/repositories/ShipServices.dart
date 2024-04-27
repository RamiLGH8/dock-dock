import 'package:app/features/AddShip/data/models/ship_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class ShipServices{
   static Future<void> AddShip(Ship ship, String bearerToken) async {
    final requestBody = ship.toJson();
    // Convert the request body to JSON
    final jsonBody = jsonEncode(requestBody);

    // Define the URL
    String url = 'http://192.168.244.77:3000/api/ships';

    try {
      // Make the POST request
      var response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          "Accept": "application/json",
          'Authorization': 'Bearer $bearerToken',
        },
        body: jsonBody,
      );

      // Check if the request was successful

      print('Ship created successfully');

      // Optionally, print the response body for debugging purposes
      print(response.body);
    } catch (e) {
      print('Error creating ship: $e');
    }
  }
}