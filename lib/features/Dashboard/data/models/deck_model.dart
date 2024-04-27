import 'package:app/features/AddTrip/data/models/trip_model.dart';

class Deck {
  final String id;
  final String name;
  final int height;
  final int width;
  final Trip trip;

  Deck({
    required this.id,
    required this.name,
    required this.height,
    required this.width,
    required this.trip,
  });

  factory Deck.fromJson(Map<String, dynamic> json) {
    return Deck(
      id: json['id'],
      name: json['name'],
      height: json['height'],
      width: json['width'],
      trip: Trip.fromJson(json['trip']), // Assuming Trip has a fromJson method
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['height'] = this.height;
    data['width'] = this.width;
    data['trip'] = this.trip.toJson(); // Assuming Trip has a toJson method
    return data;
  }
}
