import 'package:app/features/AddTrip/data/models/trip_model.dart';
import 'package:app/features/Dashboard/data/models/fetched_trip_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TripServices {
  static Future<List<FetchedTrip>> getTrips(String? bearerToken) async {
    String url = 'http://192.168.244.77:3000/api/trips';
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          "Accept": "application/json",
          'Authorization': 'Bearer $bearerToken',
        },
      );
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        List<FetchedTrip> trips = data.map((json) => FetchedTrip.fromJson(json)).toList();
        return trips;
      } else {
        throw Exception('Failed to load trips');
      }
    } catch (e) {
      throw Exception('Failed to load trips: $e');
    }
  }

  static Future<void> AddTrip(Trip trip, String bearerToken) async {
    final requestBody = trip.toJson();
    // Convert the request body to JSON
    final jsonBody = jsonEncode(requestBody);
    print(jsonBody.toString());
    // Define the URL
    String url = 'http://192.168.244.77:3000/api/trips';

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
      print('Trip created successfully');
      // Optionally, print the response body for debugging purposes
      print(response.body);
    } catch (e) {
      print('Error creating trip: $e');
    }
  }
}
